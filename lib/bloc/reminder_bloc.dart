import 'package:bloc/bloc.dart';
import 'package:remind_me/model/reminder.dart';
import '../controller/service.dart';
import '../model/reminder_list_model.dart';
part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {
  ReminderBloc() : super(InitialState()) {
    on<AddReminder>((event, emit) async {
      final response = await ReminderService()
          .addReminder(event.alertText, event.alertDate, event.alertTime);
      print(response!.body);
      final datas = reminderModelFromJson(response.body);
      print(datas.data.id);
      final message = datas.data.alertText;
      emit(DataFetched(message));
    });

    on<ViewReminder>((event, emit) async {
      final response = await ReminderService().fetchReminderList();
      final result = reminderListModelFromJson(response.body);
      print(result.message);
    });
  }
}
