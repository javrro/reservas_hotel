class Booking {
  final String id;

  Booking(this.id);

  Booking.fromJson(Map<String, dynamic> json) : id = json['id'];

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}