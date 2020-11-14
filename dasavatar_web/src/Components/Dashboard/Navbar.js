import React from "react";
import {Link, NavLink} from 'react-router-dom';

const NavBar = () => {
    return (
        <nav className="nav-wrapper blue darken-2">
            <div className="container">
                <Link className="brand-logo" to="/">DasAvatar</Link>
                <ul className="right">
                    <li><NavLink to="/">Dashboard</NavLink></li>
                    <li><NavLink to="/profile">Profile</NavLink></li>
                </ul>
            </div>
        </nav> 
    )
}

export default NavBar;
