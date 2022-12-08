// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

List<TodoModel> todoModelFromJson(String str) => List<TodoModel>.from(json.decode(str).map((x) => TodoModel.fromJson(x)));

String todoModelToJson(List<TodoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoModel {
    TodoModel({
        this.title,
        this.description,
        this.category,
        this.timestamp,
        this.priority,
        this.userId,
        this.isCompleted,
        this.id,
    });

    String? title;
    String? description;
    String? category;
    dynamic timestamp;
    dynamic priority;
    String? userId;
    dynamic isCompleted;
    String? id;

    factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        title: json["title"],
        description: json["description"],
        category: json["category"],
        timestamp: json["timestamp"],
        priority: json["priority"],
        userId: json["user_id"],
        isCompleted: json["isCompleted"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "category": category,
        "timestamp": timestamp,
        "priority": priority,
        "user_id": userId,
        "isCompleted": isCompleted,
        "id": id,
    };
}
