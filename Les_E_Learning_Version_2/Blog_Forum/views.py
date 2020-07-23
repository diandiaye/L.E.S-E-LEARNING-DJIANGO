from django.shortcuts import render,redirect,get_object_or_404
from Blog_Forum.models import *
from django.contrib import messages
from django.contrib.auth.models import User
from django.db.models import Q 
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
from django.contrib.auth.decorators import login_required

def posts(request):
    query = request.GET.get('q')
    cat_checked = request.GET.get('cat')
    word_checked = request.GET.get('tag')
    posts_list = Post.objects.all()
    r_posts = Post.objects.all().order_by('-id')[:3]
    poemes = Poeme.objects.all().order_by('-id')[:4]
    if word_checked:
        tag_checked = Tag.objects.get(word=word_checked)
        posts_list = Post.objects.filter(tags=tag_checked)
    if cat_checked:
        posts_list = Post.objects.filter(categorie=cat_checked)
    if query:
        posts_list = Post.objects.filter(
            Q(title__icontains=query)|
            Q(author__username__icontains=query)|
            Q(content__icontains=query)
        )
    paginator = Paginator(posts_list,5)
    page = request.GET.get('page')
    try : 
        posts = paginator.page(page)
    except PageNotAnInteger:
        posts = paginator.page(1)
    except EmptyPage:
        posts = paginator.page(paginator.num_pages)
    if request.method == 'POST':
        title = request.POST['title']
        content = request.POST['content']
        post = Post()
        post.author = request.user
        post.title = title
        post.content = content
        post.status = status
        try :
            post.photo= request.FILES["photo"]
        except :
            print('Pas de photo de profil')
        post.save()
        return redirect("list_post")
    context = {
        'posts':posts,
        'r_posts':r_posts,
        "poemes":poemes
    }
    return render(request,'Blog_Forum/list_post.html',context)

def detail_post(request,id):
    post = get_object_or_404(Post,id=id)
    r_posts = Post.objects.all().order_by('-id')[:4]
    comments = Comments.objects.filter(post=post)
    poemes = Poeme.objects.all().order_by('-id')[:4]
    is_liked = False
    if post.likes.filter(id=request.user.id).exists():
        is_liked = True
    if request.method == 'POST' and request.user.is_authenticated:
        content = request.POST["content"]
        comment = Comments()
        comment.user = request.user
        comment.post = post
        comment.comment_content = content
        comment.save()
        messages.success(request,'Votre commentaire a été ajouté avec succès !')
    context = {
        'post':post,
        'r_posts':r_posts,
        'comments':comments,
        'is_liked':is_liked,
        'poemes':poemes
    }
    return render(request,'Blog_Forum/single-blog.html',context)

@login_required
def like_post(request):
    post_id = request.POST.get('post_id')
    post = get_object_or_404(Post, id=request.POST.get('post_id'))
    is_liked = False
    if post.likes.filter(id=request.user.id).exists():
        post.likes.remove(request.user)
        is_liked = False
    else:
        post.likes.add(request.user)
        is_liked = True
    return redirect("detail_post",post_id)


############################ Forum Part ######################################

def home_forum(request):
    query = request.GET.get('q')
    suj_checked = request.GET.get('sujet')
    messages_list = Message.objects.all().order_by('-id')
    r_messages = Message.objects.all().order_by('-id')[:3]
    poemes = Poeme.objects.all().order_by('-id')[:4]
    if suj_checked:
        messages_list = Message.objects.filter(subjet=suj_checked)
    if query:
        messages_list = Message.objects.filter(
            Q(message__icontains=query)|
            Q(author__last_name__icontains=query)|
            Q(author__first_name__icontains=query)
        )
    discuss = {}
    for m in messages_list:
        discuss[m] = Reponse.objects.filter(message=m)
    is_liked = False
    for m in messages_list:
        if m.likes.filter(id=request.user.id).exists():
            is_liked = True
    context = {
        "discuss":discuss.items(),
        "poemes":poemes,
        "is_liked":is_liked,
        "r_messages":r_messages
    }
    return render(request,"Blog_Forum/home_forum.html",context)
    
@login_required
def like_msg(request):
    msg_id = request.POST.get('msg_id')
    message = get_object_or_404(Message, id=msg_id)
    is_liked = False
    if message.likes.filter(id=request.user.id).exists():
        message.likes.remove(request.user)
        is_liked = False
    else:
        message.likes.add(request.user)
        is_liked = True
    return redirect("forum")

@login_required
def add_reponse(request,id):
    if request.method == "POST":
        msg = get_object_or_404(Message,id=id)
        reponse = request.POST['reponse']

        rps = Reponse()
        rps.message = msg
        rps.reponse = reponse
        rps.author = request.user
        rps.save()
        messages.success(request,"Votre réponse a été ajouté avec succès !")
    return redirect("forum")

@login_required
def add_message(request):
    if request.method == "POST":
        message = request.POST['message']
        sujet = request.POST['sujet']

        msg = Message()
        msg.subjet = sujet
        msg.author = request.user
        msg.message = message
        msg.save()
        messages.success(request,"Votre message a été ajouté avec succès !")
    return redirect("forum")

def poemes(request):
    query = request.GET.get('q')
    list_poemes = Poeme.objects.all().order_by('-id')
    r_poemes = Poeme.objects.all().order_by('-id')[:4]
    r_posts = Post.objects.all().order_by('-id')[:3]
    if query:
        list_poemes = Poeme.objects.filter(
            Q(titre__icontains=query)|
            Q(auteur__first_name__icontains=query)|
            Q(contenu__icontains=query)
        )
    paginator = Paginator(list_poemes,5)
    page = request.GET.get('page')
    try : 
        poemes = paginator.page(page)
    except PageNotAnInteger:
        poemes = paginator.page(1)
    except EmptyPage:
        poemes = paginator.page(paginator.num_pages)
    context = {
        'poemes':poemes,
        'r_poemes':r_poemes,
        'r_posts':r_posts
    }
    return render(request,'Blog_Forum/belle_plume.html',context)    