import 'package:flutter/material.dart';

void main() => runApp(AdminApp());

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Admin App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: PatientsListScreen(),
    );
  }
}

class PatientsListScreen extends StatelessWidget {
  final List<String> patients = ['John Doe', 'Jane Smith', 'Michael Jordan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient List'),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(patients[index]),
            onTap: () {
              // Navigate to patient details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetailScreen(patients[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PatientDetailScreen extends StatefulWidget {
  final String patientName;
  PatientDetailScreen(this.patientName);

  @override
  _PatientDetailScreenState createState() => _PatientDetailScreenState();
}

class _PatientDetailScreenState extends State<PatientDetailScreen> {
  double _painLevel = 5.0; // Initial pain level value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient: ${widget.patientName}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Progress Assessment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildProgressAssessmentTable(),
            SizedBox(height: 20),
            Text(
              'Pain Scale',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildPainScaleSlider(),
            SizedBox(height: 20),
            Text(
              'Light Exercises',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildExerciseTable(),
            SizedBox(height: 20),
            Text(
              'Nutrition Rehabilitation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildNutritionTable(),
          ],
        ),
      ),
    );
  }

  // Progress Assessment Table
  Widget _buildProgressAssessmentTable() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FixedColumnWidth(100.0),
        },
        children: [
          TableRow(children: [
            _buildTableCell('Day'),
            _buildTableCell('Single Ball'),
            _buildTableCell('Two Ball'),
            _buildTableCell('Three Balls'),
          ]),
          TableRow(children: [
            _buildTableCell('Day 1'),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
          ]),
          // Add more rows as needed
        ],
      ),
    );
  }

  // Pain Scale Slider
  Widget _buildPainScaleSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Slider(
            value: _painLevel,
            min: 0,
            max: 10,
            divisions: 10,
            label: _painLevel.round().toString(),
            onChanged: (double value) {
              setState(() {
                _painLevel = value;
              });
            },
          ),
          Text(
            'Pain Level: ${_painLevel.round()}',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Light Exercises Table
  Widget _buildExerciseTable() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FixedColumnWidth(100.0),
        },
        children: [
          TableRow(children: [
            _buildTableCell('Activity'),
            _buildTableCell('Day 1'),
            _buildTableCell('Day 2'),
            _buildTableCell('Day 3'),
          ]),
          TableRow(children: [
            _buildTableCell('Steps'),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
          ]),
          TableRow(children: [
            _buildTableCell('Walking Distance (km)'),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
          ]),
          // Add more rows as needed
        ],
      ),
    );
  }

  // Nutrition Rehabilitation Table (5 Weeks)
  Widget _buildNutritionTable() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
        border: TableBorder.all(),
        columnWidths: {
          0: FixedColumnWidth(100.0),
        },
        children: [
          TableRow(children: [
            _buildTableCell('Metric'),
            _buildTableCell('Week 1'),
            _buildTableCell('Week 2'),
            _buildTableCell('Week 3'),
            _buildTableCell('Week 4'),
            _buildTableCell('Week 5'),
          ]),
          TableRow(children: [
            _buildTableCell('Weight (Kg)'),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
          ]),
          TableRow(children: [
            _buildTableCell('BMI (Kg/m2)'),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
          ]),
          TableRow(children: [
            _buildTableCell('Albumin Level'),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
            _buildTableCell(''),
          ]),
        ],
      ),
    );
  }

  // Helper method for creating table cells
  Widget _buildTableCell(String content) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(content, style: TextStyle(fontSize: 16)),
    );
  }
}
