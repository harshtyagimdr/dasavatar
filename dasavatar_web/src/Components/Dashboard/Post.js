import React, { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';
import ProfileImage from './Profile/ProfileImage';
import { connect } from 'react-redux'
import {firestoreConnect} from 'react-redux-firebase'
import {compose} from 'redux'
const Post = (props) => {
    
    const {post,user_details}=props;
    const [user,setUser]=useState();
    useEffect(()=>{
        if(user_details && post){
           const user=user_details?user_details[post?.user_id]:null;
            setUser(user)
            
        }
    },[user_details, post?.uid])

    return (
        <div className="col s12 m6 l4">
            <Link to={`/post/${post.id}`}>
                <div className="card hoverable black-text">
                    <div className='row center-align valign-wrapper profile-name'>
                        <div className='col s1'></div>
                        <div className='col s2 card-upper-image'>
                        <br></br>
                            {post?.identity &&  <ProfileImage height="30" width="30" className="circle" imgUrl={user?.imgUrl} />}
                        </div>
                        <div className='col s8 valign-wrapper card-upper-text'>
                         {post?.identity &&  <span className=''>{user?.name}</span>}
                        </div>
                        <div className='col s1'></div>
                    </div>
                    <div className="row">
                        <div className='col s1'></div>
                        <div className='col s10'>
                        <img className='post-image responsive-img' height="150" width="300" src={post.imageUrl!='' && post?.imageUrl!=undefined?post?.imageUrl:"https://lorempixel.com/120/120/nature/6"} style={{height:150}}></img>
                        </div>
                    </div>
                    <div className="card-content">
                    <h5 className='post-category'>{post?.category}</h5>
                        <p> {post?.description}</p>
                    </div>
                   
                </div>
            </Link>
        </div>
    )
}
const mapStateToProps=(state)=>{
   
    return{
    user_details: state?.firestore?.data?.user_details,
    }
  }

    
  export default compose(
    connect(mapStateToProps),
    firestoreConnect([
      {collection:'user_details'},
      
    ])
  )(Post);
