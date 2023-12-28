class CardModel {
  final String cardTypeImage;
  final String cardName;
  final String cardNumber;
  final String cardHolderName;
  final DateTime validDate;
  CardModel({
    required this.cardTypeImage,
    required this.cardName,
    required this.cardNumber,
    required this.cardHolderName,
    required this.validDate,
  });
}
