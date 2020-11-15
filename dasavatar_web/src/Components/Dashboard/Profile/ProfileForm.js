import React, { Component } from 'react';

class ProfileForm extends Component {

    state = {
        name: null,
        phone: null,
        date: null,
        image: null,
        location: null
    }

    handleChange = (e) => {
        this.setState({
          [e.target.id]: e.target.value
        });
    }

    handleSubmit = (e) => {
        e.preventDefault();
        console.log(this.state);
    }

    render() {
        return (
            <div className="row">
                <form className="col s12" onSubmit={this.handleSubmit}>
                    <div className="row">
                        <div className="input-field col s12">
                            <input id="name" type="text" onChange={this.handleChange} className="validate"></input>
                            <label htmlFor="name">Name</label>
                        </div>
                    </div>
                    <div className="row">
                        <div className="input-field col s6">
                            <input type='tel' id='phone' onChange={this.handleChange} className="validate"></input>
                            <label htmlFor="phone">Phone</label>
                        </div>
                        <div className="input-field col s6">
                            <input type='date' id='date' onChange={this.handleChange} className="datepicker"></input>
                            <label htmlFor="date">Date of Birth</label>
                        </div>
                    </div>
                    <div className='row'>
                        <div className=" col s12 file-field input-field">
                            <div style={{backgroundColor:"#226089"}} className="btn">
                                <span><i className="material-icons">file_upload</i></span>
                                <input id='image' onChange={this.handleChange} type="file"></input>
                            </div>
                            <div className="file-path-wrapper">
                                <input id='image' placeholder='Upload Image' onChange={this.handleChange} className="file-path validate" type="text"></input>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        <div className="input-field col s12">
                            <label>
                                <input id='location' onChange={this.handleChange} type="checkbox"></input>
                                <span>Share Location</span>
                            </label>
                        </div>
                        <div className="col s12">
                            <button style={{backgroundColor:"#226089"}} className="btn right waves-effect waves-light">Update
                                <i className="material-icons right">send</i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        )
    }
}

export default ProfileForm;