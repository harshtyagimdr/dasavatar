import React, { Component } from 'react';
import ProfileImage from './ProfileImage';
import {connect} from 'react-redux'
import {firestoreConnect} from 'react-redux-firebase'
import {compose} from 'redux';
import {Redirect} from 'react-router-dom';
import {profileUpdate} from '../../../Store/actions/authActions';
import firebase from '../../../Config/fbConfig'

class ProfileForm extends Component {
    
    state = {
        name: "",
        phone: "",
        date: "",
        image: "",
        isLocationUpdate: false
    }

    handleChange = (e) => {
        this.setState({
          [e.target.id]: e.target.value
        });
    }
    componentDidMount() {
        if (navigator.geolocation) {
      navigator.geolocation.watchPosition(function(position) {
        const location={
            longitude:position?.coords?.longitude,
            latitude:position?.coords?.latitude,
        }
        window.localStorage.setItem('location', JSON.stringify(location));
 
      });
    }
  }
  _getURL=(bucketName,user)=>{
    let storageReference=firebase.storage().ref()
    storageReference.child(`${bucketName}/${user.uid}`).getDownloadURL().then(
      (url)=>{
        let data={
            ...user,
            imgUrl:url
        }
       
        this.props.profileUpdate(data);
        alert("Your Profile is successfully Updated.")
      } 
    )
    return true;
   
  }
    handleSubmit = (e) => {
        e.preventDefault();
        let location;
        if(this.state.isLocationUpdate){
            location=JSON.parse(window.localStorage.getItem('location'))
        }
        const user={
            name: this.state.name!==""?this.state.name:this.props.user_details?.name ,
            email:this.props.user_details?.email,
            createdAt:new Date().toDateString(),
            deviceToken:this.props.user_details?.deviceToken,
            dob:this.state.date!==""?this.state.date:this.props.user_details?.dob,
            imgUrl:this.props.user_details?.imgUrl,
            phoneNumber:this.state.phone!==""?this.state.phone:this.props.user_details?.phoneNumber,
            uid:this.props.user_details?.uid,
            longitude:this.state.isLocationUpdate?location.longitude:this.props.user_details?.longitude,
            latitude:this.state.isLocationUpdate?location.latitude:this.props.user_details?.latitude
          }
          if(this.state.image){
        var temp = document.getElementById("image"); 
 
        var selectedFile = temp.files[0];
        let bucketName="user_profile";
       const  fileType = selectedFile.type;
      const validImageTypes = ['image/gif', 'image/jpeg', 'image/png','image/jpg'];
      if (!validImageTypes.includes(fileType)) {
        alert("Please upload valid file");
       
      }else{
            let storageRef=firebase.storage().ref(`${bucketName}/${this.props.user_details.uid}`);
          storageRef.put(selectedFile).then(()=>{this._getURL(bucketName,user)});
      }
    }else{
      
        this.props.profileUpdate(user);
        alert("Your Profile is successfully Updated.")
    }
  
    }

    render() {
        const {auth,user_details}=this.props;
        if (!auth.uid)return <Redirect to="/signin"></Redirect>
        return (
            <>
            <div className='center' style={{marginTop:10}}>
                        <ProfileImage height="200" width="200" className='circle' imgUrl={user_details?.imgUrl}/>
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
  const mapDispatchToProps=(dispatch)=>{
    return{
        profileUpdate:(user)=>dispatch(profileUpdate(user))
    }
  }
    
  export default compose(
    connect(mapStateToProps,mapDispatchToProps),
    firestoreConnect([
      {collection:'user_details'},
      
    ])
  )(ProfileForm);