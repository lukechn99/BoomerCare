import 'package:flutter/material.dart';
import 'package:scriber/textio.dart';

class ViewDocs extends StatefulWidget {
  @override
  _ViewDocsState createState() => _ViewDocsState();
}

class _ViewDocsState extends State<ViewDocs> {
  TextIo model;
  @override
  void initState() {
    super.initState();
    // Instantiate _controllerKey and _controllerValue
    model = new TextIo();
    print('0. Initialized _json: ${model.json}');
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
        appBar: AppBar(
          title: Text('View Records'),
        ),
        body: FutureBuilder<Map<String, dynamic>>(
            future: model.readJson(),
            builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
              if (snapshot.hasData) {
                var entries = snapshot.data["documents"];
                return ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpansionTile(
                      // height: 50,
                      backgroundColor: Colors.redAccent[50],
                      title: Text(entries[index]["title"]),
                      children: [Center(child: Text('${entries[index]["content"]}'))],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                );
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
