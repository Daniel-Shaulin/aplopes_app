
const String testeLocal = '10.0.0.119';
const String aplopesApi = 'http://$testeLocal:8081';


abstract class Endpoints{
  static const String signin = '$aplopesApi/user/oauth';
  static const String signup = '$aplopesApi/user';
}