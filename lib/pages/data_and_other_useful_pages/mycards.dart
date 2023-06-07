import 'package:flutter/material.dart';

import 'card_data.dart';

class MyCard extends StatelessWidget {
  final CardModel card;
  const MyCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          color: card.cardColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ACCOUNT NAME',
                    style: ApptextStyle.MY_CARD_TITLE,
                  ),
                  Text(
                    card.cardHolderName,
                    style: ApptextStyle.MY_CARD_SUBTITLE,
                  )
                ],
              ),
              Text(
                card.cardNumber,
                style: ApptextStyle.MY_CARD_SUBTITLE,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EXP DATE',
                        style: ApptextStyle.MY_CARD_TITLE,
                      ),
                      Text(
                        card.expDate,
                        style: ApptextStyle.MY_CARD_SUBTITLE,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVV NUMBER',
                        style: ApptextStyle.MY_CARD_TITLE,
                      ),
                      Text(
                        card.cvv,
                        style: ApptextStyle.MY_CARD_SUBTITLE,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Image.asset('images/mycard.png'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ApptextStyle {
  static const TextStyle MY_CARD_TITLE = TextStyle(
      color: Colors.amberAccent, fontWeight: FontWeight.w700, fontSize: 16);

  static const TextStyle MY_CARD_SUBTITLE =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18);

  static const TextStyle BODY_TEXT = TextStyle(
      color: Color(0xffff735c), fontWeight: FontWeight.w700, fontSize: 20);

  static const TextStyle LISTTILE_TITLE = TextStyle(
    color: Colors.white,
    fontSize: 20,
  );

  static const TextStyle LISTTILE_SUB_TITLE = TextStyle(
    color: Colors.grey,
    fontSize: 15,
  );
}
