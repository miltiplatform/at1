import 'package:flutter/material.dart';

class AddProduit extends StatelessWidget {
  final TextEditingController nomController;
  final void Function()? onAdd;
  final void Function()? onCancel;

  const AddProduit({
    super.key,
    required this.nomController,
    this.onAdd,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ajouter un Produit'),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomController,
              decoration: const InputDecoration(
                labelText: 'Nom du Produit',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: onAdd,
                  child: const Text('Ajouter'),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: onCancel,
                  child: const Text('Annuler'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
