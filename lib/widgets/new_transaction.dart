import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function? addNewTransaction;
  DateTime? pickedDate = DateTime.now();
  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _textControllerTitle = TextEditingController();
  final _textControllerAmount = TextEditingController();
  bool spent = false;
  @override
  Widget build(BuildContext context) {
    return Card(
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
              controller: _textControllerTitle,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _textControllerAmount,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text("Pick Date"),
                  onPressed: () async {
                    DateTime d = await showDialog(
                        context: context,
                        builder: (context) {
                          return DatePickerDialog(
                              initialDate: DateTime.now(),
                              firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                              lastDate: DateTime.now());
                        });
                    setState(
                      () {
                        widget.pickedDate = d;
                      },
                    );
                  },
                ),
                Row(
                  children: [
                    ChoiceChip(
                      label: Text("Spent"),
                      selected: spent,
                      selectedColor: Colors.deepOrange,
                      onSelected: (v) {
                        setState(() {
                          spent = true;
                        });
                      },
                    ),
                    ChoiceChip(
                      label: Text("Received"),
                      selected: !spent,
                      selectedColor: Colors.green,
                      onSelected: (v) {
                        setState(() {
                          spent = false;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () {
                if (_textControllerTitle.text.length == 0 ||
                    _textControllerAmount.text.length == 0) {
                  return;
                }
                widget.addNewTransaction!(
                  title: _textControllerTitle.text,
                  amount: double.tryParse(_textControllerAmount.text),
                  date: DateTime.now(),
                  spent: spent,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
