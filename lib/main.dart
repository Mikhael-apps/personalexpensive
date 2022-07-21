import 'package:flutter/material.dart';
import 'package:personalexpensive/widgets/chart.dart';
import 'package:personalexpensive/widgets/new_transaction.dart';
import 'package:personalexpensive/widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final List<Transaction> _transactions = [
    // Transaction(
    //     id: 't1', title: 'New shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly Groceries',
    //     amount: 16.53,
    //     date: DateTime.now()),
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

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
    return  tx.date.isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: () {
          print('hello');
        },
        behavior: HitTestBehavior.opaque,
        child: NewTransactionWidget(_addNewTransaction),
        );
        
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red,
          title: const Text('Personal Expenses', style: TextStyle(fontFamily: 'Open Sans'),),
          actions: <Widget>[
            IconButton(onPressed: () => _startAddNewTransaction(context), 
            icon: Icon(Icons.add)),
          ],
        ),
        body:  SingleChildScrollView(
          child: _transactions.isEmpty ? 
            Column(
              children: <Widget>[
                Text('No transactions yet!', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.topCenter,
                  height: 250,
                  child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,)),
              ],
            ) :
           Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ChartWidget(_recentTransactions),
                // Card(
                //   child: Text('${transactions.map((data) {
                //     data.amount;
                //   }).toList()}'),
                // ),
              TransactionListWidget(_transactions,),
              ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: Icon(Icons.add),
        ),
        );
  }
}
