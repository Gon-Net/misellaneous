import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget1_app/config/router/app_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo...!!!'),
      action: SnackBarAction(label: 'OK !', onPressed: (){
      
      }),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro??'),
        content: const Text('Esto es un ejemplo, de show dialog para mostrar mensajes resumidos el contenido del aplicatikvo'),
        actions: [
          TextButton(
            onPressed: () => context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Snackbars y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Esto es un ejemplo, de show dialog para mostrar mensajes resumidos el contenido del aplicatikvo')
                  ]
                );
            }, 
            child: const Text('Licencias usadas...')),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
            child: const Text('Mostrar dialogo...')),
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