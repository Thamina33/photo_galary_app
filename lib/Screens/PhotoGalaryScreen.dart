import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:photo_galary_app/PhotoResp.dart';
import 'package:photo_galary_app/Screens/PhotoDetailsScreen.dart';

class PhotoGalaryScreen extends StatefulWidget {
  const PhotoGalaryScreen({super.key});

  @override
  State<PhotoGalaryScreen> createState() => _PhotoGalaryScreenState();
}

class _PhotoGalaryScreenState extends State<PhotoGalaryScreen> {
  bool inProgress = true;

  List<PhotoResp> productList = [];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList()async{
    productList.clear();
    inProgress = true;
    setState(() {

    });
    Response response = await get(Uri.parse("https://jsonplaceholder.typicode.com/photos"),);

      print(response.statusCode);
      print(response.body);

    if(response.statusCode == 200){

      Iterable l = json.decode(response.body);
      productList = List<PhotoResp>.from(l.map((model)=> PhotoResp.fromJson(model)));

setState(() {

});
    }
    else{
      print("Server Error: ${response.statusCode}");
    }

    inProgress = false;
    print("Product: ${productList.length}");
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Photo Galary App"),
      ),
      body:inProgress ? Center(
        child: CircularProgressIndicator(),
      ) :ListView.separated(
          itemBuilder: (context , index){
            return  ListTile(
              onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> PhotoDetailsScreen(
                     photo: productList[index],
                   )));
              },
              leading: Image.network(productList[index].thumbnailUrl ?? "", width: 150, height: 150,fit: BoxFit.fill,),
              title: Text(productList[index].title.toString()),
            );
          },
          separatorBuilder: (_ ,__) => const Divider(),
          itemCount:productList.length),
    );
  }
}
