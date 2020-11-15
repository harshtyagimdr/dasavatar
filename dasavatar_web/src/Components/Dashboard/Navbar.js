import React from "react";
import {Link, NavLink} from 'react-router-dom';

const NavBar = () => {
    return (
        <div>
            <nav style={{backgroundColor: "#226089"}} className="nav-wrapper">
                <div className="container">
                    <Link className="brand-logo left" to="/">DasAvatar</Link>
                    <ul className="right">
                        <li><NavLink to="/profile"><i class="material-icons">person_outline</i></NavLink></li>
                        <li><NavLink to="/profile">Logout</NavLink></li>
                    </ul>
                </div>
            </nav> 
        </div>

    )
}

export default NavBar;
