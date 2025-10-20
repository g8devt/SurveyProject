import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rxdart/rxdart.dart';
import 'package:survey_project/bloc/post_bloc/post_bloc.dart';
import 'package:survey_project/utilities/colors.dart';
import 'package:survey_project/views/splash/splash_screen_view.dart';
import 'package:survey_project/views/widgets/loading_widget.dart';

import 'bloc/common/_common.dart';
import 'bloc/common/common_cubit.dart';

import 'bloc/login_bloc/login_bloc.dart';
import 'data/model/push_notification.dart';
import 'utilities/_utils.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
final BehaviorSubject<PushNotification> didReceiveLocalNotificationSubject = BehaviorSubject<PushNotification>();
final BehaviorSubject<String> selectNotificationSubject = BehaviorSubject<String>();
NotificationAppLaunchDetails? notificationAppLaunchDetails;

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  printDebug('Handling a background message: ${message.messageId}');
  // final String notificationMessage = message.notification?.body ?? '';
  // await saveMessageToDatabase(notificationMessage);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await _initFirebaseMessaging(); // <--- add this line here

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // notificationAppLaunchDetails = await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // NotificationSettings settings = await messaging.requestPermission();
  //
  // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  //   printDebug('User granted permission');
  // } else {
  //   printDebug('User declined or has not accepted permission');
  // }

  runApp(
    const OverlaySupport.global(
      child: MyApp(),
    ),
  );
}

Future<void> _initFirebaseMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // Request permission first
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  printDebug('User granted permission: ${settings.authorizationStatus}');

  // iOS-specific: wait for APNs token to be set
  if (Platform.isIOS) {
    String? apnsToken = await messaging.getAPNSToken();
    if (apnsToken == null) {
      printDebug('Waiting for APNs token...');
      return; // Skip getting FCM token until APNs is set
    }
  }


  // Now it's safe to call getToken
  String? token = await messaging.getToken();
  printDebug('FCM Token: $token');

  // Token refresh listener
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
    printDebug('Refreshed FCM Token: $newToken');
  });

  // Foreground message listener
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    printDebug('Foreground message received: ${message.notification?.title}');
  });
}

/// ----------------------------------------------------------------------------
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<LoadingCubit>(create: (_) => LoadingCubit()),
            BlocProvider<NavDrawerCubit>(create: (_) => NavDrawerCubit()),
            BlocProvider<LoginRememberMeCubit>(create: (_) => LoginRememberMeCubit()),
            BlocProvider<UserProfileIDCubit>(create: (_) => UserProfileIDCubit()),
            BlocProvider<RegionListCubit>(create: (_) => RegionListCubit()),
            BlocProvider<ProvinceListCubit>(create: (_) => ProvinceListCubit()),
            BlocProvider<CityListCubit>(create: (_) => CityListCubit()),
            BlocProvider<BarangayListCubit>(create: (_) => BarangayListCubit()),
            BlocProvider<LoadVerifCubit>(create: (_) => LoadVerifCubit()),
            BlocProvider<UserProfileMobileNumberCubit>(create: (_) => UserProfileMobileNumberCubit()),
            BlocProvider<LoginBloc>(create: (_) => LoginBloc()),
            BlocProvider<PostBloc>(create: (_) => PostBloc()),
          ],
          child: MaterialApp(
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: Stack(
                children: [
                  child!,
                  const LoadingWidget(),
                ],
              ),
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
            title: 'Survey',
            theme: ThemeData(
              radioTheme: RadioThemeData(
                fillColor: WidgetStateProperty.all(primaryColor), // circle color
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashScreenView(),
          ),
        );
      },
    );
  }
}

