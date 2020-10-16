
import 'package:OilPos/src/authentication_bloc/user_repository.dart';
import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';
import 'package:http/http.dart' as http;

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  ApiCall apiCall = ApiCallService();

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(AuthenticationState(0, null, null, null, null, null));

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
      // yield* _mapLoggedOutToState(event.token);
    }
  }

  @override
  AuthenticationState fromJson(Map<String, dynamic> source) {
    return AuthenticationState(
        source['state'],
        source['token'] as String,
        source['phone'] as String,
        source['userId'] as String,
        source['name'] as String,
        source['email'] as String);
  }

  @override
  Map<String, dynamic> toJson(AuthenticationState state) {
    return {
      'state': 0,
      'token': state.token,
      'phone': state.phoneNum,
      'userId': state.userId,
      'name': state.name,
      'emai': state.email
    };
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
      try {
        if (super.state.token != null) {
          yield AuthenticationState(
              AuthStates.AUTHENTICATED,
              super.state.token,
              super.state.phoneNum,
              super.state.userId,
              super.state.name,
              super.state.email);
        } else {
          yield AuthenticationState(
              AuthStates.UNAUTHENTICATED, null, null, null, null, null);
        }
      } catch (_) {
        yield AuthenticationState(
            AuthStates.UNAUTHENTICATED, null, null, null, null, null);
      }
    
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    final result = await _userRepository.getUser();
    yield AuthenticationState(AuthStates.AUTHENTICATED, result['token'],
        result['phone'], result['userId'], result['name'], result['email']);
  }

  Stream<AuthenticationState> _mapLoggedOutToState(String token) async* {
    // await apiCall.callLogoutAllApi(token);
    yield AuthenticationState(
        AuthStates.UNAUTHENTICATED, null, null, null, null, null);
    _userRepository.signOut();
  }
}
