import 'package:flutter/cupertino.dart';
import 'package:personalexpensive/models/transaction.dart';
import 'package:personalexpensive/widgets/new_transaction.dart';
import 'package:personalexpensive/widgets/transaction_list.dart';

class UserTransactionsWidget extends StatefulWidget {
  const UserTransactionsWidget({Key? key}) : super(key: key);

  @override
  State<UserTransactionsWidget> createState() => _UserTransactionsWidgetState();
}

class _UserTransactionsWidgetState extends State<UserTransactionsWidget> {
  final List<Transaction> _transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 16.53,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         NewTransactionWidget(_addNewTransaction),
        TransactionListWidget(_transactions),
      ],
    );
  }
}
