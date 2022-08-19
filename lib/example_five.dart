import 'dart:convert';

import 'package:api_tutorial/Models/ProductsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LastExampleScreen extends StatefulWidget {
  const LastExampleScreen({Key? key}) : super(key: key);

  @override
  State<LastExampleScreen> createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {
  Future<ProductsModel> getProductsApi() async{
    final response=await http.get(Uri.parse('https://webhook.site/1186d97b-df42-486d-96d9-fd82535e5c15'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
      {

        return  ProductsModel.fromJson(data);

      }else
        {
          return  ProductsModel.fromJson(data);
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
        Expanded(child: FutureBuilder<ProductsModel>(
            future: getProductsApi(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                    itemCount: snapshot.data!.data!.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Text(index.toString())
                        ],
                      );
                    });
              }else{
                return Text('Loading');
              }
        }))
      ],
      ),
    );
  }
}
