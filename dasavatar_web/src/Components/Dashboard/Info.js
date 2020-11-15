import React from 'react';
import InfoImage from './Info/InfoImage';
import InfoAbout from './Info/InfoAbout';

const Info = () => {
    return (
        <div className='container'>
            <InfoImage />
            <h2>About</h2>
            <InfoAbout />
            <h2>Meet Our Team</h2>
            <div className='row'>
                <div className='col s12 m6 l3'>
                    <div className="card team">
                        <div className="card-image">
                            <img className='responsive-img im' height="200" src="https://i.imgur.com/p06zIah.jpg" width="100" height='100'></img>
                        </div>
                        <div className="card-content cc">
                            <h5>Harsh Tyagi</h5>
                            <p className=''>Web and App Developer</p>
                        </div> 
                    </div>
                </div>
                <div className='col s12 m6 l3'>
                    <div className="card team">
                        <div className="card-image">
                            <img className='responsive-img im' src="https://i.imgur.com/xy4eBrO.jpg" width="100" height='100'></img>
                        </div>
                        <div className="card-content cc">
                            <h5>Harsh Aggarwal</h5>
                            <p className=''>Web and App Developer</p>
                        </div> 
                    </div>
                </div>
                <div className='col s12 m6 l3'>
                    <div className="card team">
                        <div className="card-image">
                            <img className='responsive-img im' src="https://i.imgur.com/OjivaWC.jpg" width="100" height='100'></img>
                        </div>
                        <div className="card-content cc">
                            <h5>Kartikeya Sharma</h5>
                            <p className=''>Web and App Developer</p>
                        </div> 
                    </div>
                </div>
                <div className='col s12 m6 l3'>
                    <div className="card team">
                        <div className="card-image">
                            <img className='responsive-img im' src="https://i.imgur.com/LQBsAmZ.jpg" width="100" height='100'></img>
                        </div>
                        <div className="card-content cc">
                            <h5>Alankar Saxena</h5>
                            <p className=''>Full Stack Web Developer</p>
                        </div> 
                    </div>
                </div>
            </div>
            <h2>Advantages</h2>
            <div className='row'>
                <div className='col s1'></div>
                <div className='col s11'>
                    <ol className='flow-text'>
                        <li>
                        In today’s covid-19 situation, mass gathering could be reported just by the use of fingertips so that police may take the required action.
                        </li>
                        <li>
                        Crimes like kidnapping and theft can be anonymously reported.
                        </li>
                        <li>
                        At the time of accident, any person nearby or hospital could help the injured in time and save his/her life.
                        </li>
                        <li>
                        People know what’s happening around the world but don’t know if a robbery or accident took place in the next lane, the 10 km notification thing would help them know and if possible, they could help as well. Maybe the incident could have happened with their loved ones.
                        </li>
                        <li>
                        It is simple to use and convenient as everyone today has a smartphone with a camera and an internet connection.
                        </li>
                    </ol>
                </div>
            </div>
            <h2>Features</h2>
            <div className='row'>
                <div className='col s1'></div>
                <div className='col s11'>
                <ul className='flow-text'>
                    <li>
                        Applications
                        <div className='row'>
                            <div className='col s1'></div>
                            <div className='col s11'>
                                <ol>
                                    <li>
                                        Feed part - In which all registered user can see the post which will be within radius of 10 km.
                                    </li>
                                    <li>
                                        Create post - If anyone is seeing something wrong there then they will be able to generate post.
                                    </li>
                                    <li>
                                        Profile - In which user can see and update their personal details.
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </li>
                    <li>
                        Web
                        <div className='row'>
                            <div className='col s1'></div>
                            <div className='col s11'>
                                <ol>
                                    <li>
                                        Feed part - In which all registered user can see the post which will be within radius of 10 km.
                                    </li>
                                    <li>
                                        Profile part - In which user can see and update their personal details.
                                    </li>
                                </ol>
                            </div>
                        </div>
                    </li>
                </ul>   
            </div>
        </div>
        <h2>Technology Stack</h2>
        <div className='row'>
                <div className='col s1'></div>
                <div className='col s11'>
                    <ol className='flow-text'>
                        <li>
                        Flutter for Application development
                        </li>
                        <li>
                        React for website
                        </li>
                        <li>
                        Firebase for database
                        </li>
                        <li>
                        ML for recognition part
                        </li>
                    </ol>
                </div>
            </div>
        </div>
    )
}

export default Info;