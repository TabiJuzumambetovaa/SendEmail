part of 'email_bloc.dart';

@immutable
sealed class EmailState {}

final class EmailInitial extends EmailState {}
final class EmailLoading extends EmailState {}
final class EmailSuccess extends EmailState {
  
}
final class EmailError extends EmailState {
  final String errorMessage;
  EmailError({required this.errorMessage});
}

