import 'dart:convert';
import 'package:api_tutorial/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({Key? key}) : super(key: key);


  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  List<UserModel> userlist=[];
  Future<List<UserModel>>getUser() async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      userlist.clear();
      for(Map i in data){
        userlist.add(UserModel.fromJson(i));
      }
      return userlist;
    }else{
      return userlist;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Course'),
      ),
      body: Column(
        children: [
          Expanded(child:
          FutureBuilder(
              future: getUser(),
              builder: (context,AsyncSnapshot<List<UserModel>> snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              else{
                return ListView.builder(
                    itemCount: userlist.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5,
                          child: Column(
                            children: [
                              Reusable(title: 'Name', value: snapshot.data![index].name.toString()),
                              Reusable(title: 'UserName', value: snapshot.data![index].username.toString()),
                              Reusable(title: 'Email', value: snapshot.data![index].email.toString()),
                              Reusable(title: 'Address', value: snapshot.data![index].address!.city.toString()),
                              Reusable(title: 'Geo', value: snapshot.data![index].address!.geo!.lat.toString()),
                            ],
                          ),
                        ),
                      );
                    });
              }
          }))
        ],
      ),
    );
  }
}
class Reusable extends StatelessWidget {
  String title,value;
  Reusable({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value)
        ],
      ),
    );
  }
}

