import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:remind_me/constants/constant.dart';
import 'package:remind_me/model/reminder_list_model.dart';

class ReminderTile extends StatelessWidget {
  final Datum reminderData;
  const ReminderTile({
    required this.reminderData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          reminderData.alertText,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(DateFormat("dd-MM-yyyy")
                .format(DateTime.parse(reminderData.reminderDate.toString()))),
            kWidth,
            Text(reminderData.reminderTime),
          ],
        ),
        trailing:
            //list if widget in appbar actions
            PopupMenuButton(
          icon: const Icon(
              Icons.menu), //don't specify icon if you want 3 dot menu
          color: Colors.white,
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: const Text(
                "Edit",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {},
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: Text(
                "Delete",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          // ignore: avoid_print
          onSelected: (item) => {print(item)},
        ),
      ),
    );
  }
}
