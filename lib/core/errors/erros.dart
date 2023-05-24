// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Faliure {
  final String errorMessage;
  Faliure({
    required this.errorMessage,
  });
}

class LocalDataFaliure implements Faliure {
  @override
  
  String get errorMessage => "Local data error";
  

}