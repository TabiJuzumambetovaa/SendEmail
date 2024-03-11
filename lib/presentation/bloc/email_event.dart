part of 'email_bloc.dart';

@immutable
abstract class EmailEvent {}
class SendEvent extends EmailEvent{
   final String name;
  final String message;
  final String phone;
  final String toEmail;
  final String firstName;
  final String lastName;

  SendEvent({
    required this.name,
    required this.message,
    required this.phone,
    required this.toEmail,
    required this.firstName,
    required this.lastName,
  });

 

}
