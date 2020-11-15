import React, { Component } from 'react'
import {connect} from 'react-redux'
import {signIn} from '../../Store/actions/authActions'
import {Redirect,Link} from 'react-router-dom';
import './style.css'

class SignIn extends Component {
  state = {
    email: '',
    password: ''
  }
  handleChange = (e) => {
    this.setState({
      [e.target.id]: e.target.value
    })
  }
  handleSubmit = (e) => {
    e.preventDefault();
    // console.log(this.state);
    this.props.signIn(this.state);
  }
  render() {
    const {authError,auth}=this.props
    if (auth.uid)return <Redirect to="/"></Redirect>
    return (
    <div className="app">

		<div className="bg"></div>
        
		<form className='signin-form'>
        <h5 style={{color:'white'}}>DasAvatar</h5>
			<header>
				<img src="https://assets.codepen.io/3931482/internal/avatars/users/default.png?format=auto&height=80&version=1592223909&width=80"/>
			</header>
            
			<div className="inputs">
            <input type="email" id='email' onChange={this.handleChange} placeholder={'Email Address'} required/>
            <input type="password" id='password' onChange={this.handleChange} placeholder={'Password'} required />

				{authError ? <p style={{color:'black'}}>{authError}</p>:null}
			</div>

		</form>

		<footer className='auth-footer'>
			<button className='auth-button' onClick={this.handleSubmit}>Continue</button>
			<p>Don't have an account? <Link to="/signup">Sign Up</Link></p>
		</footer>


	</div>
    )
  }
}
const mapStateToProps=(state)=>{
  return{
  authError:state.auth.authError ,
  auth:state.firebase.auth
  }
}
const mapDispatchToprops=(dispatch)=>{
  return{
    signIn:(creds)=>dispatch(signIn(creds))
  }
}
export default connect(mapStateToProps,mapDispatchToprops)(SignIn)
