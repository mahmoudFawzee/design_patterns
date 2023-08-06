class User {
  final String name;
  final String imageUrl;
  final String? bio;
  final String? phoneNumber;
  final String? email;
  const User({
    required this.name,
    required this.bio,
    required this.imageUrl,
    required this.phoneNumber,
    required this.email,
  });
  @override
  String toString() {
    return 'name : $name \n imageUrl : $imageUrl \n bio : $bio \n phoneNumber : $phoneNumber \n email : $email \n';
  }
}
