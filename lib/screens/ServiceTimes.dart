import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceTimes extends StatefulWidget {
  final DocumentSnapshot service;
  ServiceTimes(this.service);
  @override
  _ServiceTimesState createState() => _ServiceTimesState(service);
}

class _ServiceTimesState extends State<ServiceTimes> {
  final DocumentSnapshot service;
  _ServiceTimesState(this.service);
  Firestore db = Firestore.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Horários Disponíveis'),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: db
              .collection('services')
              .document(service.documentID)
              .collection('availableTimes')
              .getDocuments(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            else
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            '${snapshot.data.documents[index].data['sunday']}'),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            '${snapshot.data.documents[index].data['saturday']}'),
                      ],
                    );
                  });
          },
        ));
  }
}
