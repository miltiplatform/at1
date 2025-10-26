import 'package:flutter/material.dart';

class ProduitBox extends StatelessWidget {
  final String nomProduit;
  final bool selProduit;
  final Function(bool?)? onChanged;
  final VoidCallback? delProduit;

  const ProduitBox({
    super.key,
    required this.nomProduit,
    this.selProduit = false,
    this.onChanged,
    this.delProduit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
      child: Row(
        children: [
          // Yellow box with checkbox and product name
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 60,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Checkbox(
                    value: selProduit,
                    onChanged: onChanged,
                  ),
                  Text(
                    nomProduit,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Red delete pill button
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: delProduit,
            ),
          ),
        ],
      ),
    );
  }
}
