import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  @override
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  var description;
  var textController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments;
        textController.text = description;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar nota')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: textController,
              maxLines: 4,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, description),
              child: Text('Criar nota'),
            )
          ],
        ),
      ),
    );
  }
}
