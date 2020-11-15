import React from 'react';
import ProfileImage from './Profile/ProfileImage';
import ProfileForm from './Profile/ProfileForm';

const Profile = () => {
    return (
        <div className='container'>
            <div className=''>
                <br></br>
                <br></br>
                <div className='center'>
                    <ProfileImage height="200" width="200" className='circle responsive-img' />
                </div>
                <br></br>
            </div>
            <div>
               <ProfileForm />
            </div>
        </div>
    )
}

export default Profile;