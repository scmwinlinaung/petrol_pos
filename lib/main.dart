import 'package:OilPos/src/SplashPage.dart';
import 'package:OilPos/src/pages/home/homePage.dart';
import 'package:OilPos/src/pages/login/loginScreen.dart';
import 'package:OilPos/src/viewModels/authentication/authenticationViewModel.dart';
import 'package:OilPos/src/viewModels/home/homeViewModel.dart';
import 'package:OilPos/src/SimpleBlocDelegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:provider/provider.dart';

final appTitle = 'Home';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  HydratedCubit.storage = await HydratedStorage.build();

  // application.onLocaleChanged = onLocaleChange;
  runApp(ChangeNotifierProvider(
    create: (context) => AuthenticationViewModel(),
    child: App(),
  )
      // BlocProvider(
      //   create: (context) => AuthenticationBloc(
      //     userRepository: userRepository,
      //   )..add(AppStarted()),
      //   child: App(
      //     userRepository: userRepository,
      //   ),
      // ),
      );
}

class App extends StatelessWidget {
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
        home: Consumer<AuthenticationViewModel>(
            builder: (context, authenticationViewModel, child) {
          print("Auth");
          print("State");
          print(authenticationViewModel.authenticationModel.state);
          if (authenticationViewModel.authenticationModel.state == 1) {
            return LoginScreen();
          } else if (authenticationViewModel.authenticationModel.state == 2) {
            return ChangeNotifierProvider(
              create: (context) => HomeViewModel(),
              child: MyHomePage(),
            );
          } else
            return SplashPage();
        })

        // home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        //   builder: (context, state) {
        //     if (state.state == AuthStates.UNAUTHENTICATED) {
        //       return LoginScreen(userRepository: _userRepository);
        //     } else if (state.state == AuthStates.AUTHENTICATED) {
        //       String jwtToken = state.token;
        //       String userId = state.userId;
        //       String phone = state.phoneNum;
        //       String name = state.name;
        //       String email = state.email;

        //       print("Phone" + phone);

        //       return ChangeNotifierProvider(
        //         create: (context) => HomeViewModal(),
        //         child: MyHomePage(),
        //       );
        //     }

        //     return SplashPage();
        //   },
        // ),
        );
  }
}
