part of 'theme_cubit.dart';

@immutable
sealed class ThemeState {}

final class ThemeInitial extends ThemeState {}

final class ThemeMode extends ThemeState {}

final class LoadSavedState extends ThemeState {}
