import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ChartBarWidget extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBarWidget(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal});
  // const ChartBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      child: FittedBox(
        child: Column(
          children: <Widget>[
            Text('\$${spendingAmount.toStringAsFixed(0)}'),
            SizedBox(height: 5,),
            Container(
              height: 60,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromARGB(220,220,220,1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5,),
            Text(label),
          ],
        ),
      ),
    );
  }
}
