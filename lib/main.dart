import 'package:expenses_tracker/models/transaction.dart';
import 'package:expenses_tracker/widgets/new_transaction.dart';
import 'package:expenses_tracker/widgets/transaction_list.dart';
import 'package:expenses_tracker/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Expenses Tracker App',
      home: MyHomePage(),
    ));

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
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

  void addNewTransaction(
      {required String title,
      required double amount,
      required DateTime date,
      required bool spent}) {
    setState(() {
      _transactions.add(Transaction(
        transactionId: title + amount.toString() + date.toString(),
        transactionTitle: title,
        spent: spent,
        transactionAmount: amount,
        transactionDateTime: date,
      ));
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (buildCtx) {
          return NewTransaction(addNewTransaction: addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
          actions: [
            IconButton(
              onPressed: () => _startAddNewTransaction(context),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TransactionList(transactions: _transactions),
          ],
        ));
  }
}
