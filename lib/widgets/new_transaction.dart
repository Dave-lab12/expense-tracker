import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addItem;
  NewTransaction(this.addItem);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addItem(
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
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
                onSubmitted: (_) => submitData()),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            // ignore: deprecated_member_use
            FlatButton(
                child: Text(
                  'Add Transaction',
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Theme.of(context).primaryColorDark,
                onPressed: submitData)
          ],
        ),
      ),
    );
  }
}
