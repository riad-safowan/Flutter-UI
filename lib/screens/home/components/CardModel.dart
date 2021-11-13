class CardModel {
  String user;
  String cardNumber;
  String icon;
  int background;

  CardModel(this.user, this.cardNumber, this.background, this.icon);
}

var cardData = [
  {
    "icon": "assets/icons/icon_3.svg",
    "user": "Riad Safowan",
    "cardNumber": "34763598987",
    "background": 0xFF1E1E99,
    "position": "@CTO"
  },
  {
    "icon": "assets/icons/icon_4.svg",
    "user": "Sarder Ping",
    "cardNumber": "23423598987",
    "background": 0xFFFF70A3,
    "position": "@CEO"
  },
  {
    "icon": "assets/icons/icon_3.svg",
    "user": "Tanvir Islam",
    "cardNumber": "8763463598987",
    "background": 0xFF1E1E99,
    "position": "@MAMA"
  },
];
