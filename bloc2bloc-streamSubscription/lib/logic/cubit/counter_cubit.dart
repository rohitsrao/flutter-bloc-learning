import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloctest/constants/enums.dart';
import 'package:bloctest/logic/cubit/internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {

  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit}) : super(CounterState(counterValue: 0, wasIncremented: false)) {
    monitorInternetCubit();
  }

  void increment() => emit(CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1, wasIncremented: false));

  void monitorInternetCubit() {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected ) {
        if (internetState.connectionType == ConnectionType.wifi) {
          increment();
        }
        if (internetState.connectionType == ConnectionType.mobile) {
          decrement();
        }
      }
    });
  }


  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
