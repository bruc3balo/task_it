import 'package:auth_domain/auth_domain.dart';
import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

@Injectable()
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  SignInBloc(SignInUseCase signInUseCase) : _signInUseCase = signInUseCase, super(InitialSignInState()) {
    on<InitiateSignInEvent>(_signIn);
  }

  Future<void> _signIn(InitiateSignInEvent event, Emitter<SignInState> emit) async {
    if (state is! InitialSignInState) return;

    try {
      emit(LoadingSignInState());
      var signInResult = await _signInUseCase.execute(
        params: SignInForm(password: event.password, email: event.email),
      );
      switch (signInResult) {
        case FailedResult<AppUserEntity>():
          emit(ErrorSignInState(failure: signInResult.failure));
          break;
        case SuccessResult<AppUserEntity>():
          emit(SuccessSignInState(user: signInResult.result));
          break;
      }
    } catch (e, trace) {
      emit(ErrorSignInState(failure: AppFailure(trace: trace)));
    }
  }

}
