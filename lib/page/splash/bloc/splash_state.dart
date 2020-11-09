import 'package:equatable/equatable.dart';

enum SplashStatus{nothing}

class SplashState extends Equatable{

  const SplashState._({this.status = SplashStatus.nothing});

  const SplashState.nothing() : this._();

  final SplashStatus status;

  @override
  List<Object> get props => [status];
}