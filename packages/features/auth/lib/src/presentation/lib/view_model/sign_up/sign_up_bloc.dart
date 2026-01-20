import 'package:auth_domain/domain.dart';
import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(SignUpUseCase signUpUseCase) : _signUpUseCase = signUpUseCase, super(InitialSignUpState()) {
    on<InitiateSignUpEvent>(_signUp);
  }

  Future<void> _signUp(InitiateSignUpEvent event, Emitter<SignUpState> emit) async {
    if (state is! InitialSignUpState) return;
    try {
      emit(LoadingSignUpState());

      var signUpResult = await _signUpUseCase.execute(
        params: CreateAccountForm(displayName: event.displayName, email: event.email, password: event.password),
      );

      switch (signUpResult) {
        case FailedResult<AppUserEntity>():
          emit(ErrorSignUpState(signUpResult.failure));
          break;
        case SuccessResult<AppUserEntity>():
          emit(SuccessSignUpState(user: signUpResult.result));
          break;
      }
    } catch (e, trace) {
      emit(ErrorSignUpState(AppFailure(trace: trace)));
    }
  }
}
