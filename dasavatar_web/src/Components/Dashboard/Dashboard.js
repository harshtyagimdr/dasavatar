import React from 'react';
import Post from './Post';
 
const Dashboard=()=>{
    return(
        <div>
            <div className='container'>
                <h3 className='header'>Recent Posts</h3>
                <div className='row'>
                    <Post />
                    <Post />
                    <Post />
                    <Post />
                </div>
            </div>
        </div>
    )
}
export default Dashboard;
