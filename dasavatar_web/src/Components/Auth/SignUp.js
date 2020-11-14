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
