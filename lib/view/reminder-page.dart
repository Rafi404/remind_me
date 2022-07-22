import 'package:flutter/material.dart';
import 'package:remind_me/view/set-reminder.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({Key? key}) : super(key: key);

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
                onTap:() {
                  
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return const SetReminder();
                }));
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.add_circle,
                    color: Colors.orange,
                  ) ,
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
          horizontal: 20,
            ),
            child: Column(children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              bottom: 50,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.2),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Row(
                children: const [
                  Expanded(
                    child: Text('BOQ')
                  ),
                ],
              ),
            ),
          ),
            ]),
          )),
    );
  }
}
