import React from 'react';

const Post = () => {
    return (
        <div class="col s12 m6 l4">
            <div class="card">
                <div class="card-image">
                    <img height="200" width="100" src="https://lorempixel.com/120/120/nature/6"></img>
                </div>
                <div class="card-content">
                    <h5>Post Category</h5>
                    <p> Post Detail I am a very simple card. I am good at containing small bits of information.
                    I am convenient because I require little markup to use effectively.</p>
                </div>
                <div class="card-action">
                    <span className='left'>Timestamp</span>
                    <span className='right'>Location</span>
                    <br></br>
                </div>
            </div>
        </div>
    )
}
export default Post;
