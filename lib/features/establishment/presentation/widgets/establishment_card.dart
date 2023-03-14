import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/establishment_entity.dart';

class EstablishmentCard extends StatelessWidget {
  //final GlobalKey imageGK = GlobalKey();
  final EstablishmentEntity item;
  const EstablishmentCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Hero(
                tag: item.urlLogo,
                child: CachedNetworkImage(
                  imageUrl: item.urlLogo,
                  // key: imageGK,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(
                        Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              item.fantasyName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 5,
            ),
            if (item.discountAmount > 0)
              Text(
                '${item.discountAmount}% de desconto!',
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
