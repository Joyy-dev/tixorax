import 'package:flutter/material.dart';
import 'package:tixora/widget/cover_post.dart';
import 'package:tixora/widget/header.dart';
import 'package:tixora/widget/input_label.dart';
import 'package:tixora/widget/map_placeholder.dart';
import 'package:tixora/widget/pro_tip.dart';
import 'package:tixora/widget/progress_bar.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white54),
          onPressed: () {},
        ),
        title: const Center(
          child: Text('Pulse'),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFFFCCAA),
              child: Icon(Icons.person, color: Colors.black54, size: 20),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              ProgressBar(),
              const SizedBox(height: 32),
              Header(),
              const SizedBox(height: 32),
              CoverPost(),
              const SizedBox(height: 24),
              ProTip(),
              const SizedBox(height: 32),
              InputLabel('EVENT TITLE'),
              _buildTextField('e.g. Midnight Cyberpunk Rave 2024'),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel('CATEGORY'),
                        _buildTextField(
                          'Music & Concert',
                          suffixIcon: Icons.keyboard_arrow_down,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel('STARTING PRICE'),
                        _buildTextField(
                          '0.00',
                          prefixText: '\$  ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel('DATE'),
                        _buildTextField(
                          'mm/dd/yyyy',
                          suffixIcon: Icons.calendar_today_outlined,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel('DOORS OPEN'),
                        _buildTextField(
                          '--:-- --',
                          suffixIcon: Icons.access_time,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              InputLabel('LOCATION / VENUE'),
              _buildTextField(
                'Search for a venue or address...',
                prefixIcon: Icons.location_on_outlined,
              ),
              const SizedBox(height: 8),
              MapPlaceholder(),
              const SizedBox(height: 24),
              InputLabel('ABOUT THE EVENT'),
              _buildTextField(
                'Tell the world what makes this special...',
                maxLines: 4,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint, {
    int maxLines = 1,
    IconData? suffixIcon,
    IconData? prefixIcon,
    String? prefixText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1436),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        maxLines: maxLines,
        style: const TextStyle(color: Colors.white, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
          prefixText: prefixText,
          prefixStyle: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: const Color(0xFFAFA2FF), size: 20)
              : null,
          suffixIcon: suffixIcon != null
              ? Icon(suffixIcon, color: Colors.white38, size: 20)
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: maxLines > 1 ? 16 : 14,
          ),
        ),
      ),
    );
  }
}
