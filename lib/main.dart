import 'package:flutter/material.dart';
import 'package:notion_api/notion.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        body: Center(
          child: ChangeForm(),
        ),
      ),
    );
  }
}

class ChangeForm extends StatefulWidget {
  @override
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  int _count = 0;

  void _handlePressed() {
    setState(() {
      _count++;
    });
  }

  Widget build(BuildContext context) {
    // NotionClient notion = NotionClient(
    //      token: 'secret_95VBgtjnVZkntYOvHkPGrAV1Os6p4FxgLLc8MR5sW4a');
    final TextEditingController _controller = TextEditingController();

    return Container(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: <Widget>[
            Text(
              "$_count",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500),
            ),
            ElevatedButton(
              onPressed: _handlePressed,
              //color: Colors.blue,
              child: Text(
                '更新',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      //notionDatabaseNotifier.endInput();
                    }),
                border: const OutlineInputBorder(),
                hintText: 'タイトル',
              ),
            )
          ],
        ));
  }
}
