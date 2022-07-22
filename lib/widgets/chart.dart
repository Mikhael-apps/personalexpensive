import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalexpensive/models/transaction.dart';
import 'package:personalexpensive/widgets/chart_bar.dart';

class ChartWidget extends StatelessWidget {

  final List<Transaction> recentTransactions;

  ChartWidget(this.recentTransactions);

  List<Map<String, dynamic>> get groupedTransactionValues {
    return List.generate(7, (index) {
      
      final weekDays = DateTime.now().subtract(Duration(days: index));
       var totalSum = 0.0;
      for(var i=0; i<recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDays.day &&
            recentTransactions[i].date.month == weekDays.month &&
            recentTransactions[i].date.year == weekDays.year){
          totalSum += recentTransactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDays));
      print(totalSum);

      return {'Day': DateFormat.E().format(weekDays).substring(0,1), 'Amount': totalSum as double};
    }).reversed.toList(); 
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['Amount'];
    });
  }


  // const ChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: ChartBarWidget(     
              label: data['Day'],
              spendingAmount: data['Amount'],
               spendingPctOfTotal: totalSpending == 0.0 ? 0.0 : (data['Amount'] as double) / totalSpending,
            
                ),
            );
          }).toList(),
        ),
      ),
    );
  }
}