import 'package:flutter/material.dart';

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Admin App',
      home: PatientListPage(),
    );
  }
}

class PatientListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient List'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Patient 1', style: TextStyle(fontFamily: 'Roboto')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetailPage(patientName: 'Patient 1'),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Patient 2', style: TextStyle(fontFamily: 'Roboto')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetailPage(patientName: 'Patient 2'),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Patient 3', style: TextStyle(fontFamily: 'Roboto')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetailPage(patientName: 'Patient 3'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PatientDetailPage extends StatelessWidget {
  final String patientName;

  PatientDetailPage({required this.patientName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$patientName\'s Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Patient details will be shown here.',
                style: TextStyle(fontFamily: 'Roboto')),
            // You can later replace this with the fetched data from the API
          ],
        ),
      ),
    );
  }
}
