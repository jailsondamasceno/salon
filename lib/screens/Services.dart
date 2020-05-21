import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_style_client/models/Service.dart';
import 'package:my_style_client/widgets/CustomDrawer.dart';
import 'package:my_style_client/widgets/ServiceCard.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Filtro',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ),
        ),
        drawer: CustomDrawer(),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection('services').getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return Container(
                  decoration: BoxDecoration(color: Colors.white),
                  padding: EdgeInsets.all(10),
                  child: GridView.builder(
                      padding: EdgeInsets.all(4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          childAspectRatio: 0.70),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return ServiceCard(snapshot.data.documents[index]);
                      }),
                );
            }));
  }
}
