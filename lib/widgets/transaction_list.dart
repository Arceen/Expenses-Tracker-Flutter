import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transactions.length,
        itemBuilder: ((context, index) => Card(
              elevation: 3,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      '\$' +
                          transactions[index]
                              .transactionAmount!
                              .toStringAsFixed(2),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: transactions[index].spent!
                              ? Colors.deepOrange
                              : Colors.green),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: transactions[index].spent!
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
                        transactions[index].transactionTitle!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMd()
                            .format(transactions[index].transactionDateTime)
                            .toString(),
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
