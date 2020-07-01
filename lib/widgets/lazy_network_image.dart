import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../constant.dart';

const grey100 = const Color(0xFFF5F5F5);
const grey300 = const Color(0xFFE0E0E0);

class LazyNetworkImage extends StatelessWidget {
  final String imageUrl;

  const LazyNetworkImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Shimmer.fromColors(
        baseColor: grey300,
        highlightColor: grey100,
        child: Center(
          child: Container(
            color: kWhite,
          ),
        ),
      ),
      FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: imageUrl,
        fit: BoxFit.cover,
      ),
    ]);
  }
}
