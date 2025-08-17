import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_services/core/domain/entity/failures.dart';
import 'package:google_services/core/presentation/cubit/base_state.dart';
import 'package:google_services/core/presentation/widgets/error_view.dart';

import 'loader.dart';

class GoogleServicesBlocWidget<T> extends StatefulWidget {
  final BlocBase<GoogleServicesBaseState<T>> cubit;
  final Widget Function(BuildContext context)? loadingBuilder;
  final ValueChanged<T>? onDataReceived;
  final ValueChanged<Failure>? onError;
  final Widget Function(BuildContext context, T t) childBuilder;
  final VoidCallback? onRetry;

  const GoogleServicesBlocWidget({
    super.key,
    required this.cubit,
    required this.childBuilder,
    this.loadingBuilder,
    this.onError,
    this.onDataReceived,
    required this.onRetry,
  });

  @override
  State<GoogleServicesBlocWidget<T>> createState() =>
      _GoogleServicesBlocWidgetState<T>();
}

class _GoogleServicesBlocWidgetState<T>
    extends State<GoogleServicesBlocWidget<T>> {
  @override
  void dispose() {
    super.dispose();
    widget.cubit.close();
  }

  @override
  void initState() {
    super.initState();
    if (widget.cubit.state.isSuccess) {
      WidgetsBinding.instance.addPostFrameCallback((e) {
        widget.onDataReceived?.call(widget.cubit.state.item as T);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, GoogleServicesBaseState<T> state) {
        if (state.isSuccess) {
          widget.onDataReceived?.call(state.item as T);
        }
        if (state.isFailure) {
          widget.onError?.call(state.failure!);
        }
      },
      bloc: widget.cubit,
      builder: (context, GoogleServicesBaseState<T> state) {
        if (state.isInProgress) {
          return widget.loadingBuilder?.call(context) ?? const Loader();
        }
        if (state.isFailure) {
          return ErrorView(failure: state.failure!, onRetry: widget.onRetry);
        }
        if (state.isSuccess) {
          return widget.childBuilder.call(context, state.item as T);
        }
        return const SizedBox();
      },
    );
  }
}
