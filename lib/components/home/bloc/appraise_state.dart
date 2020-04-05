part of 'appraise_bloc.dart';

@immutable
abstract class AppraiseState {}

class AppraiseInitial extends AppraiseState {}

class AppraiseUpdating extends AppraiseState {
  final ColorValue colorValue;

  AppraiseUpdating(this.colorValue);
}
