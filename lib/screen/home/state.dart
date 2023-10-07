import 'package:philmoney/common/routes/names.dart';

class HomeState {
  final List newRoutes = [
    AppRoutes.REMITTANCE,
    AppRoutes.NOTIFICATION,
    AppRoutes.HISTORY,
    AppRoutes.RECEIVER,
    AppRoutes.COUPON,
    AppRoutes.SETTINGS,
    AppRoutes.MANUAL,
  ];

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
}
