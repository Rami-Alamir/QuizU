import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/auth.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        backgroundColor: Theme.of(context).backgroundColor,
        contentPadding: const EdgeInsets.all(0),
        content: Builder(
          builder: (context) {
            return Container(
              constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 25, 10, 20),
                      child: Icon(Icons.logout,
                          size: 35, color: Theme.of(context).primaryColor)),
                  Text(
                    "Logout",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Are you sure you want to log out?",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.grey, fontSize: 16),
                  ),
                ),
                Container(
                    width: 2,
                    height: 25,
                    color: Theme.of(context).colorScheme.secondaryContainer),
                TextButton(
                  onPressed: () {
                    final Auth auth = Provider.of<Auth>(context, listen: false);
                    auth.logout();
                    Navigator.pop(context);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/Login", (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "Yes",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
