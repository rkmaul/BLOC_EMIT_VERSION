part of 'register_bloc_cubit.dart';

abstract class RegisterBlocState extends Equatable {
  const RegisterBlocState();

  @override
  List<Object> get props => [];
}

class RegisterBlocInitialState extends RegisterBlocState {}

class RegisterBlocLoadingState extends RegisterBlocState {}

class RegisterBlocSuccesState extends RegisterBlocState {
  final success;

  RegisterBlocSuccesState(this.success);

  @override
  List<Object> get props => [success];
}

class RegisterBlocErrorState extends RegisterBlocState {
  final error;

  RegisterBlocErrorState(this.error);

  @override
  List<Object> get props => [error];
}
