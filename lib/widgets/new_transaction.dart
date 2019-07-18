import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import "../models/transaction.dart";

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
    final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
              onChanged: (value) {},
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              //numberWithOptions to accomodate iOS
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onChanged: (value) {},
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Theme.of(context).accentColor,
              onPressed: () {
                print("Title : " + titleController.text);
                print("Amount : " + amountController.text);

                if (titleController.text.isEmpty || amountController.text.isEmpty || double.parse(amountController.text) <= 0 ){
                  return;
                }
                widget.addNewTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
                Navigator.of(context).pop(); 
              },
            ),
          ],
        ),
      ),
    );
  }
}
