import 'package:flutter/material.dart';
import 'produit_box.dart';

// Classe principale
class ProduitsList extends StatefulWidget {
  const ProduitsList({super.key});

  @override
  State<ProduitsList> createState() => _ProduitsListState();
}

class _ProduitsListState extends State<ProduitsList> {
  // Liste des produits : [nom, sélectionné]
  final List<List<dynamic>> liste = [
    ["Produit 1", false],
    ["Produit 2", false],
    ["Produit 3", false],
  ];

  // Contrôleur pour le champ de texte
  final TextEditingController nomController = TextEditingController();

  // Fonction déclenchée lors du clic sur la case à cocher
  void _onChanged(bool? value, int index) {
    setState(() {
      liste[index][1] = value!;
    });
  }

  // Fonction pour enregistrer le nouveau produit
  void saveProduit() {
    setState(() {
      if (nomController.text.isNotEmpty) {
        liste.add([nomController.text, false]);
      }
      nomController.clear(); // vide le champ
    });
    Navigator.of(context).pop(); // ferme la boîte de dialogue
  }

  // Fonction pour supprimer un produit spécifique
  void delProduit(int index) {
    setState(() {
      liste.removeAt(index);
    });
  }

  // Fonction pour supprimer tous les produits sélectionnés
  void delSelected() {
    setState(() {
      liste.removeWhere((produit) => produit[1] == true);
    });
  }

  // Fonction pour afficher la boîte de dialogue pour ajouter un produit
  void addProduit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Ajouter un produit"),
          content: TextField(
            controller: nomController,
            decoration: const InputDecoration(
              hintText: "Nom du produit",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Annuler"),
            ),
            ElevatedButton(
              onPressed: saveProduit,
              child: const Text("Ajouter"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Produits'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: "Supprimer les produits sélectionnés",
            onPressed: delSelected,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: liste.length,
        itemBuilder: (context, index) {
          return ProduitBox(
            nomProduit: liste[index][0],
            selProduit: liste[index][1],
            onChanged: (value) => _onChanged(value, index),
            delProduit: () => delProduit(index), // 🗑 Trash icon
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addProduit,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    nomController.dispose();
    super.dispose();
  }
}
