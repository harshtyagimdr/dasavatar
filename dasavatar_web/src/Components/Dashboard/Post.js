import React from 'react';
import ProfileImage from './Profile/ProfileImage';

const Post = () => {
    return (
        <div className="col s12 m6 l4">
            <a href="#">
            <div className="card hoverable black-text">
                <div className='row valign-wrapper'>
                    <div className='col s1'></div>
                    <div className='col s2 card-upper-text'>
                    <br></br>
                        <ProfileImage height="30" width="30" className="circle responsive-img" />
                    </div>
                    <div className='col s10 card-upper-text'>
                        <br></br>
                        <span className='valign-wrapper'>Posted by : "Username"</span>
                    </div>
                </div>
                <div className="row">
                    <div className='col s1'></div>
                    <div className='col s10'>
                    <img className='post-image responsive-img' height="200" width="300" src="https://lorempixel.com/120/120/nature/6"></img>
                    </div>
                </div>
                <div className="card-content">
                    <h5 className='post-category'>Post Category</h5>
                    <p> Post Detail I am a very simple card. I am good at containing small bits of information.</p>
                </div>
                <div className="card-action">
                    <span className='left'>Location</span>
                    <br></br>
                </div>
            </div>
        </a>
        </div>
    )
}
export default Post;
