import 'package:flutter/material.dart';

class ListNotePage extends StatefulWidget {
  @override
  _ListNotePageState createState() => _ListNotePageState();
}

class _ListNotePageState extends State<ListNotePage> {
  List<String> listNote = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notas'),
        centerTitle: true,
      ),
      body: Container(
        height: 500,
        child: Column(
          children: [
            Container(
              height: 300,
              child: ListView(
                children: [
                  for (var i = 0; i < listNote.length; i++)
                    ListTile(
                      onTap: () async {
                        var description = await Navigator.pushNamed(
                          context,
                          "/create-note",
                          arguments: listNote[i],
                        );
                        if (description != null) {
                          setState(() {
                            listNote[i] = (description as String);
                          });
                        }
                      },
                      onLongPress: () {
                        setState(() {
                          listNote.removeAt(i);
                        });
                      },
                      title: Text(listNote[i]),
                      subtitle: Text('Teste'),
                    )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var description = await Navigator.pushNamed(
                  context,
                  "/create-note",
                );
                if (description != null) {
                  setState(() {
                    listNote.add(description as String);
                  });
                }
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
