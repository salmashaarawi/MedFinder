import 'package:flutter/material.dart';
import 'api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Search App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MedicationSearchPage(),
    );
  }
}

class MedicationSearchPage extends StatefulWidget {
  @override
  _MedicationSearchPageState createState() => _MedicationSearchPageState();
}

class _MedicationSearchPageState extends State<MedicationSearchPage> {
  final APIService apiService = APIService();
  String query = '';
  dynamic medicationData;

  void searchMedication() async {
    try {
      final result = await apiService.searchMedication(query);
      setState(() {
        medicationData = result;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                query = value;
              },
              decoration: InputDecoration(
                labelText: 'Search medication',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: searchMedication,
              child: Text('Search'),
            ),
            SizedBox(height: 16.0),
            if (medicationData != null)
              Text(
                'Medication Data: ${medicationData.toString()}',
              ),
          ],
        ),
      ),
    );
  }
}
