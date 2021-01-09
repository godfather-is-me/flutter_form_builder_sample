/* import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class TableLayout extends StatefulWidget {
  @override
  _TableLayoutState createState() => _TableLayoutState();
}

class _TableLayoutState extends State<TableLayout> {
  List<List<dynamic>> data = [];

  loadAsset() async {
    final myData = await rootBundle.loadString("assets/sales.csv");
    List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);

    data = csvTable;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () async {
            await loadAsset();
            print(data);
          }),
      appBar: AppBar(
        title: Text("Table Layout and CSV"),
      ),
      body: SingleChildScrollView(
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(100.0),
            1: FixedColumnWidth(200.0),
          },
          border: TableBorder.all(width: 1.0),
          children: data.map((item) {
            return TableRow(
                children: item.map((row) {
              return Container(
                color:
                    row.toString().contains("NA") ? Colors.red : Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    row.toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              );
            }).toList());
          }).toList(),
        ),
      ),
    );
  }
}

/* import 'dart:io';
import 'dart:async';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CsvApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(
        storage: Storage(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  final Storage storage;

  Home({@required this.storage});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  String state;
  Future<Directory> _appDocDir;

  @override
  void initState() {
    super.initState();
    widget.storage.readData().then((String value) {
      setState(() {
        state = value;
      });
    });
  }

  Future<File> writeData() async {
    setState(() {
      state = controller.text;
      controller.text = '';
    });

    return widget.storage.writeData(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSV Reader'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${state ?? "File is empty"}'),
            TextField(
              controller: controller,
            ),
            RaisedButton(
              onPressed: writeData,
              child: Text('Write to file'),
            ),
          ],
        ),
      ),
    );
  }
}

class Storage {
  // A getter for current directory
  Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  // A getter for file object of given name at current directory
  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/db.txt');
  }

  // Function to read data as a String
  Future<String> readData() async {
    try {
      final file = await localFile;
      String body = await file.readAsString();
      return body;
    } catch (e) {
      return e.toString();
    }
  }

  // Function to write the given data onto the file
  Future<File> writeData(String data) async {
    final file = await localFile;
    return file.writeAsString('$data');
  }
}
 */
 */
