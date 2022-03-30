import 'package:bloc_test/bloc_test.dart';
import 'package:test/test.dart';
import 'package:bloctest/cubit/counter_cubit.dart';

void main() {

  group('CounterCubit', () {
    late CounterCubit counterCubit;
    
    setUp(() {
      counterCubit = CounterCubit();
    });
    
    tearDown(() {
      counterCubit.close();
    });
    
    test('has initial state - CounterState(counterValue: 0, wasIncremented: false)', () {
      expect(counterCubit.state, CounterState(counterValue: 0, wasIncremented: false));
    });
    
    blocTest('emits a CounterState(counterValue: 1, wasIncremented: true) when cubit.increment() is called', 
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)]
    );
    
    blocTest('emits a CounterState(counterValue: -1, wasIncremented: false) when cubit.decrement() is called', 
      build: () => counterCubit,
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)]
    );

  });
}
