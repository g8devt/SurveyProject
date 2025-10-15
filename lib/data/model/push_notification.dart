
class PushNotification {
  int? id;
  String? title;
  String? body;
  String? action;
  bool? isRead;

  PushNotification({
    this.id,
    this.title,
    this.body,
    this.action,
    this.isRead,
  });


  @override
  String toString() {
    return 'PushNotification{id: $id, title: $title, body: $body, action: $action, isRead: $isRead}';
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': body,
      // 'action': action,
    };
  }

  factory PushNotification.fromJson(Map<String, dynamic> json) {
    return PushNotification(
      title: json['title'],
      body: json['content'],
      // action: json['action'],
    );
  }
}