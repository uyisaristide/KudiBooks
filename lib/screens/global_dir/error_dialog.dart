import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../dashboard/classes/snack_bars.dart';

class ErrorDialogClass extends ConsumerWidget {
  String errors;

  ErrorDialogClass({Key? key, required this.errors}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SnackBars.snackBars(errors, Colors.green.shade400);
  }
}
