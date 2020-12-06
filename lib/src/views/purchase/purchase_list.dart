import 'package:OilPos/src/views/purchase/purchase_list_body.dart';

import 'package:flutter/cupertino.dart';

class PurchasesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: PurchaseListBody());
  }
}
