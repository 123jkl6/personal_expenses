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
      //height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Container(
                      //height: constraints.maxHeight * 0.1,
                      child: FittedBox(child: const Text("No transactions added yet. ")),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          //ListView.builder will rebuild and assign different color to the same transaction.
          : ListView(
              children: transactions
                  .map(
                    (tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTransaction: deleteTransaction,
                    ),
                  )
                  .toList(),
            ),
    );
  }
}
