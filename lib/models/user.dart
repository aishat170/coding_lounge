class User {
  String? id;
  String name;
  String email;
  DateTime creationDate;

  User({
    this.id, 
    required this.name, 
    required this.email,
    required this.creationDate,
  });

User.fromJson(Map<String, dynamic> json) 
    : name = json["name"], 
    id = json["id"], 
    email = json["email"], 
    creationDate = json["creationDate"];

  Map<String, dynamic> toJson() => {
    "name" : name,
    "id" : id,
    "email" : email,
    "creationDate" : creationDate.toIso8601String,
  };
}


