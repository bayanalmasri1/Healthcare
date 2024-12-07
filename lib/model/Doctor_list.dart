class Doctor {
  final String id; // ID الخاص بالمستند
  final String name;
  final String specialty;
  final String imageUrl;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
  });

  // تحويل البيانات من Firestore إلى كائن Doctor
  factory Doctor.fromFirestore(String id, Map<String, dynamic> data) {
    return Doctor(
      id: id,
      name: data['doctorName'] ?? 'No Name',
      specialty: data['specialty'] ?? 'No Specialty',
      imageUrl: data['imageUrl'] ?? 'https://via.placeholder.com/150', // صورة افتراضية
    );
  }
}
