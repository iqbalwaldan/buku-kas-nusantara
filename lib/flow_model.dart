class FlowModel {
  int id, id_user, total;
  String type, date, description, createdAt, updatedAt;

  FlowModel(
      {this.id,
      this.id_user,
      this.type,
      this.date,
      this.total,
      this.description,
      this.createdAt,
      this.updatedAt});
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_user': id_user,
      'type': type,
      'date': date,
      'total': total,
      'description': description,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
  factory FlowModel.fromJson(Map<String, dynamic> json) {
    return FlowModel(
        id: json["id"],
        id_user: json["id_user"],
        type: json["type"],
        date: json["date"],
        total: json["total"],
        description: json["description"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"]);
  }
}
