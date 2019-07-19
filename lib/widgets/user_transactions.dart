import "package:flutter/material.dart";
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/new_transaction.dart';
import 'package:personal_expenses/widgets/transaction_list.dart'; 

class UserTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  UserTransactions({this.transactions,this.deleteTransaction}); 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions: transactions,),
      ],
    );
  }
}