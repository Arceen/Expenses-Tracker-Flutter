import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  List<Transaction> transactions;
  TransactionList({Key? key, required this.transactions}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.transactions.length,
        itemBuilder: ((context, index) => Card(
              elevation: 3,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      '\$' +
                          widget.transactions[index].transactionAmount!
                              .toStringAsFixed(2),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: widget.transactions[index].spent!
                              ? Colors.deepOrange
                              : Colors.green),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: widget.transactions[index].spent!
                            ? Colors.deepOrange
                            : Colors.green,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.transactions[index].transactionTitle!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(
                                widget.transactions[index].transactionDateTime)
                            .toString(),
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(width: 50),
                  IconButton(
                      icon: Icon(Icons.delete,
                          color: Theme.of(context).primaryColor),
                      onPressed: () {
                        setState(() {
                          widget.transactions.removeAt(index);
                        });
                      }),
                ],
              ),
            )),
      ),
    );
  }
}
