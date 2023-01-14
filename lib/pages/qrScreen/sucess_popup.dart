import 'package:cm_project/pages/qrScreen/postData.dart';
import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

// ignore: camel_case_types
class sucessPopup extends StatelessWidget {
  const sucessPopup(BuildContext context, {super.key});

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
            final response =
                await postData({"title": "TESTE GOLOCO", "body": "Era uma vez um gato maltes cagou-te na boca não sei o que te fez", "userId": 69});
            if (response.statusCode == 201) {
              print("RESPONSE: success, post was created");
            } else if (response.statusCode == 400) {
              print(
                  "RESPONSE: bad request, check response.body for more details");
            } else {}
            Restart.restartApp();
            /* Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  MapsPage(),
                    ),
                  ); */
          },
        ),
      ],
    );
  }
}
