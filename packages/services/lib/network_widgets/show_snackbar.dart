import 'package:flutter/material.dart';
import 'package:services/data_providers/data_providers.dart';

void showSnackBarIfError(BuildContext context, {required ServiceStatus status}) {
  if (status.isError) {
    showRawSnackBar(context: context, title: status.message, isError: true);
  }
}

void showSnackBar(BuildContext context, {required ServiceStatus status}) {
  showRawSnackBar(context: context, title: status.message, isError: status.isError);
}

void showRawSnackBar({
  required BuildContext context,
  required String title,
  bool? isError,
  Color? color,
  int milliseconds = 1800,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: milliseconds),
      padding: const EdgeInsets.all(16),
      backgroundColor: color ??
          (isError == null
              ? Colors.black
              : isError == true
                  ? Colors.red
                  : const Color(0xff30BA00)),
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
