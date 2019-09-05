import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense_app/models/transaction.dart';

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  const TransactionListItem({
    @required this.transaction,
    @required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: FittedBox(
              child: Text(
                '\$${transaction.amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: const TextStyle(fontSize: 12),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                icon: const Icon(Icons.delete),
                label: const Text('Delete'),
                onPressed: () => deleteTransaction(transaction.id),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(transaction.id),
              ),
      ),
    );
  }
}
