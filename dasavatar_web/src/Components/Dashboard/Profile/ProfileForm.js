import React, { Component } from 'react';
import ProfileImage from './ProfileImage';
import {connect} from 'react-redux'
import {firestoreConnect} from 'react-redux-firebase'
import {compose} from 'redux';
import {Redirect} from 'react-router-dom';

class ProfileForm extends Component {
    
    state = {
        name: null,
        phone: null,
        date: null,
        image: null,
        isLocationUpdate: false
    }

    handleChange = (e) => {
        this.setState({
          [e.target.id]: e.target.value
        });
    }

    handleSubmit = (e) => {
        e.preventDefault();
        
        console.log(this.state);
    }

    render() {
        const {auth,user_details}=this.props;
        if (!auth.uid)return <Redirect to="/signin"></Redirect>
        return (
            <>
            <div className='center' style={{marginTop:10}}>
                        <ProfileImage height="200" width="200" className='circle responsive-img' />
                <h6>{user_details?.email}</h6>
                    </div>
            <div className="row">
                <form className="col s12" onSubmit={this.handleSubmit}>
                    <div className="row">
                        <div className="input-field col s12">
                            <input id="name" type="text" onChange={this.handleChange} className="validate" defaultValue={user_details?.name} placeholder={'Name'}></input>
                        </div>
                    </div>
                    <div className="row">
                        <div className="input-field col s6">
                            <input type='tel' id='phone' onChange={this.handleChange} className="validate" placeholder={'Phone No.'} defaultValue={user_details?.phoneNumber}></input>
                        </div>
                        <div className="input-field col s6">
                            <input type='date' id='date' onChange={this.handleChange} className="datepicker" defaultValue={user_details?.dob} placeholder={"Date of Birth"}></input>
                        </div>
                    </div>
                    <div className='row'>
                        <div className=" col s12 file-field input-field">
                            <div style={{backgroundColor:"#226089"}} className="btn">
                                <span><i className="material-icons">file_upload</i></span>
                                <input id='image' onChange={this.handleChange} type="file"></input>
                            </div>
                            <div className="file-path-wrapper">
                                <input id='image' placeholder='Update Image' onChange={this.handleChange} className="file-path validate" type="text"></input>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        <div className="input-field col s12">
                            <label>
                                <input id='location' onChange={()=>this.setState({
                                    ...this.state,
                                    isLocationUpdate:!this.state.isLocationUpdate
                                })} type="checkbox"></input>
                                <span>Update Location</span>
                            </label>
                        </div>
                        <div className="col s12">
                            <button style={{backgroundColor:"#226089"}} className="btn right waves-effect waves-light">Update
                                <i className="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            </>
        )
    }
}
const mapStateToProps=(state)=>{
    let users_details;
    let id;
    if(state?.firebase?.auth?.uid){
        id=state?.firebase?.auth?.uid;
        users_details=state?.firestore?.data?.user_details;
        
    }
    const user=users_details?users_details[id]:null
    return{
    auth:state.firebase.auth,
    user_details: user,
    }
  }
    
  export default compose(
    connect(mapStateToProps),
    firestoreConnect([
      {collection:'user_details'},
      
    ])
  )(ProfileForm);