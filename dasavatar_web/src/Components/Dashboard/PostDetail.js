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
                <h4>On Time At Location</h4>
            </div>
            <div className='center'>
                <img className='post-image responsive-img' height="200" width='350' src="https://lorempixel.com/120/120/nature/6"></img>
            </div>
            <div className='row'>
                <h5>Post Category</h5>
                <p>
                Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolor fuga veniam vel voluptates consectetur laudantium nulla minima amet magnam eaque illo accusamus blanditiis pariatur facilis praesentium, eveniet voluptas alias maxime? Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolor fuga veniam vel voluptates consectetur laudantium nulla minima amet magnam eaque illo accusamus blanditiis pariatur facilis praesentium, eveniet voluptas alias maxime? Lorem ipsum, dolor sit amet consectetur adipisicing elit. Dolor fuga veniam vel voluptates consectetur laudantium nulla minima amet magnam eaque illo accusamus blanditiis pariatur facilis praesentium, eveniet voluptas alias maxime?
                </p>
            </div>
            <div className='row'>
                <h6>Posted by   </h6>
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