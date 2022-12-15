abstract class RegistState{}
class IntialStateRegist extends RegistState{}
class OnSucessRegist extends RegistState{}
class OnErrorRegist extends RegistState{}
class OnLoadingRegist extends RegistState{}


class OnSucessCreateUserRegist extends RegistState{}
class OnErrorCreateUserRegist extends RegistState{
  final String error;

  OnErrorCreateUserRegist(this.error);

}

class showReistpass extends RegistState{}
