class ContactModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String webSite;
  final String address;
  final bool isFavorite;

  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.webSite,
    required this.id,
    this.isFavorite = false,
  });
}
