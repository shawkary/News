abstract class NewsStates{}

class InitialNewsState extends NewsStates{}


class BottomNavNewsState extends NewsStates{}

class LoadingBusinessNewsState extends NewsStates{}
class SuccessBusinessNewsState extends NewsStates{}
class ErrorBusinessNewsState extends NewsStates{
  final String error;
  ErrorBusinessNewsState({required this.error});
}

class LoadingScienceNewsState extends NewsStates{}
class SuccessScienceNewsState extends NewsStates{}
class ErrorScienceNewsState extends NewsStates{
  final String error;
  ErrorScienceNewsState({required this.error});
}

class LoadingSportsNewsState extends NewsStates{}
class SuccessSportsNewsState extends NewsStates{}
class ErrorSportsNewsState extends NewsStates{
  final String error;
  ErrorSportsNewsState({required this.error});
}

class LoadingSearchNewsState extends NewsStates{}
class GettingSearchNewsState extends NewsStates{}
class ErrorSearchNewsState extends NewsStates{
  final String error;
  ErrorSearchNewsState({required this.error});
}

class DropDownButtonNewsState extends NewsStates{}