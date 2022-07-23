part of 'reminder_bloc.dart';

class ReminderState {}

class InitialState extends ReminderState {}

class DataFetched extends ReminderState {
  final String message;

  DataFetched(this.message);
}

class ListFetched extends ReminderState {
  final List<Datum> result;

  ListFetched(this.result);
}
