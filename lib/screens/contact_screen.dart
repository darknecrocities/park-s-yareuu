import 'package:flutter/material.dart';
import '../widgets/customize_appbar.dart';
import 'confirm_screen.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _guestsController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  String? _tablePreference;
  bool _sendCopy = false;

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateController.text =
        "${picked.month}/${picked.day}/${picked.year}";
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate() && _tablePreference != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            date: _dateController.text,   // pass selected date
            time: _timeController.text,   // pass selected time
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizeAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // ✅ form validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Contact the Restaurant",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please fill in your details below to request a reservation.",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),

              // First & Last Name
              Row(
                children: [
                  Expanded(
                    child: _buildTextField("First Name", _firstNameController),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildTextField("Last Name", _lastNameController),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildTextField("Email Address", _emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 14),

              _buildTextField("Phone Number", _phoneController,
                  keyboardType: TextInputType.phone),
              const SizedBox(height: 14),

              // Date & Time
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectDate,
                      child: AbsorbPointer(
                        child: _buildTextField(
                          "Date (MM/DD/YYYY)",
                          _dateController,
                          icon: Icons.calendar_today,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: _selectTime,
                      child: AbsorbPointer(
                        child: _buildTextField(
                          "Time",
                          _timeController,
                          icon: Icons.access_time,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              _buildTextField("Number of Guests", _guestsController,
                  keyboardType: TextInputType.number),
              const SizedBox(height: 14),

              // Dropdown for Table Preference
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  value: _tablePreference,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: "Table Preference",
                    labelStyle: TextStyle(fontSize: 14),
                  ),
                  items: const [
                    DropdownMenuItem(value: "Indoor", child: Text("Indoor")),
                    DropdownMenuItem(value: "Outdoor", child: Text("Outdoor")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _tablePreference = value;
                    });
                  },
                  validator: (value) =>
                  value == null ? "Please select a preference" : null,
                ),
              ),
              const SizedBox(height: 14),

              _buildTextField("Additional Details (optional)", _detailsController,
                  maxLines: 1),
              const SizedBox(height: 10),

              // Checkbox
              Row(
                children: [
                  Checkbox(
                    value: _sendCopy,
                    onChanged: (val) {
                      setState(() => _sendCopy = val ?? false);
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "Send a copy of my reservation via Email",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Submit Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 16),
                    elevation: 5,
                    shadowColor: Colors.black45,
                  ),
                  onPressed: _handleSubmit,
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable textfield with validation
  static Widget _buildTextField(
      String label,
      TextEditingController controller, {
        IconData? icon,
        int maxLines = 1,
        TextInputType? keyboardType,
      }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: (value) =>
      (value == null || value.isEmpty) ? "Required" : null,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon:
        icon != null ? Icon(icon, size: 18, color: Colors.black54) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
    );
  }
}
