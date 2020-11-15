import React from 'react';

const InfoAbout = () => {
    return (
        <div>
            <p className='info-text flow-text'>
                We often come across news and situations where we find people struggling like in a road accident or community gatherings during these pandemic times or someone else who needs help urgently but due to some reason, we ourselves can’t help them. From here we got the idea of developing something which people can use to help others when they can’t. 
            </p>
            <p className='info-text flow-text'>
                Just by installing our app, people would be able to capture the photo of the scene and upload it on our platform where other people as well as certain emergency facility providers would be available. Anyone within the range of approx. 10 km would be notified of that incident happening and the required help can reach them well in time. 
            </p>
            <p className='info-text flow-text'>
                Also, to make it a dependable app, we have applied certain machine learning algorithm which upon upload of photo and selection of category would verify whether the selected category for that photo is legitimate or not and then only would it be posted. 
            </p>
            <p className='info-text flow-text'>
                Also, the users would be given an option of hiding their identity while posting photo, as many times people are afraid of reporting certain situation or crimes.
            </p>
        </div>
    )
}

export default InfoAbout;