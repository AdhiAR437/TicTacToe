import 'package:flutter/material.dart';

class cusdi extends StatelessWidget {
  final title;
  final content;
  final VoidCallback callback;
  final actiontt;
  cusdi(this.title,this.callback,this.content,[this.actiontt="Reset"]);
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text(title),
      content: new Text(content),
      actions: <Widget>[
        new FlatButton(onPressed: callback,color: Colors.pink ,child: new Text(actiontt))
      ],
    );
  }
}
