import 'package:flutter/material.dart';

class NewTransactionWidget extends StatelessWidget {
  final Function _addNewTransaction;
  // const NewTransactionWidget({Key? key}) : super(key: key);

   NewTransactionWidget(this._addNewTransaction);

  @override
  Widget build(BuildContext context) {
//  late String titleInput;
    // late String amountInput;
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter title',
              ),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter amount',
              ),
              // onChanged: (val) {
              //    amountInput = val;
              // },
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                // print(titleInput);
                // print(amountInput);
                print(titleController.text);
                _addNewTransaction(titleController.text, double.parse(amountController.text));
              },
            )
          ],
        ),
      ),
    );
  }
}
