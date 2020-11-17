part of net;

/// convert response
class AdapterInterceptor extends Interceptor {
  @override
  Future onResponse(Response response) {
    if (response.statusCode != successful) {
      String errorMsg;
      if (response.data is Map) {
        errorMsg = response.data['message'];
      }
      return onError(DioError(
        response: response,
        request: response.request,
        error: errorMsg,
      ));
    }
    return super.onResponse(adapterData(response));
  }

  Response adapterData(Response response) {
    return response;
  }
}
