
abstract class SocialApp{}
class IntialStates extends SocialApp
{

}
class onLoadingLogin extends SocialApp{}
class onsucessLogin extends SocialApp{
  final String uId;

  onsucessLogin(this.uId);

}
class onErrorLogin extends SocialApp{
  final String error;

  onErrorLogin(this.error);



}

class showpass extends SocialApp{}

