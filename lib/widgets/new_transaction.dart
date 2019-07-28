import 'dart:io';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widgets/adaptive_flat_button.dart';

import "../models/transaction.dart";

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction({this.addNewTransaction}) {
    print("Consturctor NewTransaction Widget");
  }

  @override
  _NewTransactionState createState() {
    print("createState() NewTransaction");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print("Constructor _NewTransactionState State");
  }

  @override
  void initState() {
    //best practice to call super.initState() first
    super.initState();
    print("initState() _NewTransactionState");
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print("didUpdateWidget() NewTransaction");
    super.didUpdateWidget(oldWidget);
  }

  void _presenDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        _selectedDate = date;
      });
    });
  }

  @override
  void dispose() {
    print("dispose() NewTransaction");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              //CupertinoTextField(placeholder: "",),
              TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                controller: _titleController,
                onChanged: (value) {},
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
                controller: _amountController,
                //numberWithOptions to accomodate iOS
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) {},
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text(
                      _selectedDate == null
                          ? "No date chosen. "
                          : "Picked date : ${DateFormat.yMMMd().format(_selectedDate)}",
                    ),
                    AdaptiveFlatButton(
                      text: "Choose Date",
                      handler: _presenDatePicker,
                    ),
                  ],
                ),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                color: Theme.of(context).accentColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () {
                  print("Title : " + _titleController.text);
                  print("Amount : " + _amountController.text);

                  if (_titleController.text.isEmpty ||
                      _amountController.text.isEmpty ||
                      double.parse(_amountController.text) <= 0 ||
                      _selectedDate == null) {
                    return;
                  }
                  widget.addNewTransaction(
                    _titleController.text,
                    double.parse(_amountController.text),
                    _selectedDate,
                  );
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
