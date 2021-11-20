import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticatedHttpClient extends http.BaseClient {
  // Use a memory cache to avoid local storage access in each call
  static final AuthenticatedHttpClient _authenticatedHttpClient =
      AuthenticatedHttpClient._internal();

  factory AuthenticatedHttpClient() {
    return _authenticatedHttpClient;
  }

  AuthenticatedHttpClient._internal();
  String _inMemoryToken = '';
  Future<String> getUserAccessToken() async {
    // use in memory token if available
    if (_inMemoryToken.isNotEmpty) return _inMemoryToken;

    // otherwise load it from local storage
    _inMemoryToken = await _loadTokenFromSharedPreference();

    return _inMemoryToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String userAccessToken = await getUserAccessToken();

    if (userAccessToken.isNotEmpty) {
      request.headers.putIfAbsent('Authorization', () => userAccessToken);
      request.headers
          .putIfAbsent('Content-Type', () => 'application/json; charset=UTF-8');
    }

    print(request);

    return request.send();

    // intercept each call and add the Authorization header if token is available
  }

  Future<String> _loadTokenFromSharedPreference() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var accessToken = '';
    final user = sharedPref.getString("token");

    // If user is already authenticated, we can load his token from cache
    if (user != null) {
      accessToken = user;
    }
    return accessToken;
  }

  // Don't forget to reset the cache when logging out the user
  void reset() {
    _inMemoryToken = '';
  }
}
