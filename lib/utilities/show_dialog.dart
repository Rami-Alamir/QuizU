import 'package:flutter/material.dart';
import '../widgets/profile/confirm_dialog.dart';

class ShowConfirmDialog {
  Future confirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const ConfirmDialog();
      },
    );
  }
}
