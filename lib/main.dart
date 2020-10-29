import 'package:OilPos/src/authentication_bloc/authentication_bloc.dart';
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
import 'package:hydrated_bloc/hydrated_bloc.dart';

final appTitle = 'Home';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  HydratedCubit.storage = await HydratedStorage.build();

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

  App({
    Key key,
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // var notiContract = await contractDeploy("Noti.sol",args);
    const mainColorHex = const Color(0xff396b50);
    const indicatorColorHex = const Color(0xff5e87d4);
    const articleIndicatorColorHex = const Color(0xff86a5df);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pyidaungsu',
        primaryColor: mainColorHex,
        indicatorColor: indicatorColorHex,
        accentColor: articleIndicatorColorHex,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              wordSpacing: 0.5,
              color: Colors.white),
          headline5: TextStyle(
              fontSize: 14.0,
              wordSpacing: 0.5,
              color: mainColorHex,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, wordSpacing: 0.5),
          headline3: TextStyle(fontSize: 16.0, wordSpacing: 0.5),
          headline6: TextStyle(
              fontSize: 36.0, fontStyle: FontStyle.italic, wordSpacing: 0.5),
          bodyText1: TextStyle(fontSize: 13.0, wordSpacing: 0.5),
          bodyText2: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              wordSpacing: 0.8,
              letterSpacing: 0.4),
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.state == AuthStates.UNAUTHENTICATED) {
            return LoginScreen(userRepository: _userRepository);
          } else if (state.state == AuthStates.AUTHENTICATED) {
            String jwtToken = state.token;
            String userId = state.userId;
            String phone = state.phoneNum;
            String name = state.name;
            String email = state.email;

            print("Phone" + phone);

            return MyHomePage();
          }

          return SplashPage();
        },
      ),
    );
  }
}
