import React, { Component } from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom'
import Dashboard from './Components/Dashboard/Dashboard';
import Profile from './Components/Dashboard/Profile';
import Navbar from './Components/Dashboard/Navbar';
import Footer from './Components/Dashboard/Footer';
import PostDetail from './Components/Dashboard/PostDetail';
import SignIn from './Components/Auth/SignIn';
import SignUp from './Components/Auth/SignUp';


class App extends Component {
 render(){
   return(
     <BrowserRouter>
     <div>
       
        <Switch>
        <Route path='/signin' component={SignIn} />
          <Route path='/signup' component={SignUp} />
        <Navbar />
            <Route exact path='/'component={Dashboard} />
            <Route path='/profile'component={Profile} />
            <Route path='/post'component={PostDetail} />
            <Footer />
           
          </Switch>
       
     </div>
     </BrowserRouter>
   )
 }
}

export default App;
