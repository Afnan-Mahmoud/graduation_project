part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class SignupVaildatorEmailSuccsesState extends RegisterState{}
class SignupVaildatorEmailErrorState extends RegisterState{}
class SignupVaildatorPasswordSuccsesState extends RegisterState{}
class SignupVaildatorPasswordErrorState extends RegisterState{}
class SignupVaildatorRePasswordSuccsesState extends RegisterState{}
class SignupVaildatorRePasswordLoadingState extends RegisterState{}
class SignupVaildatorRePasswordErrorState extends RegisterState{}
class VisablityState extends RegisterState{}
class UnvisablityState extends RegisterState{}
class SignupLoadingState extends RegisterState{}
class SignupErrorState extends RegisterState{
  String error;
  SignupErrorState(this.error);
}
class SignupSuccsesState extends RegisterState{}
class SignupWithGmailLoadingState extends RegisterState{}
class SignupWithGmailErrorState extends RegisterState{}
class SignupWithGmailSuccsesState extends RegisterState{}
class ProfileLoadingState extends RegisterState{}
class SetProfilePictureSuccsesUploadState extends RegisterState{}
class SetProfilePictureSuccsesUploadToFirebaseState extends RegisterState{}
class SetProfilePictureErrorUploadState extends RegisterState{}
class SetProfileNameSuccsesValidationState extends RegisterState{}
class SetProfileNameErrorValidationState extends RegisterState{}
class SetProfileLastNameSuccsesValidationState extends RegisterState{}
class SetProfilePhoneNoSuccsesState extends RegisterState{}
class SetProfileSuccsesState extends RegisterState{}
class SetProfileLastNameErrorValidationState extends RegisterState{}
class LoadingLoginState extends RegisterState{}
class SuccsesLoginState extends RegisterState{}
class ErrorLoginState extends RegisterState{}
