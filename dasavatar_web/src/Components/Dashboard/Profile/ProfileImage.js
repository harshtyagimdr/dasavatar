import React from 'react';

const ProfileImage = ({height, width, className,imgUrl}) => {
    return (
        <div>
            <img height={height} width={width} className={className}  src={imgUrl || 'http://source.unsplash.com/200x200/?dogs'}></img>
        </div>
    )
}

export default ProfileImage;