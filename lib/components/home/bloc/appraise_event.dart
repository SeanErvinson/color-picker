part of 'appraise_bloc.dart';

@immutable
abstract class AppraiseEvent {}

class UpdateAppraise extends AppraiseEvent {
  final Offset offset;

  UpdateAppraise(this.offset);
}

class CancelAppraise extends AppraiseEvent {}

class LoadAppraise extends AppraiseEvent {
  final File imageFile;

  LoadAppraise(this.imageFile);
}
