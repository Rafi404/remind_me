import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:remind_me/bloc/reminder_bloc.dart';
import 'package:remind_me/view/set_reminder.dart';

import 'widgets/reminder_tile.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({Key? key}) : super(key: key);

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  @override
  void initState() {
    context.read<ReminderBloc>().add(
          ViewReminder(),
        );
    // BlocProvider(
    //   create: (_) => ReminderBloc()..add(ViewReminder()),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Reminders',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SetReminder();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle,
                        color: Colors.green,
                      ),
                      Text(
                        'New Alert',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          body: BlocBuilder<ReminderBloc, ReminderState>(
            builder: (context, event) {
              if (event is ListFetched) {
                return ListView(
                    children: List.generate(
                        event.result.length,
                        (index) => ReminderTile(
                              reminderData: event.result[index],
                            )));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
