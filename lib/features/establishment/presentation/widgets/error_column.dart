import 'package:flutter/material.dart';

class ErrorColumn extends StatelessWidget {
  final VoidCallback onPressed;
  const ErrorColumn({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Erro ao trazer a lista de estabelecimentos!',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Tente novamente',
            ),
          ),
        ],
      ),
    );
  }
}
