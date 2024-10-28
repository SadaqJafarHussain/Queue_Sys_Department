class AdminModel{
  final String token;
  final String name;
  final int userId;
  final String email;
  final String firmName;
  final String phoneNumber;
  final String role;

  AdminModel({
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.userId,
    required this.role,
    required this.firmName,
    required this.token,
});

  factory AdminModel.fromJson(Map<String,dynamic> data,String tok_en)=>AdminModel(
      email: data["email"],
      phoneNumber: data["phone"],
      name: data["employe_name"],
      userId: data["userId"],
      role: data["role"],
      firmName: data["firm_name"],
      token: tok_en);

}