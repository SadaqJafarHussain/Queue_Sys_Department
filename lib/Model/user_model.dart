class UserModel {
  final String token;
  final String name;
  final String email;
  final String departmentName;
  final String phoneNumber;
  final int departmentID;
  final String role;

  UserModel({
    required this.email,
    required this.phoneNumber,
    required this.name,
    required this.departmentID,
    required this.role,
    required this.departmentName,
    required this.token,
  });

  // Updated fromJson to accept token separately
  factory UserModel.fromJson(Map<String, dynamic> data, {required String token}) {
    return UserModel(
      email: data["email"] ?? "",  // default to empty string if null
      phoneNumber: data["phone"] ?? "",
      name: data["employe_name"] ?? "",
      role: data["role"] ?? "",
      departmentName: data["depart_name"] ?? "",
      token: token,
      departmentID: data["depart_id"] ?? 0,  // default to 0 if null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "phone": phoneNumber,
      "employe_name": name,
      "role": role,
      "depart_name": departmentName,
      "token": token,
      "depart_id": departmentID,
    };
  }

  UserModel copyWith({
    String? token,
    String? name,
    String? email,
    String? departmentName,
    String? phoneNumber,
    int? departmentID,
    String? role,
  }) {
    return UserModel(
      token: token ?? this.token,
      name: name ?? this.name,
      email: email ?? this.email,
      departmentName: departmentName ?? this.departmentName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      departmentID: departmentID ?? this.departmentID,
      role: role ?? this.role,
    );
  }
}
