import React, { Component } from 'react'
import {Redirect,Link} from 'react-router-dom';
import {connect} from 'react-redux';
import {signUp} from '../../Store/actions/authActions';
import './style.css';

class SignUp extends Component {
  state = {
    email: '',
    password: '',
    firstName: '',
    lastName: '',
  }
  handleChange = (e) => {
    this.setState({
      [e.target.id]: e.target.value
    })
  }
  handleSubmit = (e) => {
    e.preventDefault();
    // console.log(this.state);
    this.props.signUp(this.state);
  }
  componentDidMount() {
    const location= JSON.parse(window.localStorage.getItem('location'));
    if(location){
      this.getAddress(location?.latitude,location?.longitude)
    }
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
 getAddress(lat,lng) { 
  var latitude = "latitude=" + lat;
  var longitude = "&longitude=" + lng;
  var query = latitude + longitude + "&localityLanguage=en";

  const Http = new XMLHttpRequest();

  var bigdatacloud_api =
    "https://api.bigdatacloud.net/data/reverse-geocode-client?";

  bigdatacloud_api += query;

  Http.open("GET", bigdatacloud_api);
  Http.send();

  Http.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var myObj = JSON.parse(this.responseText);
      console.log(myObj);
    }
  }
}

  render() {
    const {auth,authError}=this.props
    if (auth.uid)return <Redirect to="/"></Redirect>
    return (
      <div className="app">

    <div className="bg" style={{height:591}}></div>
    
    <form>
    <h1 style={{color:'white'}}>DasAvatar</h1>
        <header style={{height:125}}>
            <img src="https://assets.codepen.io/3931482/internal/avatars/users/default.png?format=auto&height=80&version=1592223909&width=80"/>
        </header>
        
        <div className="inputs">
        <input type="email" id='email' onChange={this.handleChange} placeholder={'Email Address'} required/>
        <input type="password" id='password' onChange={this.handleChange} placeholder={'Password'} required />
        <input type="text" id='firstName' onChange={this.handleChange} placeholder={'First Name'} required/>
        <input type="text" id='lastName' onChange={this.handleChange} placeholder={'Last Name'} required/>

            {authError ? <p style={{color:'black'}}>{authError}</p>:null}
        </div>

    </form>

    <footer>
        <button onClick={this.handleSubmit}>Continue</button>
        <p> Have an account? <Link to="/signin">Sign In</Link></p>
    </footer>


</div>
    )
  }
}
const mapStateToProps=(state)=>{
  return{

  auth:state.firebase.auth,
  authError:state.auth.authError
  }
}
const mapDispatchToProps=(dispatch)=>{
  return{
    signUp:(newUser)=>dispatch(signUp(newUser))
  }
}

export default connect(mapStateToProps,mapDispatchToProps)(SignUp)
