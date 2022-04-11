import '../model/auth_model.dart';
import '../provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login(String username, String password) async {
    Map<String, dynamic> json = await apiClient.login(username, password);
    /* usamos o getStorage para salvar ( como uma session/cookie ) crypting os dados*/

    return Auth.fromJson(json);
  }
}
