import 'package:flutter/material.dart';

class NewTransactionWidget extends StatefulWidget {
  final Function _addNewTransaction;
  
  // const NewTransactionWidget({Key? key}) : super(key: key);

   NewTransactionWidget(this._addNewTransaction);

  @override
  State<NewTransactionWidget> createState() => _NewTransactionWidgetState();
}

class _NewTransactionWidgetState extends State<NewTransactionWidget> {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//  late String titleInput;
    // late String amountInput;
    
  

    void _submitedData() {
      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amountController.text);
      if(enteredTitle.isEmpty|| enteredAmount < 0 || enteredAmount == null) {
        return;
      }
    widget._addNewTransaction(enteredTitle, enteredAmount);

    Navigator.pop(context);

   }

    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter title',
              ),
              // onChanged: (val) {
              //   titleInput = val;
              // },
              controller: titleController,
              onSubmitted: (_) => _submitedData,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter amount',
              ),
              // onChanged: (val) {
              //    amountInput = val;
              // },
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitedData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: _submitedData,
            )
          ],
        ),
      ),
    );
  }
}
