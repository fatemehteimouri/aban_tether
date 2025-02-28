part of 'update_phone_number_cubit.dart';

abstract class UpdatePhoneNumberState extends Equatable{
  const UpdatePhoneNumberState();
  @override
  List<Object?> get props => [];
}

class UpdatePhoneNumberInitial extends UpdatePhoneNumberState {}

class UpdatePhoneNumberLoading extends UpdatePhoneNumberState {}

class UpdatePhoneNumberSuccess extends UpdatePhoneNumberState {}

class UpdatePhoneNumberFailure extends UpdatePhoneNumberState {
  final String message;

  const UpdatePhoneNumberFailure(this.message);
}