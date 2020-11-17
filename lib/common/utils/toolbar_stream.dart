import 'dart:async';

import 'package:flutter_movie/repository/model/entity/movie.dart';

class ToolbarStream {
  static final ToolbarStream shared = ToolbarStream();
  final StreamController _toolbarController = StreamController.broadcast();

  sendEvent(Movie data) {
    _toolbarController.sink.add(data);
  }

  listen(Function function) {
    _toolbarController.stream.listen(function);
  }

  dispose() {
    _toolbarController.close();
  }
}
