import 'package:flutter/material.dart';
import 'package:google_services/core/domain/entity/failures.dart';
import 'loading_dialog.dart';

class DialogUtil {
  BuildContext context;
  final bool canPop;
  final VoidCallback? onShow, onDone, onCancel;

  DialogUtil({
    required this.context,
    this.canPop = true,
    this.onDone,
    this.onShow,
    this.onCancel,
  });

  Future<void> showLoadingDialog() async {
    onShow?.call();
    await showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => const LoadingDialog(),
      barrierDismissible: false,
    );
    onDone?.call();
  }

  Future<void> showFailDialog({
    Failure? failure,
    bool isFloating = false,
  }) async {
    onShow?.call();
    String message = "error Happened";

    if (failure is ServerFailure) {
      message = failure.message;
    } else if (failure is CustomFailure) {
      message = failure.message;
    } else if (failure is NetworkFailure) {
      message = "Network Error";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.start,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        behavior: isFloating ? SnackBarBehavior.floating : null,
      ),
    );
  }
}
