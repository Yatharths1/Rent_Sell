class User{
  String? email_uid;
  String? phone_uid;
  final String fName;
  final String lName;
  final String phoneNo;
  final String email;
  final String password;

  User({
    // this.id,
    required this.fName,
    required this.lName,
    required this.phoneNo,
    required this.email,
    required this.password,
  });

  toJson(){
    return{
      "First Name":fName,
      "Last Name" :lName,
      "phoneNo" :phoneNo,
      "email" :email,
      "Password" :password,
      "email_uid":email_uid,
      "phone_uid":phone_uid,
    };
  }
}