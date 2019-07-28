import 'dart:math';

import "package:flutter/material.dart";
import "package:intl/intl.dart";

import "../models/transaction.dart";

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;
  //shoudl not call setState in initState
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  void triggerDelete() {
    print("deleting : " + widget.transaction.id);
    widget.deleteTransaction(widget.transaction.id);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    print("build() TranasctionItem");
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: ListTile(
        leading: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: _bgColor, //Theme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
                child: Text("\$${widget.transaction.amount.toString()}")),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: mediaQuery.size.width > 360
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                textColor: Theme.of(context).errorColor,
                label: Text("Delete"),
                onPressed: triggerDelete,
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: triggerDelete,
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
