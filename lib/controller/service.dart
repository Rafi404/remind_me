import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import '../constants/strings.dart';

class ReminderService {
  //Add reminder
  Future<Response?> addReminder(text, date, time) async {
    try {
      http.Response response = await http.post(
          Uri.parse(
              '$baseUrl$addApi?alert_text=$text&reminder_date=$date&reminder_time=$time'),
          headers: {
            "Authorization": "Bearer $token",
            "accept": "application/json"
          });
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print("result is $data");
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  //get list of reminder
  Future fetchReminderList() async {}
}
