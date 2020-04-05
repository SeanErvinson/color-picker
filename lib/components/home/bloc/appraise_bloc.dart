import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appraise_event.dart';
part 'appraise_state.dart';

class AppraiseBloc extends Bloc<AppraiseEvent, AppraiseState> {
  @override
  AppraiseState get initialState => AppraiseInitial();

  @override
  Stream<AppraiseState> mapEventToState(
    AppraiseEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
