import 'dart:io';
import 'package:OilPos/src/authentication_bloc/authentication_bloc.dart';
import 'package:OilPos/src/widgets/LoadingIndicator.dart';
import 'package:flutter/foundation.dart';
import 'package:OilPos/src/SimpleBlocDelegate.dart';
import 'package:OilPos/src/SplashPage.dart';
import 'package:OilPos/src/authentication_bloc/authentication_event.dart';
import 'package:OilPos/src/authentication_bloc/authentication_state.dart';
import 'package:OilPos/src/authentication_bloc/user_repository.dart';
import 'package:OilPos/src/screens/home/home_page.dart';
import 'package:OilPos/src/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql/client.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

final appTitle = 'Home';
String get host {
  if (Platform.isAndroid) {
    return '10.0.2.2';
  } else {
    return '127.0.0.1';
  }
}

final String GRAPHQL_ENDPOINT = 'http://$host:3000/graphql';
final String SUBSCRIPTION_ENDPOINT = 'ws://$host:3000/subscriptions';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setTargetPlatformForDesktop();
  if (Platform.isIOS || Platform.isAndroid) {
    BlocSupervisor.delegate =
        SimpleBlocDelegate(await HydratedBlocStorage.getInstance());
  } else if (Platform.isMacOS || Platform.isLinux) {
    BlocSupervisor.delegate = SimpleBlocDelegate(
        await HydratedBlocStorage.getInstance(
            storageDirectory: Directory('.')));
  }

  final UserRepository userRepository = UserRepository();
  // application.onLocaleChanged = onLocaleChange;
  runApp(
    BlocProvider(
      create: (context) => AuthenticationBloc(
        userRepository: userRepository,
      )..add(AppStarted()),
      child: App(
        userRepository: userRepository,
      ),
    ),
  );
}

class App extends StatelessWidget {
  final UserRepository _userRepository;

  App({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          print(state.state);
          if (state.state == AuthStates.UNAUTHENTICATED) {
            return LoginScreen(userRepository: _userRepository);
          } else if (state.state == AuthStates.AUTHENTICATED) {
            String jwt = state.token;
            final HttpLink _httpLink = HttpLink(
              uri: GRAPHQL_ENDPOINT,
            );
            final WebSocketLink websocketLink = WebSocketLink(
              url: SUBSCRIPTION_ENDPOINT,
              config: SocketClientConfig(
                  autoReconnect: true,
                  inactivityTimeout: null,
                  initPayload: () => {'token': '$jwt'}),
            );

            final AuthLink _authLink = AuthLink(getToken: () => 'Bearer $jwt');
            final Link _link = Link.from([_authLink, _httpLink, websocketLink]);

            final GraphQLClient gqlclient = GraphQLClient(
              cache: OptimisticCache(
                dataIdFromObject: typenameDataIdFromObject,
              ),
              link: _link,
            );
            return MyHomePage();
          }
          return SplashPage();
        },
      ),
    );
  }
}
