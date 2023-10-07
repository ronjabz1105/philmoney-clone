class RemittanceState {
  final List iconPaths = [
    'assets/icons/remit.png',
    'assets/icons/notification.png',
    'assets/icons/history.png',
    'assets/icons/receiver.png',
    'assets/icons/coupon.png',
    'assets/icons/setting.png',
    'assets/icons/manual.png',
  ];

  final List iconTitle = [
    'Remittance',
    'Notification',
    'History',
    'Receiver',
    'Coupon',
    'Settings',
    'Manual'
  ];

  Map<String, String> txtType = {
    '1': "Bank to Bank",
    '2': "Pick Up",
    '3': "Door to Door",
  };
}
