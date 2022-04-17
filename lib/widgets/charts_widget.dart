import 'package:expenses_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartWidget extends StatelessWidget {
  final List<Transaction> transactions;
  const ChartWidget({Key? key, required this.transactions}) : super(key: key);

  List<Map<String, Object>> get groupByDay {
    return List.generate(
      7,
      (index) {
        final temp = transactions.where((element) =>
            element.transactionDateTime.difference(DateTime.now()).inDays <
            index);
        print(DateFormat.E());
        return {};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card();
  }
}
