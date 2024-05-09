import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mvmm_auth_demo/data/network/failure.dart';
import 'package:mvmm_auth_demo/domain/model/model.dart';
import 'package:mvmm_auth_demo/domain/usecase/login_usecase.dart';
import 'package:mvmm_auth_demo/presentation/login/models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required LoginUseCase useCase,
  })  : _useCase = useCase,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  final LoginUseCase _useCase;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, username]),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.username]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        LoginUseCaseInput input = LoginUseCaseInput(state.username.value, state.username.value);
        Either<Failure, Authentication> value = await _useCase.execute(input);

        //TODO: Use value of Failure, Authentication

        if (value.isLeft) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        } else {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
        }
      } catch (error) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}