
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void addUser(String name,int age){

  FirebaseFirestore.instance.collection("users").add({
    "name":name,
    "age":age,
    "createdAt":FieldValue.serverTimestamp()
  }).then((onValue){
    print("user Add");
  }).catchError((onError){
    print("error $onError");
  });
}

void fetchUsers()async{


  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").get();
  for(var doc in snapshot.docs){
    print(doc["name"]);
  }
}