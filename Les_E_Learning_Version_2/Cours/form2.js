import React, { Component } from 'react';
import axios from 'axios';

class Form2 extends Component {

  state = {
    titre: '',
    image: null
  };

  handleChange = (e) => {
    this.setState({
      titre: e.target.value
    })
  };

  handleImageChange = (e) => {
    this.setState({
      image: e.target.files[0]
    })
  };

  handleSubmit = (e) => {
    e.preventDefault();

    let form_data = new FormData();
    form_data.append('image', this.state.image, this.state.image.name);
    form_data.append('titre', this.state.titre);
    let url = 'http://localhost:8000/api/TestCreate';
    axios.post(url, form_data, {
      headers: {
        'content-type': 'multipart/form-data'
      }
    })
        .then(res => {
          console.log(res.data);
        })
        .catch(err => console.log(err))
  };

  render() {
    return (
      <div className="App">
        <form onSubmit={this.handleSubmit}>
          <p>
            <input type="text" placeholder='Titre' id='titre' value={this.state.titre} onChange={this.handleChange} required/>
          </p>
        
          <p>
            <input type="file"
                   id="image"
                   accept="file/pdf"  onChange={this.handleImageChange} required/>
          </p>
          <input type="submit"/>
        </form>

        
      </div>
    );
  }
}

export default Form2;