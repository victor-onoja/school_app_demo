import 'package:flutter/material.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            Text(
              'Get in Touch with Us',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24.0),

            // Contact Form
            _buildContactForm(context),

            const SizedBox(height: 40.0),

            // FAQ Section
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16.0),
            _buildFAQSection(),

            const SizedBox(height: 40.0),

            // Contact Information
            _buildContactInformation(context),
          ],
        ),
      ),
    );
  }

  // Contact Form
  Widget _buildContactForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Your Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Your Email',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _messageController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: 'Your Message',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Process the form submission
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message sent successfully!')),
                );
                // Clear the form
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              }
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
              child: Text('Send Message', style: TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      ),
    );
  }

  // FAQ Section
  Widget _buildFAQSection() {
    List<Map<String, String>> _faqs = [
      {
        'question': 'How can I reset my password?',
        'answer':
            'You can reset your password by clicking on "Forgot Password" on the login page.'
      },
      {
        'question': 'How do I contact the school administration?',
        'answer':
            'You can contact the school administration using the contact form on this page or by calling the phone number provided below.'
      },
      {
        'question': 'How do I access my child’s report card?',
        'answer':
            'Parents can access their child’s report card by logging into the parent portal and navigating to the "Reports" section.'
      },
      // Add more FAQs as needed
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _faqs.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(
            _faqs[index]['question']!,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_faqs[index]['answer']!),
            ),
          ],
        );
      },
    );
  }

  // Contact Information
  Widget _buildContactInformation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Contact Information',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 16.0),
        ListTile(
          leading:
              Icon(Icons.location_on, color: Theme.of(context).primaryColor),
          title: const Text('1234 School St, Education City, NG'),
        ),
        ListTile(
          leading: Icon(Icons.phone, color: Theme.of(context).primaryColor),
          title: const Text('+234 800 123 4567'),
        ),
        ListTile(
          leading: Icon(Icons.email, color: Theme.of(context).primaryColor),
          title: const Text('contact@schoolname.edu.ng'),
        ),
        ListTile(
          leading: Icon(Icons.public, color: Theme.of(context).primaryColor),
          title: const Text('www.schoolname.edu.ng'),
        ),
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.facebook, color: Theme.of(context).primaryColor),
              onPressed: () {
                // Handle Facebook link
              },
            ),
            IconButton(
              icon: Icon(Icons.link, color: Theme.of(context).primaryColor),
              onPressed: () {
                // Handle Twitter link
              },
            ),
            IconButton(
              icon: Icon(Icons.link, color: Theme.of(context).primaryColor),
              onPressed: () {
                // Handle Instagram link
              },
            ),
            // Add more social media icons as needed
          ],
        ),
      ],
    );
  }
}
