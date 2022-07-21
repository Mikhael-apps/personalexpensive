import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionWidget extends StatefulWidget {
  final Function _addNewTransaction;


  // const NewTransactionWidget({Key? key}) : super(key: key);

  NewTransactionWidget(this._addNewTransaction);

  @override
  State<NewTransactionWidget> createState() => _NewTransactionWidgetState();
}

class _NewTransactionWidgetState extends State<NewTransactionWidget> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
   late DateTime _selectedDate;
  @override
  Widget build(BuildContext context) {
//  late String titleInput;
    // late String amountInput;

    void _submitedData() {
      final enteredTitle = _titleController.text;
      final enteredAmount = double.parse(_amountController.text);
      if (enteredTitle.isEmpty || enteredAmount < 0 || enteredAmount == null) {
        return;
      }
      widget._addNewTransaction(enteredTitle, enteredAmount);

      Navigator.pop(context);
    }

    void _showDatePicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2019),
          lastDate: DateTime.now()).then((datePicked) {
            if(datePicked == null){
              return;
            }

            setState(() {
              _selectedDate = datePicked;
            });

          });

        
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
              controller: _titleController,
              onSubmitted: (_) => _submitedData,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter amount',
              ),
              // onChanged: (val) {
              //    amountInput = val;
              // },
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitedData,
            ),
            Row(
              children: <Widget>[
                 Text(_selectedDate == null ? 'No data chosen!' : DateFormat.yMMMd().format(_selectedDate)),
                FlatButton(
                    child: Text('Choose date'), 
                    onPressed: _showDatePicker
                    ),
              ],
            ),
            RaisedButton(
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
