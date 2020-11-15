import React from 'react';

const ProfileImage = ({height, width, className}) => {
    return (
        <div>
            <img height={height} width={width} className={className} src='http://source.unsplash.com/200x200/?dogs'></img>
        </div>
    )
}

export default ProfileImage;