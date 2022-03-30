import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloctest/logic/cubit/counter_cubit.dart';
import 'package:bloctest/presentation/screens/home_screen.dart';
import 'package:bloctest/presentation/screens/second_screen.dart';
import 'package:bloctest/presentation/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
          value: _counterCubit,
          child: const HomeScreen(title: 'Home Screen', color: Colors.blueAccent),
        ),
        '/second': (context) => BlocProvider.value(
          value: _counterCubit,
          child: const SecondScreen(title: 'Second Screen', color: Colors.redAccent),
        ),
        '/third': (context)  => BlocProvider.value(
          value: _counterCubit,
          child: const ThirdScreen(title: 'Third Screen', color: Colors.greenAccent),
        ),
      }
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}

