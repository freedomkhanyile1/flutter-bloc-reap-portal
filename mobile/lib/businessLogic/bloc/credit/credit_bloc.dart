import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'credit_event.dart';
part 'credit_state.dart';

class CreditBloc extends Bloc<CreditEvent, CreditState> {
  CreditBloc() : super(CreditInitial());

  @override
  Stream<CreditState> mapEventToState(
    CreditEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
