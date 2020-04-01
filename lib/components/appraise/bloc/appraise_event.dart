part of 'appraise_bloc.dart';

@immutable
abstract class AppraiseEvent {}

class LoadImageBytes extends AppraiseEvent {
  final File imageFile;

  LoadImageBytes(this.imageFile);
}

class UpdateAppraise extends AppraiseEvent {
  final pt.Point point;

  UpdateAppraise(this.point);
}

class CancelAppraise extends AppraiseEvent {}
