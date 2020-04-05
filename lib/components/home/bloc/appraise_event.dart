part of 'appraise_bloc.dart';

@immutable
abstract class AppraiseEvent {}

class UpdateAppraise extends AppraiseEvent {
  final Coordinate coordinate;

  UpdateAppraise(this.coordinate);
}

class CancelAppraise extends AppraiseEvent {}

class LoadAppraise extends AppraiseEvent {
  final File imageFile;

  LoadAppraise(this.imageFile);
}
