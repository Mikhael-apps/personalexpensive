import 'package:flutter/material.dart';
import 'package:personalexpensive/widgets/new_transaction.dart';
import 'package:personalexpensive/widgets/transaction_list.dart';
import 'package:personalexpensive/widgets/user_transactions.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    

    

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                  color: Colors.blueAccent,
                  elevation: 5,
                  child: Text('Chart')
                  ),
            ),
            // Card(
            //   child: Text('${transactions.map((data) {
            //     data.amount;
            //   }).toList()}'),
            // ),
         const UserTransactionsWidget(),
          ],
        ));
  }
}
