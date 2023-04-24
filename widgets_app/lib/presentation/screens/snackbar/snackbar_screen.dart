import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(label: 'Ok!', onPressed: () {}),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void openDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Estas seguro?'),
          content: const Text(
              'Pariatur nostrud laboris ex Lorem nostrud labore esse officia tempor qui ullamco elit. Non mollit magna ullamco fugiat cillum ut ut deserunt. Cillum cupidatat minim mollit aute aute velit velit labore eu adipisicing elit aliqua qui ut. Cupidatat nostrud consectetur culpa enim ea. Irure non exercitation reprehenderit id mollit culpa ad ut aliquip officia est aliquip. Aliquip reprehenderit incididunt consectetur sit esse.'),
          actions: [
            TextButton(
                onPressed: () => context.pop(), child: const Text('Cancelar')),
            FilledButton(
                onPressed: () => context.pop(), child: const Text('Aceptar')),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'In voluptate dolore non ullamco consequat dolore dolor nostrud excepteur ipsum. Nostrud culpa magna quis consequat eiusmod quis Lorem nostrud aliqua consectetur ad. Anim mollit esse cupidatat commodo aliquip.')
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar dialogo'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
