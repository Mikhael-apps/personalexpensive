// Card(
//               child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(5),
//                 margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Theme.of(context).primaryColor,
//                     width: 2,
//                   ),
//                 ),
//                 child: Text(
//                   'A: \$${transactions[index].amount.toStringAsFixed(2)}',
//                   style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                       color: Theme.of(context).primaryColor,
//                       ),
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     transactions[index].title,
//                     // style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                   Text(
//                     DateFormat.yMMMd().format(transactions[index].date),
//                     style: TextStyle(color: Colors.grey),
//                   )
//                 ],
//               )
//             ],
//           ));