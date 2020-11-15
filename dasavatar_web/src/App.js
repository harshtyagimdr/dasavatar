import React, { Component } from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom'
import Dashboard from './Components/Dashboard/Dashboard';
import Profile from './Components/Dashboard/Profile';
import Navbar from './Components/Dashboard/Navbar';
import Footer from './Components/Dashboard/Footer';
import PostDetail from './Components/Dashboard/PostDetail';
import SignIn from './Components/Auth/SignIn';
import SignUp from './Components/Auth/SignUp';
import Info from './Components/Dashboard/Info';


class App extends Component {
 render(){
   return(
     <BrowserRouter>
     <div>
     <Navbar />
        <Switch>
            <Route exact path='/'component={Dashboard} />
            <Route path='/profile'component={Profile} />
            <Route path='/post/:id'component={PostDetail} />
            <Route exact path='/signin' component={SignIn} />
            <Route exact path='/signup' component={SignUp} />
            <Route exact path='/about' component={Info} />
           
           
          </Switch>
          <Footer />
     </div>
     </BrowserRouter>
   )
 }
}

export default App;
