class User {
  final String id;
  final String name;
  User({
    this.id = '',
    required this.name,
  });
  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      name: data['name'],
    );
  }
  Map<String, Object?> toFirebaseMap() {
    return <String, Object?>{
      'name': name,
    };
  }
}
