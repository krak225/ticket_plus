import 'package:flutter/material.dart';

import '../config/app_constants.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/model/produit.dart';
import '../utils/stdfn.dart';

class BuildListProduits extends StatelessWidget {
  const BuildListProduits({
    required this.produit,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Produit produit;
  final Function() onPressed;
  final Function()? onPressedAssign;
  final Function()? onPressedMember;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: onPressed,
      hoverColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      leading: _buildIcon(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      trailing: _buildAssign(),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: Image.network(AppConstants.PRODUCTS_URL+produit.produitPhotoPrincipale!, fit: BoxFit.contain)//data.icon,
    );
  }

  Widget _buildTitle() {
    return Text(
      produit.produitNom!,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text(
      produit.categorieNom! + " - en stock: " + produit.produitQuantiteRestante.toString(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAssign() {
    return Tooltip(
              message: produit.produitPrix.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                child: Container(
                    //width: 50.0,
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    color: Colors.orange.withOpacity(.7),
                    child:Text(
                      Stdfn.toAmount(produit.produitPrix!),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),
                ),
              )
          );

  }
}
