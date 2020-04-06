part of 'appraise_bloc.dart';

@immutable
abstract class AppraiseEvent {}

class UpdateAppraise extends AppraiseEvent {
  final ui.Size containerSize;
  final ui.Offset offset;

  UpdateAppraise(this.offset, this.containerSize);
}

class CancelAppraise extends AppraiseEvent {}

class LoadAppraise extends AppraiseEvent {
  final File imageFile;

  LoadAppraise(this.imageFile);
}
