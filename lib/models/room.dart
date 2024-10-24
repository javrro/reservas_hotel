class Room {
  final String id;

  Room(this.id);

  Room.fromJson(Map<String, dynamic> json) : id = json['id'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}