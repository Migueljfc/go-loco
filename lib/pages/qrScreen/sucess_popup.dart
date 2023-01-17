import 'package:cm_project/pages/qrScreen/putData.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

// ignore: camel_case_types
class sucessPopup extends StatelessWidget {
  final String qrcode;
  const sucessPopup(BuildContext context, {super.key, required this.qrcode});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Parabéns'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('Concluiu a sua jornada!'),
            Text('Clique em Terminar para regressar'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Terminar'),
          onPressed: () async {
            final response = await putData(qrcode);
            if (response.statusCode == 200) {
              print("RESPONSE: success, post was created");
            } else if (response.statusCode == 404) {
              print(
                  "RESPONSE: bad request, check response.body for more details");
            } else {}
            Restart.restartApp();
          },
        ),
      ],
    );
  }
}
