import "package:flutter/material.dart";

import "../models/transaction.dart";

import "./transaction_item.dart";

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList({this.transactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                const Text("No transactions added yet. "),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
            //ListView.builder does not allow keys
          : ListView(
              children: transactions
                  .map(
                    (tx) => TransactionItem(
                      key:ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: deleteTransaction,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
