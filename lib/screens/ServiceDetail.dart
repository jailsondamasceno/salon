import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_style_client/models/Service.dart';
import 'package:my_style_client/screens/ServiceTimes.dart';


class ServiceDetail extends StatefulWidget {
  final DocumentSnapshot service;
  ServiceDetail(this.service);

  @override
  _ServiceDetailState createState() => _ServiceDetailState(service);
}

class _ServiceDetailState extends State<ServiceDetail> {
  final DocumentSnapshot service;
  _ServiceDetailState(this.service);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(service.data['serviceName']),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
         Padding(
           padding: EdgeInsets.all(10),
           child:  AspectRatio(
             aspectRatio: 1,
             child: Image.network(
               service.data['urlImage'],
               fit: BoxFit.cover,
             ),
           ),
         ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Barbearia 01',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  service.data['serviceName'],
                  style: TextStyle(fontSize: 16)
                ),
                SizedBox(height: 10),
                Text(
                  service.data['description'],
                  style: TextStyle(fontSize: 15),
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
                Padding(
                  padding: EdgeInsets.only(top: 16, bottom: 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceTimes(service)));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffc30664),
                            Color(0xff930184),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(80.0)),
                      ),
                      child: Container(
                        constraints:
                        BoxConstraints(minWidth: 88.0, minHeight: 55.0),
                        alignment: Alignment.center,
                        child: Text(
                          'Contratar',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

