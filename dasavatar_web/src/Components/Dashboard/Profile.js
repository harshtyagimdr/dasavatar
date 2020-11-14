import React from 'react';
import ProfileImage from './Profile/ProfileImage';
import ProfileForm from './Profile/ProfileForm';

const Profile = () => {
    return (
        <div className='container'>
            <div className=''>
                <br></br>
                <br></br>
                <ProfileImage />
                <br></br>
                <hr style={{height:5}} className='blue darken-4'></hr>
                <br></br>
            </div>
            <div>
               <ProfileForm />
            </div>
        </div>
    )
}

export default Profile;