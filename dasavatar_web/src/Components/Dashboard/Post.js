import React from 'react';

const Post = () => {
    return (
        <div className="row">
            <div className="col s12">
                <div className="card horizontal">
                    <div className="card-image">
                        <img className='responsive-img' src="https://lorempixel.com/350/270/nature/6"></img>
                    </div>
                    <div className="card-stacked">
                        <div className="card-content">
                        <h5>Post Category</h5>
                            <p><stong>Post detail </stong>Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore dolor natus sed repellat unde amet in eum? Nemo minus eveniet provident doloremque, tenetur, iure odio in ipsam aliquid cum dicta?</p>
                            <br></br>
                            <p className='green-text darken-5'>Time Stamp & Location</p>
                        </div>
                        <div className=" card-action teal">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    )
}
export default Post;
