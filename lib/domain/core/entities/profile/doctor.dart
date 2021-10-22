import 'package:domain_objects/value_objects.dart';

class Doctor {
  Doctor({
    required this.firstName,
    required this.lastName,
  });

  final Name firstName;
  final Name lastName;
}
