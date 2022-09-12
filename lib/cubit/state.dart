abstract class BazaarStates {}
class InitialState extends BazaarStates{}
class SignUpState extends BazaarStates{}
class LoginState extends BazaarStates{}
class CreateUserState extends BazaarStates{}
class SocialGetUserLoadingState extends BazaarStates{}
class SocialGetUserSuccessState extends BazaarStates{}
class SocialGetUserErrorState extends BazaarStates{
  final String error;
  SocialGetUserErrorState(this.error);
}
class BottomNavState extends BazaarStates{}
class SocialRegistervisiblepassState extends BazaarStates{}
// uploadData
class GetDataCatLoadingState extends BazaarStates{}
class GetDataCatSuccessState extends BazaarStates{}
class GetDataCatErrorState extends BazaarStates{
  final String error;
  GetDataCatErrorState(this.error);
}
class GetNamesCatLoadingState extends BazaarStates{}
class GetNamesCatSuccessState extends BazaarStates{}
class GetNamesCatErrorState extends BazaarStates{
  final String error;
  GetNamesCatErrorState(this.error);
}