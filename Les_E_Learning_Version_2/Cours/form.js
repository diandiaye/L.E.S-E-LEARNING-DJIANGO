import React, {Component} from "react";
import { MDBContainer, MDBRow, MDBCol, MDBBtn, MDBIcon } from 'mdbreact';
import axios from 'axios';
import DocumentsEtudiantServices from '../services/DocumentsEtudiantServices'


class Form extends Component {
    constructor(props) {
        super(props);
        this.state = {  
          date : "",
          typeDocument :  "",
          document : null,
          proprietaire : ""
        }
        // this.handleChangedate = this.handleChangedate.bind(this);
        // this.handleChangedocument = this.handleChangedocument.bind(this);
        // this.handleChangeproprietaire = this.handleChangeproprietaire.bind(this);
        // this.handleChangetypeDocument = this.handleChangetypeDocument.bind(this);


        // this.saveDocumentsEtudiant = this.saveDocumentsEtudiant.bind(this);
        
    }

    handleChangetypeDocument = (event) => {
      this.setState({
        typeDocument: event.target.value,
       
      });
    }

    handleChangedate = (event) => {
      this.setState({
        date: event.target.value,
       
      });
    }

    handleChangedocument = (event) => {
      this.setState({
        document: event.target.files[0],
       
      });
    }

    handleChangeproprietaire = (event) => {
      this.setState({
        proprietaire: event.target.value,
       
      });
    }

    saveDocumentsEtudiant = (event) => {
      event.preventDefault();
  
      let form_data = new FormData();
      form_data.append('document', this.state.document, this.state.document.name);
      form_data.append('date', this.state.date);
      form_data.append('typeDocument', this.state.typeDocument);
      form_data.append('proprietaire', this.state.proprietaire);

      let url = 'http://127.0.0.1:8000/api/DocumentsEtudiantCreate';

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
            <MDBContainer className="mt-5" >
              <MDBRow>
                <MDBCol md="6">
                  <form onSubmit={this.saveDocumentsEtudiant}>
                    <p className="h4 text-center py-4">Subscribe</p>
                    <label htmlFor="defaultFormCardNameEx" class handleChangedocumenName="grey-text font-weight-light">
                      TypeDocument
                    </label>
                    <input  value={this.state.typeDocument} onChange={this.handleChangetypeDocument}  type="text" id="defaultFormCardNameEx" className="form-control" />
                    
                    <label htmlFor="defaultFormCardNameEx" className="grey-text font-weight-light">
                    date
                  </label>
                  <input  value={this.state.date} onChange={this.handleChangedate}  type="date" id="defaultFormCardNameEx" className="form-control" />

                  <label htmlFor="defaultFormCardNameEx" className="grey-text font-weight-light">
                  Proprietaire
                </label>
                <input  value={this.state.proprietaire} onChange={this.handleChangeproprietaire}  type="number" id="defaultFormCardNameEx" className="form-control" />


                    <div className="input-group mt-3">
                    <div className="input-group-prepend">
                      <span className="input-group-text" id="inputGroupFileAddon01">
                        Upload
                      </span>
                    </div>
                    <div className="custom-file">
                      <input
                        type="file"
                        className="custom-file-input"
                        id="inputGroupFile01"
                        accept="file/pdf"
                        aria-describedby="inputGroupFileAddon01"
                        onChange={this.handleChangedocument}
                      />
                      <label className="custom-file-label" htmlFor="inputGroupFile01">
                        Choose file
                      </label>
                    </div>
                  </div>
                    <div className="text-center py-4 mt-3">
                      <MDBBtn className="btn btn-outline-purple" type="submit" >
                        Send
                        <MDBIcon far icon="paper-plane" className="ml-2" />
                      </MDBBtn>
                    </div>
                  </form>
                </MDBCol>
              </MDBRow>
            </MDBContainer>
            );
    }
}
 
export default Form;