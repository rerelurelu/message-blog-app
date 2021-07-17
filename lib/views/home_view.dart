import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1940),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'カレンダー',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('日付を選択'),
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan.shade200,
                onPrimary: Colors.white,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                selectTimePicker(context);
              },
            ),
            Text(date.month.toString()),
          ],
        ),
      ),
    );
  }
}
