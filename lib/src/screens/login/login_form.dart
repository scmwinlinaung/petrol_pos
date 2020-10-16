import 'package:OilPos/src/authentication_bloc/authentication_bloc.dart';
import 'package:OilPos/src/authentication_bloc/authentication_event.dart';
import 'package:OilPos/src/authentication_bloc/user_repository.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;
  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _usernameController.addListener(_onUsernameChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('ဝင်ရောက်မှုမအောင်မြင်ပါ'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Logging In',
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
              child: Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 70,
                  child: Center(
                    child: TypewriterAnimatedTextKit(
                        isRepeatingAnimation: true,
                        text: ["Petrol Hla Mya Oil Trading Co.Ltd"],
                        textStyle: TextStyle(
                            fontSize: 25.0,
                            fontFamily: "Roboto",
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                        totalRepeatCount: 1000000,
                        speed: new Duration(milliseconds: 250),
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                        ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                new Container(
                    width: 50,
                    height: 200,
                    decoration: new BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/oil_pump.gif')))),
                SizedBox(
                  height: 50,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.supervised_user_circle),
                    labelText: 'နာမည်',
                  ),
                  controller: _usernameController,
                  autovalidate: true,
                  autocorrect: false,
                  validator: (_) {
                    print("state.isUsernameValid");
                    print(state.isUsernameValid);
                    return !state.isUsernameValid
                        ? 'နာမည်မှားယွင်းနေပါသည်'
                        : null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: 'စကားဝှက်',
                  ),
                  obscureText: true,
                  autovalidate: true,
                  autocorrect: false,
                  controller: _passwordController,
                  validator: (_) {
                    return !state.isPasswordValid
                        ? 'စကားဝှက်မှားယွင်းနေပါသည်'
                        : null;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                LoginButton(
                  onPressed: _onFormSubmitted,
                )
              ],
            ),
          ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onUsernameChanged() {
    _loginBloc.add(
      UsernameChanged(username: _usernameController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        username: _usernameController.text,
        password: _passwordController.text,
      ),
    );
  }
}
