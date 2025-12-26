import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AdminInviteScreen extends StatefulWidget {
  const AdminInviteScreen({super.key});

  @override
  State<AdminInviteScreen> createState() => _AdminInviteScreenState();
}

class _AdminInviteScreenState extends State<AdminInviteScreen> {
  String _selectedRole = 'Medic';
  bool _sendViaText = false;
  bool _showSuccessMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person_add),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Invite New User'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account Details',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField('First Name', 'Enter First Name'),
                const SizedBox(height: 20),
                _buildTextField('Last Name', 'Enter Last Name'),
                const SizedBox(height: 20),
                _buildTextField('Email Address', 'Enter Email Address'),
                const SizedBox(height: 20),
                _buildTextField('Cell Phone', '(555) 555-555', isPhone: true),
                const SizedBox(height: 20),
                _buildTextField('City', 'Enter City'),
                const SizedBox(height: 20),
                _buildTextField('Job title', 'Enter job Title'),
                const SizedBox(height: 30),
                const Text(
                  'Uer Role',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildRoleButton('Medic', _selectedRole == 'Medic'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildRoleButton('Admin', _selectedRole == 'Admin'),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Training Status',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    color: AppColors.darkCardBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Status',
                        style: TextStyle(
                          color: AppColors.textWhite,
                          fontSize: 16,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textWhite,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Also send Invite Via Text Message',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 16,
                      ),
                    ),
                    Switch(
                      value: _sendViaText,
                      onChanged: (value) {
                        setState(() {
                          _sendViaText = value;
                        });
                      },
                      activeThumbColor: AppColors.primaryRed,
                    ),
                  ],
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          if (_showSuccessMessage)
            Positioned(
              bottom: 100,
              left: 24,
              right: 24,
              child: _buildSuccessMessage(),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.darkBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showSuccessMessage = true;
                    });
                    Future.delayed(const Duration(seconds: 3), () {
                      if (mounted) {
                        setState(() {
                          _showSuccessMessage = false;
                        });
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    foregroundColor: AppColors.textWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Next'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPhone = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textWhite,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textLightGray),
          ),
          style: const TextStyle(color: AppColors.textWhite),
          keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
        ),
      ],
    );
  }

  Widget _buildRoleButton(String role, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = role;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryRed : AppColors.darkCardBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            role,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textWhite,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: AppColors.successGreen,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: AppColors.textWhite,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Invite sent successfully to jane doe',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black, size: 20),
            onPressed: () {
              setState(() {
                _showSuccessMessage = false;
              });
            },
          ),
        ],
      ),
    );
  }
}

