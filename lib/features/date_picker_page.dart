import 'package:flutter/material.dart';

class DatePickerPage extends StatefulWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  State<DatePickerPage> createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime? _startDate;
  DateTime? _endDate;

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final initialDate = isStart
        ? now.subtract(const Duration(days: 1))
        : (_startDate ?? now);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        if (isStart) {
          _startDate = pickedDate;
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _endDate = null;
          }
        } else {
          _endDate = pickedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date Range Picker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _pickDate(isStart: true),
              child: Text(
                _startDate == null
                    ? 'Select Start Date'
                    : 'Start: ${_startDate!.toLocal().toString().split(' ')[0]}',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _startDate == null
                  ? null
                  : () => _pickDate(isStart: false),
              child: Text(
                _endDate == null
                    ? 'Select End Date'
                    : 'End: ${_endDate!.toLocal().toString().split(' ')[0]}',
              ),
            ),
            const Spacer(),
            if (_startDate != null && _endDate != null)
              Text(
                'Selected Range:\n'
                    '${_startDate!.toLocal().toString().split(' ')[0]} - '
                    '${_endDate!.toLocal().toString().split(' ')[0]}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
