import React from 'react';
import Post from './Post';
import { connect } from 'react-redux'
import {firestoreConnect} from 'react-redux-firebase'
import {compose} from 'redux'
import {Redirect} from 'react-router-dom';
 
const Dashboard=(props)=>{
    if (!props?.auth?.uid)return <Redirect to="/signin"></Redirect>
    return(
        <div>
            <div className='container'>
                <h3 className='header'>Recent Posts</h3>
                <div className='row'>
                    {props?.posts?.map(post=>{
                        return <Post key={post.id} post={post}/>
                    })}
                </div>
            </div>
        </div>
    )
}
const mapStateToProps = (state) => {
    return {
    posts: state.firestore.ordered.posts,
      auth:state.firebase.auth,
    }
  }
  
  export default compose(
    connect(mapStateToProps),
    firestoreConnect([
      {collection:'posts',orderBy:['created_at','desc']},
    ])
  )(Dashboard);
