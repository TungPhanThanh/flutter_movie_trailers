part of net;

/// authentication by token
class AuthInterceptor extends Interceptor {
  static const String X_API_KEY = 'd0558e51b04e5c5ca6c4a20908b8599d';
  static const String ACCESS_TOKEN = 'Authorization';

  @override
  Future onRequest(RequestOptions options) async {
    options.headers['Accept'] = 'application/json';

    // options.queryParameters.addEntries('d0558e51b04e5c5ca6c4a20908b8599d');

    final session = await getIt<SessionsPref>().getAccessToken();
    if (session != null) {
      options.headers[ACCESS_TOKEN] = 'Bearer $session';
    }
    return super.onRequest(options);
  }
}