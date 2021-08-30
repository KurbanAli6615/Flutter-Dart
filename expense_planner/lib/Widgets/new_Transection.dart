import 'package:flutter/material.dart';

class NewTransection extends StatefulWidget {
  final Function? addTx;
  NewTransection({this.addTx});

  @override
  _NewTransectionState createState() => _NewTransectionState();
}

class _NewTransectionState extends State<NewTransection> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    } else {}

    widget.addTx!(
      titleController.text,
      double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                "Add Transection",
                style: TextStyle(
                  color: Colors.purple,
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
