import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:saverecipe/provider/loading_provider.dart';

class LoadingModal extends StatelessWidget {
  final Widget child;

  const LoadingModal({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingProvider>(
      builder: (context, loadingProvider, _) {
        return LoadingOverlay(
          isLoading: loadingProvider.isLoading,
          progressIndicator: SpinKitFadingFour(color: Colors.red),
          child: child ?? Container(),
        );
      },
    );
  }
}
