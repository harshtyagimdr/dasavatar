import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';
import { createStore, applyMiddleware, compose } from 'redux'
import rootReducer from './Store/reducers/rootReducer'
import { Provider } from 'react-redux'
import thunk from 'redux-thunk'
import { createFirestoreInstance, getFirestore, reduxFirestore } from 'redux-firestore'
import { ReactReduxFirebaseProvider, getFirebase } from 'react-redux-firebase'
import fbConfig from './Config/fbConfig'
import firebase from 'firebase/app'
import { useSelector  } from 'react-redux'
import { isLoaded  } from 'react-redux-firebase';
import Loader from 'react-loader-spinner'

const store = createStore(
  rootReducer,
  compose(
      applyMiddleware(thunk.withExtraArgument({ getFirestore, getFirebase })),
      reduxFirestore(firebase, fbConfig)
  )
);
const rrfProps = {
  firebase,
  config: fbConfig,
  dispatch: store.dispatch,
  createFirestoreInstance
  
};
function AuthIsLoaded({ children }) {
  const auth = useSelector(state => state.firebase.auth)
  if (!isLoaded(auth)) return <div className=" container center "><Loader
  type="ThreeDots"
  color="#00BFFF"
  height={100}
  width={100}
  timeout={3000} //3 secs

/></div>;
      return children
}
ReactDOM.render(<Provider store={store}> 
  <ReactReduxFirebaseProvider {...rrfProps}>
   <AuthIsLoaded><App /> </AuthIsLoaded></ReactReduxFirebaseProvider></Provider>,
    document.getElementById('root'));

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
