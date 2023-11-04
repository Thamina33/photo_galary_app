import 'package:flutter/material.dart';
import 'package:photo_galary_app/PhotoResp.dart';

class PhotoDetailsScreen extends StatelessWidget {
   PhotoDetailsScreen({super.key , required this.photo});
  PhotoResp photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Photo Details"
        ),

      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Image.network(photo.url ?? ""),
            ),
            const SizedBox(height: 12,),
            Text("Title: ${photo.title.toString()}"
              ,style: const TextStyle(
              fontSize: 14,
                fontWeight: FontWeight.w400

            ),
            ),
            const SizedBox(height: 12,),
            Text("ID: ${photo.id.toString()}",style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400
            ),),
          ],
        ),
      ),
    );
  }
}
