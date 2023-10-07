class ModeOfPaymentState {
  final List modeOfPaymentList = ['7-Eleven', 'Family Mart', 'Hi-Life', 'Ok'];

  final List modeOfPaymentListIcons = [
    'assets/images/711.png',
    'assets/images/familymart.png',
    'assets/images/hilife.png',
    'assets/images/ok.png'
  ];

  final List modeOfPaymentCodeList = ['XLN', 'K1A', 'Hi-Life', 'Ok'];

  final modeOfPaymentsMap = {
    '7-Eleven': 0,
    'Family Mart': 1,
    'Hi-Life': 3,
    'Ok': 4,
  };
}
