import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionListWidget extends StatelessWidget {

final List<Transaction> transactions;

TransactionListWidget(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
              children: transactions.map((data) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        child: Text(
                         'A: \$${data.amount}',
                          style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20, color: Colors.purple
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(DateFormat.yMMMd().format(data.date) ,
                          style: TextStyle(color: Colors.grey),)
                        ],
                      )
                    ],
                  )
                );
              } ).toList(),
            );
  }
}