import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/repository/model/entity/genre.dart';

typedef ButtonCallback = void Function();

class GenreItem extends StatefulWidget {
  final Genre genre;
  final ButtonCallback onClickGenre;

  const GenreItem({Key key, this.genre, this.onClickGenre}) : super(key: key);

  @override
  _GenreItemState createState() => _GenreItemState();
}

class _GenreItemState extends State<GenreItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onClickGenre != null) widget.onClickGenre();
      },
      child: AspectRatio(
        aspectRatio: 1.966,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(
              widget.genre?.name ?? '',
            ),
          ),
        ),
      ),
    );
  }
}
