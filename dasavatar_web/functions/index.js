const functions = require('firebase-functions');

const admin=require('firebase-admin');
admin.initializeApp(functions.config().firebase);

var msgData;
exports.offersTrigger=functions.firestore.document('posts/{postId}').onCreate(async(snapshot,context)=>{
    msgData=snapshot.data();

    admin.firestore().collection('users').get().then((snapshots)=>
    {
        var tokens=[];
        if(snapshots.empty){
            console.log("No devices");
        }else{
            for (var token of snapshots.docs){
                tokens.push(token.data().token);
            }
            var payload={
                "notification":{
                    "title":"Category " +msgData.category,
                    "body":msgData.message,
                    "sound":"default"
                },
               "data":{
                    "title": msgData.category,
                    "message": msgData.message,
                    
                }
            }
            return admin.messaging().sendToDevice(tokens,payload).then((response)=>{
                console.log("pushed them all");

            }).catch((err)=>{
                console.log(err);
            })
        }
    }
    )
})