import 'package:app01/layout/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(HomeLayoutInitialState());

  static getCubitObj(context) => BlocProvider.of(context);
}
