
const String testeLocal = '10.0.0.119';
const String aplopesApi = 'http://$testeLocal:8081';


abstract class Endpoints{
  static const String signin = '$aplopesApi/oauth/token';
  static const String signup = '$aplopesApi/user';
}