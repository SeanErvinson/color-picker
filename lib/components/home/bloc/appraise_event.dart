part of 'appraise_bloc.dart';

@immutable
abstract class AppraiseEvent {}

class UpdateAppraise extends AppraiseEvent {}

class CancelAppraise extends AppraiseEvent {}