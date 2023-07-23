import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppNotification {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    var androidInitializationSettings =
        const AndroidInitializationSettings("flutter_logo");

    var iosInitializationSettings = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {

            });
  }

  Future showNotification({int id = 0, String?title, String? body, String? payload}) async {
    return _notificationsPlugin.show(id, title, body, notificationDetails());
  }

  notificationDetails(){
return const NotificationDetails(
  android: AndroidNotificationDetails("channelId", "channelName",importance: Importance.max),
  iOS: DarwinNotificationDetails()

);
  }
}
