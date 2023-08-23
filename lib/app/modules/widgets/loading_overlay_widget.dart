import 'package:css/app/modules/widgets/loading_indicator_widget.dart';
import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.7),
            child: const Center(
              child: LoadingIndicator(color: Colors.white),
            ),
          )
        : const SizedBox();
  }
}
