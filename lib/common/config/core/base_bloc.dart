import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<EVENT extends Equatable, STATE extends Equatable>
    extends Bloc<EVENT, STATE> {
  BaseBloc(STATE initialState) : super(initialState);
}
