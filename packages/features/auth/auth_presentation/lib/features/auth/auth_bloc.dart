import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppAuthenticatorService _appAuthenticatorService;

  AuthBloc(AppAuthenticatorService appAuthenticatorService) : _appAuthenticatorService = appAuthenticatorService, super(InitialAuthState()) {
    on<CheckAuthStateEvent>(_initialize);
  }

  Future<void> _initialize(CheckAuthStateEvent event, Emitter<AuthState> emit) async {
    if (state is! InitialAuthState) return;

    try {
      emit(LoadingAuthState());

      var currentUserResult = await _appAuthenticatorService.getCurrentUser();
      switch (currentUserResult) {
        case FailedResult<AuthUser>():
          emit(NotAuthenticatedAuthState());
          break;
        case SuccessResult<AuthUser>():
          emit(AuthenticatedAuthState());
          break;
      }
    } catch (e, trace) {
      emit(NotAuthenticatedAuthState());
    }
  }
}
