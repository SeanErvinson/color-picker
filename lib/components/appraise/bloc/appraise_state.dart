part of 'appraise_bloc.dart';

@immutable
abstract class AppraiseState {}

class AppraiseInitial extends AppraiseState {}

class AppraiseUpdate extends AppraiseState {
  final pt.Point point;
  final ColorValue colorValue;

  AppraiseUpdate({this.colorValue, this.point});
}
