import 'package:bank_app/pages/home_pages/transactions.dart';
import 'package:flutter/material.dart';

import '../data_and_other_useful_pages/transactions_data.dart';

class Transac extends StatelessWidget {
  const Transac({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: myTransactions.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemBuilder: (context, index) {
            return TransactionCard(transaction: myTransactions[index]);
          }),
    );
  }
}
