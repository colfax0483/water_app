import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:io';

import 'login_form_demo_v2.dart';
import 'state_simple.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _autoValidate = false;

  String _email;
  String _nick;

  void _onLogin(BuildContext context) async {
    final String email = _emailController.text;
    final String nick = _passwordController.text;
    final SimpleState state = Provider.of<SimpleState>(context, listen: false);
    state.setAccount(email, nick);

    _emailController.clear();
    _passwordController.clear();

    Navigator.pushNamed(context, PREDICT_PAGE);
  }

  void _onCancel() => exit(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg_main.png"), fit: BoxFit.cover)),
        padding: EdgeInsets.fromLTRB(20, 120, 20, 120),
        child: new Form(
          key: _formkey,
          autovalidate: _autoValidate,
          child: FormUI(),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        Hero(
            tag: 'heoro',
            child: CircleAvatar(
              child: Image.asset('assets/waterdrop.png'),
              backgroundColor: Colors.transparent,
              radius: 58.0, //unit: logical pixel?
            )),
        SizedBox(height: 45.0),
        TextFormField(
          key: Key('email'),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: 'Email',
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              hintText: 'example@gmail.com',
              focusedBorder: InputBorder.none),
          validator: validateEmail,
          onSaved: (String val) {
            _email = val;
          },
          controller: _emailController,
        ),
        SizedBox(height: 15.0),
        TextFormField(
          key: Key('password'),
          // obscureText: true,
          decoration: InputDecoration(
              labelText: "NickName",
              border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              focusedBorder: InputBorder.none),
          validator: validateName,
          controller: _passwordController,
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                key: Key('login'),
                child: Text('로그인'),
                color: Colors.lightBlueAccent.withOpacity(0.9),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    _onLogin(context);
                  }
                }),
            SizedBox(width: 10.0),
            RaisedButton(
              key: Key('cancel'),
              child: Text('통계보기'),
              color: Colors.lightBlueAccent.withOpacity(0.9),
              onPressed: () => Navigator.pushNamed(context, RESULT),
            ),
          ],
        ),
      ],
    );
  }

  String validateName(String value) {
    if (value.length < 3)
      return '닉네임은 세 글자 이상이어야 합니다';
    else
      return null;
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
