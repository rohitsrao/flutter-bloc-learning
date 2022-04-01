part of 'internet_cubit.dart';

abstract class InternetState {}

class InternetConnected extends InternetState{

  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {
}

class InternetLoading extends InternetState {
}

