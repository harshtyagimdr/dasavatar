import React, { Component } from 'react';
import ProfileImage from './Profile/ProfileImage';
import ProfileForm from './Profile/ProfileForm';

class Profile extends Component {

    state = {
        email: 'admin@admin.com'
    }

    render() {
        return (
            <div className='container'>
                <div className=''>
                    <br></br>
                    <br></br>
                    <div className='center'>
                        <ProfileImage height="200" width="200" className='circle responsive-img' />
                        <h6>{this.state.email}</h6>
                    </div>
                    <br></br>
                </div>
                <div>
                <ProfileForm />
                </div>
            </div>
        )
    }
}

export default Profile;