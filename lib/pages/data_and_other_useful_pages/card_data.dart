import 'package:flutter/material.dart';

class CardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    required this.cardColor,
  });
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "VINAY P",
    cardNumber: "****  ****  ****  1234",
    cvv: "**4",
    expDate: "12/23",
    cardColor: const Color.fromARGB(255, 61, 84, 96),
  ),
];
