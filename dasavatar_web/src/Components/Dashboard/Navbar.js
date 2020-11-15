import React from "react";
import {Link, NavLink} from 'react-router-dom';
import ProfileImage from "./Profile/ProfileImage";
import {connect} from 'react-redux'
import {signOut} from '../../Store/actions/authActions';
import {firestoreConnect} from 'react-redux-firebase'
import {compose} from 'redux'

const NavBar = (props) => {
    const {auth,user_details}=props;
    return (
        <div>
            <nav style={{backgroundColor: "#226089"}} className="nav-wrapper">
                <div className="container">
                    <Link className="brand-logo left" to="/">DasAvatar</Link>
                    {auth?.uid &&<ul className="right">
                        <li className='info'><NavLink to="/profile"><i className="material-icons">info_outline</i></NavLink></li>
                        <li><NavLink to="/profile">
                            <ProfileImage height="35" width="35" className="nav-profile circle" imgUrl={user_details?.imgUrl} /></NavLink></li>
                        <li className='info'><a onClick={props.signOut}><i className="fa fa-sign-out material-icons"></i></a></li>
                    </ul>}
                </div>
            </nav> 
        </div>

    )
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
      signOut:()=>dispatch(signOut())
    }
  }
    
  export default compose(
    connect(mapStateToProps,mapDispatchToProps),
    firestoreConnect([
      {collection:'user_details'},
      
    ])
  )(NavBar);
