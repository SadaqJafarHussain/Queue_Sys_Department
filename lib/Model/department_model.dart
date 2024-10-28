class DepartmentModel {
  final String departmentName;
  final int departmentId;
  final int firmId;
  final String email;
  final String employeeName;
  final String phoneNumber;
  final String role;
  final String imageUrl;

  DepartmentModel({
    required this.email,
    required this.phoneNumber,
    required this.departmentName,
    required this.departmentId,
    required this.role,
    required this.employeeName,
    required this.firmId,
    required this.imageUrl
    });

  factory DepartmentModel.fromJson(Map<String,dynamic> data)=>DepartmentModel(
      email: data["email"],
      firmId: data["firm_id"],
      phoneNumber: data["phone"],
      departmentName: data["depart_name"],
      departmentId: data["department_id"],
      role: data["role"],
      imageUrl: data['image'],
      employeeName: data['employe_name']
  );

}