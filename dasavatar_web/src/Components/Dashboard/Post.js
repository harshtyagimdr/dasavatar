import React from 'react';
import { Link } from 'react-router-dom';
import ProfileImage from './Profile/ProfileImage';

const Post = () => {
    return (
        <div className="col s12 m6 l4">
            <Link to='/post'>
                <div className="card hoverable black-text">
                    <div className='row center-align valign-wrapper'>
                        <div className='col s1'></div>
                        <div className='col s2 card-upper-image'>
                        <br></br>
                            <ProfileImage height="30" width="30" className="circle responsive-img" />
                        </div>
                        <div className='col s8 valign-wrapper card-upper-text'>
                            <span className=''>"Username"</span>
                        </div>
                        <div className='col s1'></div>
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
            </Link>
        </div>
    )
}
export default Post;
