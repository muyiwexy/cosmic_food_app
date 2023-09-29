import 'package:cosmic_food_app/features/cosmic_food/common/presentation/provider/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    CommonProvider commonProvider = context.watch<CommonProvider>();
    return Scaffold(
      body: Center(
        child: Text("${commonProvider.users!.status}"),
      ),
    );
  }
}
