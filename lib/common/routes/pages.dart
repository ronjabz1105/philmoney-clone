import 'package:get/get.dart';
import 'package:philmoney/common/routes/names.dart';
import 'package:philmoney/screen/auth/login/binding.dart';
import 'package:philmoney/screen/auth/login/view.dart';
import 'package:philmoney/screen/coupon/index.dart';
import 'package:philmoney/screen/history/index.dart';
import 'package:philmoney/screen/history/remittance/view.dart';
import 'package:philmoney/screen/home/index.dart';
import 'package:philmoney/screen/manual/index.dart';
import 'package:philmoney/screen/notification/index.dart';
import 'package:philmoney/screen/receiver/crud_receiver/banks.dart';
import 'package:philmoney/screen/receiver/crud_receiver/relationship_list.dart';
import 'package:philmoney/screen/receiver/crud_receiver/update_receiver.dart';
import 'package:philmoney/screen/remittance/mode_of_payment/view.dart';
import 'package:philmoney/screen/remittance/widget/newly_remittance_details.dart';
import 'package:philmoney/screen/remittance/widget/receivers_lists.dart';
import 'package:philmoney/screen/settings/index.dart';
import 'package:philmoney/screen/welcome/view.dart';
import '../../screen/receiver/index.dart';
import '../../screen/remittance/index.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(seconds: 2)),
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const WelcomeScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(seconds: 2)),
    GetPage(
      name: AppRoutes.REMITTANCE,
      page: () {
        //0- main 1- confirmation, 2- newly added remittance
        bool isConfirmation = false;
        if (Get.arguments != null) {
          isConfirmation = Get.arguments;
        }

        return RemittanceScreen(
          isConfirmation: isConfirmation,
        );
      },
      binding: RemittanceBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: AppRoutes.REMITTANCEDETAILS,
      page: () {
        // if from the remiitance screen. with newly added remittance , it should close the screen and go back to the home screen.
        bool isBack = true;
        if (Get.parameters['isBack'] != null) {
          isBack = false;
        }

        print('Arguments found ${Get.arguments}');

        var remittanceId = Get.parameters['remittanceId'];
        var receiverId = Get.parameters['receiverId'];
        return HistoryRemittanceDetails(
          remittanceId: remittanceId!,
          receiversId: receiverId!,
          isBack: isBack,
        );
      },
      // binding: HistoryBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: AppRoutes.NEWREMITTANCEDETAILS,
      page: () {
        return const NewlyRemittanceDetails();
      },

      //binding: RemittanceBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 2),
    ),
    GetPage(
      name: AppRoutes.MODEOFPAYMENT,
      page: () => const ModeOfPaymentsPage(),
      //binding: RemittanceBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.RECEIVER,
      page: () => const ReceiverScreen(),
      binding: ReceiverBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.ADDRECEIVER,
      page: () => const AddReceiver(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.UPDATERECEIVER,
      page: () => const UpdateReceiver(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.SELECTRECEIVERSLIST,
      page: () => const SelectReceiversListScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.BANKLIST,
      page: () => const BankListsScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.RELATIONSHIPLIST,
      page: () => const RelationshipListScreen(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.NOTIFICATION,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.HISTORY,
      page: () {
        var index = 1;
        if (Get.arguments != null) {
          index = Get.arguments;
        }
        print(index);
        return HistoryScreen(
          intialIndex: index,
        );
      },
      binding: HistoryBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.COUPON,
      page: () => const CouponScreen(),
      binding: CouponBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.SETTINGS,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: AppRoutes.MANUAL,
      page: () => const ManualScreen(),
      binding: ManualBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
