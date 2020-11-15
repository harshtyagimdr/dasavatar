import React from 'react';
import {connect} from 'react-redux'
import {firestoreConnect} from 'react-redux-firebase'
import {compose} from 'redux'
import {Redirect} from 'react-router-dom';


const PostDetail = (props) => {
    const {post,auth}=props;
    if (!auth.uid)return <Redirect to="/signin"></Redirect>
    console.log(post)
    return (
        <div className='container'>
            <div className='row'>
            </div>
            <div className='center'>
                <img className='post-image responsive-img' height="200" width='350' src={post?.imageUrl || "https://lorempixel.com/120/120/nature/6"}></img>
            </div>
            <div className='row'>
    <h5>{post?.category}</h5>
                <p>
                    {post?.description}
                </p>
            </div>
            {post?.addressString &&<div className='row'>
                <h6>Location: {post?.addressString}   </h6>
            </div>}
            <div className='row'>
                <h6>Date: {post?.created_at}   </h6>
            </div>
        </div>
    )
}
const mapStateToProps=(state,ownProps)=>{
    const id = ownProps.match.params.id;
    const posts=state.firestore.data.posts;
    const post=posts?posts[id]:null
    return{
        post:post,
        auth:state.firebase.auth
    }
  }
  export default compose(
    connect(mapStateToProps),
    firestoreConnect([{
      collection:'posts'
    }])
  )(PostDetail);