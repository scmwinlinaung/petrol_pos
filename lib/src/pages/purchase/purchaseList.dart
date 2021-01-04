import 'package:OilPos/src/pages/purchase/purchaseListBody.dart';

import 'package:flutter/cupertino.dart';

class PurchasesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: PurchaseListBody());
  }
}
