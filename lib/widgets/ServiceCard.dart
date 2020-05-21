import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_style_client/screens/ServiceDetail.dart';

class ServiceCard extends StatelessWidget {
  final DocumentSnapshot service;

  ServiceCard(this.service);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceDetail(service)));
      },
      child: Card(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  service.data['urlImage'],
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Barbearia 01',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 20),
                      maxLines: 1,
                    ),
                    SizedBox(height: 10),
                    Text(
                      service.data['serviceName'],
                      style: TextStyle(fontSize: 16),
                      maxLines: 1,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text('5Km'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.grade,
                              color: Theme.of(context).primaryColor,
                            ),
                            Text('10')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('R\$: ${service.data['price']}',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16)),
                    ),
                  ],
                ),
              ))
            ]),
      ),
    );
  }
}
