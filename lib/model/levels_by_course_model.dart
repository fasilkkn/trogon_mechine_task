// To parse this JSON data, do
//
//     final levelsByCourse = levelsByCourseFromJson(jsonString);

import 'dart:convert';

LevelsByCourse levelsByCourseFromJson(String str) => LevelsByCourse.fromJson(json.decode(str));

String levelsByCourseToJson(LevelsByCourse data) => json.encode(data.toJson());

class LevelsByCourse {
    int status;
    String message;
    List<Datum> data;

    LevelsByCourse({
        required this.status,
        required this.message,
        required this.data,
    });

    factory LevelsByCourse.fromJson(Map<String, dynamic> json) => LevelsByCourse(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String id;
    String title;
    String lock;
    List<Section> sections;
    String completion;

    Datum({
        required this.id,
        required this.title,
        required this.lock,
        required this.sections,
        required this.completion,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        lock: json["lock"],
        sections: List<Section>.from(json["sections"].map((x) => Section.fromJson(x))),
        completion: json["completion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "lock": lock,
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "completion": completion,
    };
}

class Section {
    String id;
    String title;
    String courseId;
    String levelId;
    String order;
    String thumbnail;
    String background;
    String icon;
    String free;
    dynamic instructorId;
    String examId;
    String examTitle;
    int isAttended;
    int isCompleted;
    int total;
    int completed;

    Section({
        required this.id,
        required this.title,
        required this.courseId,
        required this.levelId,
        required this.order,
        required this.thumbnail,
        required this.background,
        required this.icon,
        required this.free,
        required this.instructorId,
        required this.examId,
        required this.examTitle,
        required this.isAttended,
        required this.isCompleted,
        required this.total,
        required this.completed,
    });

    factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        title: json["title"],
        courseId: json["course_id"],
        levelId: json["level_id"],
        order: json["order"],
        thumbnail: json["thumbnail"],
        background: json["background"],
        icon: json["icon"],
        free: json["free"],
        instructorId: json["instructor_id"],
        examId: json["exam_id"],
        examTitle: json["exam_title"],
        isAttended: json["is_attended"],
        isCompleted: json["is_completed"],
        total: json["total"],
        completed: json["completed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "course_id": courseId,
        "level_id": levelId,
        "order": order,
        "thumbnail": thumbnail,
        "background": background,
        "icon": icon,
        "free": free,
        "instructor_id": instructorId,
        "exam_id": examId,
        "exam_title": examTitle,
        "is_attended": isAttended,
        "is_completed": isCompleted,
        "total": total,
        "completed": completed,
    };
}
