import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ShiftRequestScreen extends StatefulWidget {
  const ShiftRequestScreen({super.key});

  @override
  State<ShiftRequestScreen> createState() => _ShiftRequestScreenState();
}

class _ShiftRequestScreenState extends State<ShiftRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventLocationController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _eventTime;
  final TextEditingController _eventDurationController = TextEditingController();
  final TextEditingController _eventTypeController = TextEditingController();
  final TextEditingController _requiredMedicsController = TextEditingController();
  String? _certificationLevel;
  final TextEditingController _payRateController = TextEditingController();
  String? _eligibleMedicGroups;

  @override
  void dispose() {
    _eventNameController.dispose();
    _eventLocationController.dispose();
    _eventDurationController.dispose();
    _eventTypeController.dispose();
    _requiredMedicsController.dispose();
    _payRateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('New Request'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField('Event Name', _eventNameController),
                const SizedBox(height: 20),
                _buildTextField('Event Location', _eventLocationController),
                const SizedBox(height: 20),
                _buildDateField('Event Date', _selectedDate, () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child!,
                      );
                    },
                  );
                  if (date != null) {
                    setState(() {
                      _selectedDate = date;
                    });
                  }
                }),
                const SizedBox(height: 20),
                _buildTimeField('Event Time', _eventTime, () async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child!,
                      );
                    },
                  );
                  if (time != null) {
                    setState(() {
                      _eventTime = time;
                    });
                  }
                }),
                const SizedBox(height: 20),
                _buildTextField('Event Duration', _eventDurationController),
                const SizedBox(height: 20),
                _buildTextField('Event Type', _eventTypeController),
                const SizedBox(height: 20),
                _buildTextField('Required Medics', _requiredMedicsController, isNumber: true),
                const SizedBox(height: 20),
                _buildDropdownField('Certification Level', _certificationLevel, ['Basic', 'Advanced', 'Paramedic'], (value) {
                  setState(() {
                    _certificationLevel = value;
                  });
                }),
                const SizedBox(height: 20),
                _buildTextField('Pay Rate', _payRateController, isNumber: true),
                const SizedBox(height: 20),
                _buildDropdownField('Eligible Medic Groups', _eligibleMedicGroups, ['Group A', 'Group B', 'Group C', 'All Groups'], (value) {
                  setState(() {
                    _eligibleMedicGroups = value;
                  });
                }),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkCardBackground,
                          foregroundColor: AppColors.textWhite,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Request published successfully!'),
                                backgroundColor: AppColors.accentGreen,
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryRed,
                          foregroundColor: AppColors.textWhite,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Publish'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isNumber = false}) {
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
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            hintStyle: const TextStyle(color: AppColors.textLightGray),
          ),
          style: const TextStyle(color: AppColors.textWhite),
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildDateField(String label, DateTime? date, VoidCallback onTap) {
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
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.darkCardBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date != null
                      ? '${date.month}/${date.day}/${date.year}'
                      : 'Select Event Date',
                  style: TextStyle(
                    color: date != null ? AppColors.textWhite : AppColors.textLightGray,
                    fontSize: 16,
                  ),
                ),
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.textWhite,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField(String label, TimeOfDay? time, VoidCallback onTap) {
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
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: AppColors.darkCardBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time != null
                      ? '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}'
                      : 'Select Event Time',
                  style: TextStyle(
                    color: time != null ? AppColors.textWhite : AppColors.textLightGray,
                    fontSize: 16,
                  ),
                ),
                const Icon(
                  Icons.access_time,
                  color: AppColors.textWhite,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String? value, List<String> items, Function(String?) onChanged) {
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
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.darkCardBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: Container(),
            dropdownColor: AppColors.darkCardBackground,
            style: TextStyle(
              color: value != null ? AppColors.textWhite : AppColors.textLightGray,
            ),
            hint: Text(
              'Select $label',
              style: const TextStyle(color: AppColors.textLightGray),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}

