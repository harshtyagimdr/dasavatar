import React from 'react';

const ProfileForm = () => {
    return (
        <div className="row">
            <form className="col s12">
                    <div className="row">
                        <div className="input-field col s6">
                            <input key="first_name" type="text" className="validate"></input>
                            <label for="first_name">First Name</label>
                        </div>
                        <div className="input-field col s6">
                            <input key="last_name" type="text" className="validate"></input>
                            <label for="last_name">Last Name</label>
                        </div>
                    </div>
                    <div className="row">
                        <div className="input-field col s12">
                            <input key="email" type="email" className="validate"></input>
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div className="row">
                        <div className="input-field col s12">
                            <input type='date' key='date' class="datepicker"></input>
                            <label for="date">Date of Birth</label>
                        </div>
                    </div>
                    <button class="btn right waves-effect waves-light">Update
                        <i class="material-icons right">send</i>
                    </button>
                </form>
            </div>
    )
}

export default ProfileForm;