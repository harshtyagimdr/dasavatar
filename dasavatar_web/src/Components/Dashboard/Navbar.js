import React from "react";
import {Link, NavLink} from 'react-router-dom';
import ProfileImage from "./Profile/ProfileImage";

const NavBar = () => {
    return (
        <div>
            <nav style={{backgroundColor: "#226089"}} className="nav-wrapper">
                <div className="container">
                    <Link className="brand-logo left" to="/">DasAvatar</Link>
                    <ul className="right">
                        <li className='info'><NavLink to="/profile"><i className="material-icons">info_outline</i></NavLink></li>
                        <li><NavLink to="/profile">
                            <ProfileImage height="35" width="35" className="nav-profile circle responsive-img" /></NavLink></li>
                        <li className='info'><NavLink to="/profile"><i className="fa fa-sign-out material-icons"></i></NavLink></li>
                    </ul>
                </div>
            </nav> 
        </div>

    )
}

export default NavBar;
