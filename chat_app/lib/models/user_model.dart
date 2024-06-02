class UserModel {
  String name;
  String lastSeen;
  String image;
  String uid;
  bool isOnline;
  UserModel({
    required this.name,
    required this.lastSeen,
    required this.image,
    required this.uid,
    required this.isOnline,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      lastSeen: json['lastSeen'],
      image: json['image'],
      uid: json['uid'],
      isOnline: json['isOnline'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastSeen': lastSeen,
      'image': image,
      'uid': uid,
      'isOnline': isOnline,
    };
  } 
}
