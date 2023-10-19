part of 'settings_cubit.dart';

sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}

final class LanguageStateSuccess extends SettingsState {}

final class SignOutStateSuccess extends SettingsState {}

final class SignOutStateLoading extends SettingsState {}

final class NavigationSuccess extends SettingsState {}
