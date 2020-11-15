import React from 'react';
import { Link } from 'react-router-dom';

const PostDetail = () => {
    return (
        <div className='container'>
            <div style={{backgroundColor:"#6699cc"}} className='row'>
                <Link to="/">
                    <div className='col s1'>
                        <i class="material-icons white-text right-align">arrow_back</i>
                    </div>
                </Link>
                <div className='col s11'>
                </div>
            </div>
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

export default PostDetail;