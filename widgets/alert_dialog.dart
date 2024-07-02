
import 'package:flutter/cupertino.dart';

class MyAlertDialog {
  static void showMyDialog(
      {required BuildContext context,
      required String title,
      required content,
      required Function() tabNo,
      required Function() tabYes}) {
    showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  child: const Text('NO'),
                  onPressed: tabNo,
                ),
                CupertinoDialogAction(
                  child: const Text('Yes'),
                  isDestructiveAction: true,
                  onPressed: tabYes,
                )
              ],
            ));
  }
}