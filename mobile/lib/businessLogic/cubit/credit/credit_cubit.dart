import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'credit_state.dart';

class CreditCubit extends Cubit<CreditState> {
  CreditCubit() : super(CreditInitial());
}
