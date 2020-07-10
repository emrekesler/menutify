import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String pictureUrl;
  final String text;
  final List<Color> colors;

  const CategoryCard({
    Key key,
    this.pictureUrl,
    this.text,
    this.colors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (rect) => LinearGradient(
                    colors: colors,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)
                .createShader(rect),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(
                    pictureUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 30.0,
                  ),
                ],
                color: Colors.red,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
