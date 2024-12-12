import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';


class PartnersScreen extends StatefulWidget {
  const PartnersScreen({super.key});

  @override
  _PartnersScreenState createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  List<Map<String, String>> partners = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPartners();
  }

  Future<void> fetchPartners() async {
    // Simulate a delay to fetch data from a database
    await Future.delayed(const Duration(seconds: 2)); // Simulated network delay
    setState(() {
      partners = [
        {
          'name': 'ABC Health Insurance',
          'description':
              'A trusted provider of comprehensive health insurance plans.',
          'logoUrl': 'https://example.com/logo1.png',
        },
        {
          'name': 'Healthy Life Insurance',
          'description':
              'Specializing in family protection and wellness plans.',
          'logoUrl': 'https://example.com/logo2.png',
        },
        {
          'name': 'SecureWell Insurance',
          'description': 'Known for reliable senior citizen health coverage.',
          'logoUrl': 'https://example.com/logo3.png',
        },
        {
          'name': 'HealthPlus',
          'description':
              'Affordable health plans with a wide range of coverage options.',
          'logoUrl': 'https://example.com/logo4.png',
        },
      ];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Our Partners'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: partners.length,
                itemBuilder: (context, index) {
                  final partner = partners[index];
                  return PartnerCard(
                    name: partner['name']!,
                    description: partner['description']!,
                    logoUrl: partner['logoUrl']!,
                  );
                },
              ),
            ),
    );
  }
}

class PartnerCard extends StatelessWidget {
  final String name;
  final String description;
  final String logoUrl;

  const PartnerCard({
    super.key,
    required this.name,
    required this.description,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Larger logo container with `BoxFit.contain`
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey[300],
              image: DecorationImage(
                image: NetworkImage(logoUrl),
                fit: BoxFit
                    .contain, // Ensure the image fits within the container
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
