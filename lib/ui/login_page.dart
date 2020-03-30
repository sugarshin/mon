import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mon/store/state/app_state.dart';
import 'package:mon/ui/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginBloc>(
      converter: (store) {
        return LoginBloc(store);
      },
      builder: (BuildContext context, LoginBloc bloc) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Log into mon'),
            ),
            body: Builder(
              builder: (BuildContext context) {
                return Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        obscureText: true,
                        style: style,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your token';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          labelText: 'Personal Token',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
                        ),
                        onSaved: (value) {
                          bloc.login(value);
                          this._formKey.currentState..reset();
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                           if (_formKey.currentState.validate()) {
                            this._formKey.currentState.save();
                          }
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                );
              },
            ));
      },
    );
  }
}
