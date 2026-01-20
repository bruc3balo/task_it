import 'package:auth_domain/domain.dart';
import 'package:base/base.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final InitiateForgotPasswordUseCase _initiateForgotPasswordUseCase;

  ForgotPasswordBloc(InitiateForgotPasswordUseCase initiateForgotPasswordUseCase)
    : _initiateForgotPasswordUseCase = initiateForgotPasswordUseCase,
      super(InitialForgotPasswordState()) {
    on<InitiateForgotPasswordEvent>(_forgotPassword);
  }

  Future<void> _forgotPassword(InitiateForgotPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    if (state is! InitialForgotPasswordState) return;
    try {
      emit(LoadingForgotPasswordState());

      var forgotResult = await _initiateForgotPasswordUseCase.execute(params: event.email);
      switch (forgotResult) {
        case FailedResult<void>():
          emit(ErrorForgotPasswordState(failure: forgotResult.failure));
          break;
        case SuccessResult<void>():
          emit(SuccessForgotPasswordState());
          break;
      }
    } catch (e, trace) {
      emit(ErrorForgotPasswordState(failure: AppFailure(trace: trace)));
    }
  }
}