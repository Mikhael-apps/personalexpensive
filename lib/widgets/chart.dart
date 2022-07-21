import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpensive/models/transaction.dart';

class ChartWidget extends StatelessWidget {

  final List<Transaction> recentTransactions;

  ChartWidget(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      
      final weekDays = DateTime.now().subtract(Duration(days: index));
     late double totalSum;
      for(var i=0; i<recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDays.day &&
            recentTransactions[i].date.month == weekDays.month &&
            recentTransactions[i].date.year == weekDays.year){
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDays));
      print(totalSum);

      return {'Day': DateFormat.E().format(weekDays), 'Amount': totalSum};
    });
  }


  // const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[

        ],
      ),
    );
  }
}