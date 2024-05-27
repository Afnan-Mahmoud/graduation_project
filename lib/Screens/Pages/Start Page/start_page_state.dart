part of 'start_page_cubit.dart';

@immutable
abstract class StartPageState {}

class StartPageInitial extends StartPageState {}
class ChangeIndexSuc extends StartPageState {}
class ChangeBottomNavigationCheckSuc extends StartPageState {}
class GetPicSuc extends StartPageState {}
class CancelPicImageSuc extends StartPageState {}
class ProfileGetDataFromFirebaseSuccsesState extends StartPageState{}
class SetProfileGetDataFromFirebaseLoadingState extends StartPageState{}
