import 'dart:async';
import 'package:OilPos/src/authentication_bloc/user_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState =>
      super.initialState ??
      AuthenticationState(AuthStates.UNINITIALIZED, null, null);

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      await Future.delayed(const Duration(milliseconds: 500));
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  @override
  AuthenticationState fromJson(Map<String, dynamic> source) {
    return AuthenticationState(source['state'], source['token'] as String,
        source['username'] as String);
  }

  @override
  Map<String, dynamic> toJson(AuthenticationState state) {
    return {'state': 0, 'token': state.token, 'username': state.username};
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      if (super.state.token != null) {
        // final result = _userRepository.getUser();
        yield AuthenticationState(
            AuthStates.AUTHENTICATED, super.state.token, super.state.username);
      } else {
        yield AuthenticationState(AuthStates.UNAUTHENTICATED, null, null);
      }
    } catch (_) {
      yield AuthenticationState(AuthStates.UNAUTHENTICATED, null, null);
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final result = _userRepository.getUser();
    yield AuthenticationState(
        AuthStates.AUTHENTICATED, result['token'], result['username']);
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield AuthenticationState(AuthStates.UNAUTHENTICATED, null, null);
    _userRepository.signOut();
  }
}
