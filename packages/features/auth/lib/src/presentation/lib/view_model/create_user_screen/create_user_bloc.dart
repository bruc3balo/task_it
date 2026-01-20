import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:auth_domain/domain.dart';
import 'package:meta/meta.dart';

part 'create_user_event.dart';

part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final CreateUserUseCase _createUserUseCase;

  CreateUserBloc(CreateUserUseCase createUserUseCase, GetCurrentUserUseCase getCurrentUserUseCase)
    : _createUserUseCase = createUserUseCase,
      _getCurrentUserUseCase = getCurrentUserUseCase,
      super(InitialCreateUserState()) {
    on<CheckIfUserHasBeenCreatedEvent>(_checkIfUserHasBeenCreated);
    on<InitiateCreateUserEvent>(_createUser);
  }

  Future<void> _checkIfUserHasBeenCreated(CheckIfUserHasBeenCreatedEvent event, Emitter<CreateUserState> emit) async {
    if (state is! InitialCreateUserState) return;
    try {
      emit(LoadingCreateUserState());
      var currentUserResult = await _getCurrentUserUseCase.execute();
      switch (currentUserResult) {
        case FailedResult<AppUserEntity>():
          if (currentUserResult.failure.failureType != FailureType.notFound) {
            emit(InitialCreateUserState());
            return;
          }

          emit(ReadyToCreateUserState());
          return;
        case SuccessResult<AppUserEntity>():
          emit(AlreadyCreatedUserState(currentUserResult.result));
          return;
      }
    } catch (e, trace) {
      emit(InitialCreateUserState());
    }
  }

  Future<void> _createUser(InitiateCreateUserEvent event, Emitter<CreateUserState> emit) async {
    if (state is! ReadyToCreateUserState) return;

    try {
      emit(LoadingCreateUserState());

      var createUserResult = await _createUserUseCase.execute(params: event.displayNameValue);
      switch (createUserResult) {
        case FailedResult<AppUserEntity>():
          emit(ErrorCreateUserState(createUserResult.failure));
          break;
        case SuccessResult<AppUserEntity>():
          emit(SuccessCreateUserState(createUserResult.result));
          break;
      }
    } catch (e, trace) {
      emit(ErrorCreateUserState(AppFailure(trace: trace)));
    }
  }
}
