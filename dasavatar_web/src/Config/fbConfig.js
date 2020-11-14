import firebase from 'firebase/app'
import 'firebase/firestore'
import 'firebase/auth'

var firebaseConfig = {
    apiKey: "AIzaSyAw5cyBsE6qCexTjHbUR_e5aoHuwDpGHVU",
    authDomain: "hackathon-952dc.firebaseapp.com",
    databaseURL: "https://hackathon-952dc.firebaseio.com",
    projectId: "hackathon-952dc",
    storageBucket: "hackathon-952dc.appspot.com",
    messagingSenderId: "1031947606592",
    appId: "1:1031947606592:web:11ab08c90278ee01041da5",
    measurementId: "G-RQ6BJ14C0Z"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);


  export default firebase;