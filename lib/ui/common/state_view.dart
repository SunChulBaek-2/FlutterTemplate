import 'package:flutter/material.dart';
import 'package:flutter_template/bloc/model/state_base.dart';
import 'package:flutter_template/ui/common/error.dart';

import 'loading.dart';

class StateView extends StatelessWidget {
  const StateView({
    required this.state,
    this.child,
    super.key
  });

  final StateXBase state;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const LoadingScreen();
    } else if (state.isSuccess) {
      return child!;
    } else {
      return const ErrorScreen();
    }
  }
}