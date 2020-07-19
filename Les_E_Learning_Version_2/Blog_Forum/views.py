

from django.shortcuts import render,redirect,get_object_or_404
# from Forum.models import *
# from django.contrib import messages
# from django.contrib.auth.models import User
# from django.db.models import Q 
# from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
# from django.contrib.auth.decorators import login_required
# from datetime import datetime

def Blog(request):
    return render(request,'Blog_Forum/blog.html',locals())
    
# def posts(request):
#     query = request.GET.get('q')
#     posts_list = Post.objects.all()
#     r_posts = Post.objects.all().order_by('-id')[:4]
#     if query:
#         posts_list = Post.objects.filter(
#             Q(title__icontains=query)|
#             Q(author__username__icontains=query)|
#             Q(content__icontains=query)
#         )
#     paginator = Paginator(posts_list,6)
#     page = request.GET.get('page')
#     try : 
#         posts = paginator.page(page)
#     except PageNotAnInteger:
#         posts = paginator.page(1)
#     except EmptyPage:
#         posts = paginator.page(paginator.num_pages)
#     if request.method == 'POST':
#         title = request.POST['title']
#         content = request.POST['content']
#         post = Post()
#         post.author = request.user
#         post.title = title
#         post.content = content
#         post.status = status
#         try :
#             post.photo= request.FILES["photo"]
#         except :
#             print('Pas de photo de profil')
#         post.save()
#         return redirect("list_post")
#     context = {
#         'posts':posts,
#         'r_posts':r_posts
#     }
#     return render(request,'Forum/list_post.html',context)

# def detail_post(request,id):
#     post = get_object_or_404(Post,id=id)
#     r_posts = Post.objects.all().order_by('-id')[:4]
#     comments = Comments.objects.filter(post=post)
#     is_liked = False
#     if post.likes.filter(id=request.user.id).exists():
#         is_liked = True
#     if request.method == 'POST':
#             content = request.POST["content"]
#             comment = Comments()
#             comment.user = request.user
#             comment.post = post
#             comment.comment_content = content
#             comment.save()
#             messages.success(request,'Votre commentaire a été ajouté avec succès !')
#     context = {
#         'post':post,
#         'r_posts':r_posts,
#         'comments':comments,
#         'is_liked':is_liked,
#     }
#     return render(request,'Forum/detail_post.html',context)

# def like_post(request):
#     post_id = request.POST.get('post_id')
#     post = get_object_or_404(Post, id=request.POST.get('post_id'))
#     is_liked = False
#     if post.likes.filter(id=request.user.id).exists():
#         post.likes.remove(request.user)
#         is_liked = False
#     else:
#         post.likes.add(request.user)
#         is_liked = True
#     return redirect("detail_post",post_id)

    
        