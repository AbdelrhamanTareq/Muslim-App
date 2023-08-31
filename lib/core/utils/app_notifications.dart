import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AppNotification {
  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    _configureLocalTimeZone();
    var androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

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
            (NotificationResponse notificationResponse) async {});
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return _notificationsPlugin.show(id, title, body, notificationDetails());
  }

  /// Set right date and time for notifications
  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    // print(now);
    // print(scheduleDate);
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  Future showScheduleNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
    required int hour,
    required int minutes,
    bool playSound = true,
  }) async {
    // final now = DateTime.now();

    return await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      _convertTime(hour, minutes),
      playSound ? notificationDetails() : notificationDetailsWithoutSound(),
      // androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  cancelAll() async => await _notificationsPlugin.cancelAll();
  cancel(id) async => await _notificationsPlugin.cancel(id);

  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          "Muslim123",
          "Muslim",
          channelDescription: "Muslim app notifications",
          icon: "@mipmap/ic_launcher",
          importance: Importance.max,
          playSound: true,
          sound: RawResourceAndroidNotificationSound("azan"),
          enableLights: true,
        ),
        iOS: DarwinNotificationDetails());
  }

  notificationDetailsWithoutSound() {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
          "Muslim1234",
          "Muslim12",
          channelDescription: "Muslim app notifications12",
          icon: "@mipmap/ic_launcher",
          importance: Importance.max,
          enableLights: true,
        ),
        iOS: DarwinNotificationDetails());
  }
}
