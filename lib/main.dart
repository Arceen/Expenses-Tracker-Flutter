import 'package:expenses_tracker/models/transaction.dart';
import 'package:expenses_tracker/widgets/charts_widget.dart';
import 'package:expenses_tracker/widgets/new_transaction.dart';
import 'package:expenses_tracker/widgets/transaction_list.dart';
import 'package:expenses_tracker/widgets/user_transaction.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Expenses Tracker',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.teal,
          textTheme: GoogleFonts.quicksandTextTheme(),
          appBarTheme: AppBarTheme(
            textTheme: GoogleFonts.openSansTextTheme(),
          )),
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ChartWidget(
                  transactions: _transactions
                      .where((element) =>
                          element.transactionDateTime
                              .difference(DateTime.now())
                              .inDays <=
                          7)
                      .toList()),
              TransactionList(transactions: _transactions),
            ],
          ),
        ));
  }
}
