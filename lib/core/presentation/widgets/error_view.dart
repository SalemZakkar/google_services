import 'package:flutter/material.dart';
import 'package:google_services/core/domain/entity/failures.dart';

class ErrorView extends StatefulWidget {
  final Function? onRetry;
  final Failure? failure;

  const ErrorView({super.key, this.onRetry, this.failure});

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    String error = 'OOPS! Something went wrong';
    if (widget.failure is ServerFailure) {
      error = (widget.failure! as ServerFailure).message;
    } else if (widget.failure is CustomFailure) {
      error = (widget.failure! as CustomFailure).message;
    } else if (widget.failure is NetworkFailure) {
      error = 'No internet connection';
    }
    return Column(
      children: [
        Text(error),
        if (widget.onRetry != null) ...[
          const SizedBox(height: 8),
          IconButton(
            onPressed: () {
              widget.onRetry?.call();
            },
            icon: Icon(Icons.refresh, color: Colors.red),
          ),
        ],
      ],
    );
  }
}
