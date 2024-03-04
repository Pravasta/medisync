import 'package:medisync/common/constant/url_asset.dart';

class DummyData {
  static const List<String> doctorSpecialists = [
    'Cardiologist',
    'Dermatologist',
    'Gastroenterologist',
    'Neurologist',
    'Orthopedic Surgeon',
    'Pediatrician',
    'Psychiatrist',
    'Ophthalmologist',
    'ENT Specialist',
    'Urologist',
  ];

  static List<Map<String, dynamic>> doctorData = [
    {
      'photo_url': UrlAsset.doctor1,
      'doctor_name': 'Dr. John Doe',
      'specialization': 'Cardiologist',
      'address': '123 Main Street, Cityville',
      'location_in_km': 5.2,
      'patient_count': 150,
      'next_schedule': '2024-02-15 10:00 AM',
      'consultation_fee': 200.0,
      'rating': 80, // 4.8 * 10 = 80%
      'review_count': 30,
    },
    {
      'photo_url': UrlAsset.doctor2,
      'doctor_name': 'Dr. Jane Smith',
      'specialization': 'Dermatologist',
      'address': '456 Oak Avenue, Townsville',
      'location_in_km': 8.5,
      'patient_count': 120,
      'next_schedule': '2024-02-16 02:30 PM',
      'consultation_fee': 150.0,
      'rating': 75, // 4.5 * 10 = 75%
      'review_count': 25,
    },
    {
      'photo_url': UrlAsset.doctor3,
      'doctor_name': 'Dr. Michael Johnson',
      'specialization': 'Gastroenterologist',
      'address': '789 Pine Lane, Villagetown',
      'location_in_km': 3.8,
      'patient_count': 200,
      'next_schedule': '2024-02-17 11:15 AM',
      'consultation_fee': 250.0,
      'rating': 90, // 4.9 * 10 = 90%
      'review_count': 40,
    },
    {
      'photo_url': UrlAsset.doctor4,
      'doctor_name': 'Dr. Sarah White',
      'specialization': 'Neurologist',
      'address': '101 Elm Street, Hamlet City',
      'location_in_km': 12.0,
      'patient_count': 180,
      'next_schedule': '2024-02-18 09:45 AM',
      'consultation_fee': 180.0,
      'rating': 70, // 4.7 * 10 = 70%
      'review_count': 35,
    },
    {
      'photo_url': UrlAsset.doctor5,
      'doctor_name': 'Dr. Robert Brown',
      'specialization': 'Orthopedic Surgeon',
      'address': '222 Cedar Road, Suburbia',
      'location_in_km': 6.7,
      'patient_count': 160,
      'next_schedule': '2024-02-19 03:00 PM',
      'consultation_fee': 220.0,
      'rating': 60, // 4.6 * 10 = 60%
      'review_count': 28,
    },
  ];
}
