class NoteModel {
  String title;
  String description;

  NoteModel({
    required this.title,
    this.description = "",
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        title: json['title'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };
}
