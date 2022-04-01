import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloctest/constants/enums.dart';
import 'package:bloctest/logic/cubit/counter_cubit.dart';
import 'package:bloctest/logic/cubit/internet_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected) {
          if (state.connectionType == ConnectionType.wifi) {
            BlocProvider.of<CounterCubit>(context).increment();
          }
          if (state.connectionType == ConnectionType.mobile) {
            BlocProvider.of<CounterCubit>(context).decrement();
          }
        }
      },
      child: Scaffold(
        //key: homeScreenKey,
        appBar: AppBar(
          backgroundColor: widget.color,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected) {
                    if (state.connectionType == ConnectionType.wifi) {
                      return const Text('Connected to WiFi');
                    }
                    if (state.connectionType == ConnectionType.mobile) {
                      return const Text('Connected to mobile');
                    }
                  }
                  if (state is InternetDisconnected) {
                    return const Text('Not connected to any network');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const Text('You have pushed the button this many times:'),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  //if (state.wasIncremented == true) {
                  //  homeScreenKey.currentState?.showSnackBar(
                  //    const SnackBar(
                  //      content: Text('Incremented!'),
                  //      duration: Duration(milliseconds: 300),
                  //    ),
                  //  );
                  //} else if (state.wasIncremented == false) {
                  //  homeScreenKey.currentState?.showSnackBar(
                  //    const SnackBar(
                  //      content: Text('Decremented!'),
                  //      duration: Duration(milliseconds: 300),
                  //    ),
                  //  );
                  //}
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'BRR, NEGATIVE ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue % 2 == 0) {
                    return Text(
                      'YAAAY ' + state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'HMM, NUMBER 5',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: Text(widget.title),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                      // context.bloc<CounterCubit>().decrement();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: Text('${widget.title} 2nd'),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                      //context.bloc<CounterCubit>().increment();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              //MaterialButton(
              //  color: Colors.redAccent,
              //  child: const Text(
              //    'Go to Second Screen',
              //    style: TextStyle(color: Colors.white),
              //  ),
              //  onPressed: () {
              //    Navigator.of(context).pushNamed(
              //      '/second',
              //      arguments: homeScreenKey,
              //    );
              //  },
              //),
              //const SizedBox(
              //  height: 24,
              //),
              //MaterialButton(
              //  color: Colors.greenAccent,
              //  child: const Text(
              //    'Go to Third Screen',
              //    style: TextStyle(color: Colors.white),
              //  ),
              //  onPressed: () {
              //    Navigator.of(context).pushNamed(
              //      '/third',
              //    );
              //  },
              //),
            ],
          ),
        ),
      )
    );
  }
}
