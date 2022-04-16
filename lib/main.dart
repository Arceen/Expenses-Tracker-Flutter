import 'package:expenses_tracker/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;

void main() => runApp(MaterialApp(
      title: 'Expenses Tracker App',
      home: MyHomePage(),
    ));

class MyHomePage extends StatelessWidget {
  var transactions = [
    Transaction(
      transactionId: 't1',
      transactionTitle: 'Bought Fruits',
      transactionAmount: 50.39,
      spent: true,
      transactionDateTime: DateTime.now(),
    ),
    Transaction(
      transactionId: 't2',
      transactionTitle: 'Bought Shirt',
      transactionAmount: 13.99,
      spent: true,
      transactionDateTime: DateTime.now(),
    ),
  ];
  String? inputAmount;
  String? inputTitle;
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              child: Card(
                color: Colors.amber,
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      onChanged: (val) => inputTitle = val,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      ),
                      onChanged: (val) => inputTitle = val,
                    ),
                    TextButton(
                      child: const Text(
                        'Add Transaction',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: transactions
                  .map(
                    (e) => Card(
                      elevation: 3,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              '\$' + e.transactionAmount.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: e.spent!
                                      ? Colors.deepOrange
                                      : Colors.green),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color:
                                    e.spent! ? Colors.deepOrange : Colors.green,
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                e.transactionTitle!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd()
                                    .format(e.transactionDateTime)
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.grey.shade700, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        )));
  }
}
