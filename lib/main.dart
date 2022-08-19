import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task2_bloc/bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Form Validation with Bloc'),
          ),
          body: BlocProvider(
            create: (context) => LoginBloc(),
            child: const MyFormPage(),
          ),
        ),
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter your credentials',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  onChanged: (value) {
                    context
                        .read<LoginBloc>()
                        .add(UsernameChanged(username: value));
                    // print(value);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  onChanged: (value) {
                    context
                        .read<LoginBloc>()
                        .add(PasswordChanged(password: value));
                    // print(value);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LoginBloc>().add(FormSubmissionSuccess());
                  print(state.username);
                  print(state.password);
                  print('The form is submitted');
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
}
