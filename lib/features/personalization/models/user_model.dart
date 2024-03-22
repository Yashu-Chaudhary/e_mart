// Model class erepresenting user data.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/utils/formatters/formatter.dart';

class UserModel {
  // kep thse values final which you do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  // Constructor for UserModel.
  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.profilePicture,
    required this.username,
  });
  // Helper function to get the full name
  String get fullName => '$firstName $lastName';

  // Helper function to format phone number.
  String get formattedPhoneNo => PFormatter.formatPhoneNumber(phoneNumber);

  // Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Static function to generate a username from the full name.
  static String genrateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
      id: '',
      email: '',
      firstName: '',
      lastName: '',
      phoneNumber: '',
      profilePicture: '',
      username: '');

  // Convert model to JSON structure for starting data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  //  factor method to create a UserMoel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          email: data['Email'] ?? "",
          firstName: data['FirstName'] ?? "",
          lastName: data['LastName'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '',
          username: data['UserName'] ?? '');
    }
    throw Exception("Document data is null");
  }
}
