import 'package:OilPos/src/viewModels/authentication/authenticationViewModel.dart';
import 'package:OilPos/src/viewModels/login/loginViewModel.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'loginButton.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // LoginBloc _loginBloc;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool get isPopulated =>
      _usernameController.text.isNotEmpty &&
      _passwordController.text.isNotEmpty;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(builder: (context, loginViewModel, child) {
      print(loginViewModel.loginModel.isSubmitting);
      print(loginViewModel.loginModel.isSuccess);
      print(loginViewModel.loginModel.isFailure);

      return Form(
          child: Container(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
        child: ListView(
          children: <Widget>[
            Image.asset(
              "assets/icons/BooleanPOSIcon.png",
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.supervised_user_circle),
                labelText: 'နာမည်',
              ),
              controller: _usernameController,
              autocorrect: false,
              // validator: (_) {
              //   print("state.isUsernameValid");
              //   print(state.isUsernameValid);
              //   return !state.isUsernameValid
              //       ? 'နာမည်မှားယွင်းနေပါသည်'
              //       : null;
              // },
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                labelText: 'စကားဝှက်',
              ),
              obscureText: true,
              autocorrect: false,
              controller: _passwordController,
              // validator: (_) {
              //   return !state.isPasswordValid
              //       ? 'စကားဝှက်မှားယွင်းနေပါသည်'
              //       : null;
              // },
            ),
            SizedBox(
              height: 50,
            ),
            LoginButton(
              onPressed: () => _onFormSubmitted(context),
            )
          ],
        ),
      ));
    });
    //   child: BlocBuilder<LoginBloc, LoginState>(
    //     builder: (context, state) {

    //     },
    //   ),
    // );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // void _onUsernameChanged() {
  //   _loginBloc.add(
  //     UsernameChanged(username: _usernameController.text),
  //   );
  // }

  // void _onPasswordChanged() {
  //   _loginBloc.add(
  //     PasswordChanged(password: _passwordController.text),
  //   );
  // }

  void _onFormSubmitted(BuildContext context) async {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    loginViewModel
        .login(_usernameController.text, _passwordController.text)
        .then((response) {
      if (loginViewModel.loginModel.isFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('ဝင်ရောက်မှုမအောင်မြင်ပါ'),
            backgroundColor: Colors.red,
          ),
        );
      }

      if (loginViewModel.loginModel.isSubmitting) {
        Scaffold.of(context).showSnackBar(
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
      if (loginViewModel.loginModel.isSuccess) {
        final authViewModel =
            Provider.of<AuthenticationViewModel>(context, listen: false);
        authViewModel.loginState();
      }
    });
  }
}
