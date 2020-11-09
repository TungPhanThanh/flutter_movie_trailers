part of net;

/// convert response
class AdapterInterceptor extends Interceptor {
  @override
  Future onResponse(Response response) {
    if (response.statusCode != successful) {
      return onError(DioError(
        response: response,
        request: response.request,
        error: '',
      ));
    }
    return super.onResponse(adapterData(response));
  }

  Response adapterData(Response response) {
    return response;
  }
}
