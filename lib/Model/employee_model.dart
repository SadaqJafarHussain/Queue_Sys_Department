class EmployeeModel {
  final String counterName;
  final int employeeID;
  final String email;
  final String employeeName;
  final String phoneNumber;
  final String imageUrl;

  EmployeeModel({
    required this.email,
    required this.phoneNumber,
    required this.counterName,
    required this.employeeName,
    required this.employeeID,
    required this.imageUrl
    });

  factory EmployeeModel.fromJson(Map<String,dynamic> data)=>EmployeeModel(
      email: data["email"],
      employeeID: data["employee_id"],
      phoneNumber: data["phone"],
      counterName: data["counter_name"],
      imageUrl: data['image']??"no",
      employeeName: data['employe_name']
  );

}