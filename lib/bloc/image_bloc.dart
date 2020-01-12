import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  @override
  ImageState get initialState => InitialImageState();

  @override
  Stream<ImageState> mapEventToState(
    ImageEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
