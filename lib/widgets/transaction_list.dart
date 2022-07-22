import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionListWidget extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionListWidget(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            // elevation: 6,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(child: Text(transactions[index].amount.toStringAsFixed(0))),
                ),
              ),
              title: Text(transactions[index].title, 
                style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
                trailing: IconButton(onPressed: () => deleteTransaction(transactions[index].id), icon: Icon(Icons.delete), color: Colors.red,),
            ),
          );
        },
        itemCount: transactions.length,
        
      ),
    );
  }

  
}
