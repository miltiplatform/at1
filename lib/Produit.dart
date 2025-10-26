// lib/produit.dart
class Produit {
  String nom;
  bool selected;

  Produit({
    required this.nom,
    this.selected = false,
  });

  // Convertir un produit en Map (utile pour stockage ou JSON)
  Map<String, dynamic> toMap() {
    return {
      'nom': nom,
      'selected': selected,
    };
  }

  // Créer un produit à partir d'une Map
  factory Produit.fromMap(Map<String, dynamic> map) {
    return Produit(
      nom: map['nom'] ?? '',
      selected: map['selected'] ?? false,
    );
  }
}
