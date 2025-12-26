import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'messages_list_screen.dart';

class ConversationInboxScreen extends StatelessWidget {
  const ConversationInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final conversationTitle = ModalRoute.of(context)?.settings.arguments as String? ?? 'Event 123';
    
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const MessagesListScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            }
          },
        ),
        title: Text(conversationTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildMessage(
                    sender: 'Admin',
                    message: 'Event 123 has been created',
                    isAdmin: true,
                  ),
                  const SizedBox(height: 16),
                  _buildMessage(
                    sender: 'Client',
                    message: 'i am avaiable for event',
                    isAdmin: false,
                  ),
                  const SizedBox(height: 16),
                  _buildMessage(
                    sender: 'Admin',
                    message: 'Event 123 has been created',
                    isAdmin: true,
                  ),
                  const SizedBox(height: 16),
                  _buildMessage(
                    sender: 'Client',
                    message: 'i am avaiable for event',
                    isAdmin: false,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.darkCardBackground,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.darkBackground,
                    child: Icon(
                      Icons.person,
                      color: AppColors.textWhite,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.darkBackground,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: 'Write a Message',
                          hintStyle: TextStyle(color: AppColors.textLightGray),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: AppColors.textWhite),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    icon: const Icon(
                      Icons.image,
                      color: AppColors.textWhite,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage({
    required String sender,
    required String message,
    required bool isAdmin,
  }) {
    return Row(
      mainAxisAlignment: isAdmin ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isAdmin) ...[
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.darkCardBackground,
            child: Icon(
              Icons.person,
              color: AppColors.textWhite,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: isAdmin ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Text(
                sender,
                style: const TextStyle(
                  color: AppColors.textLightGray,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.darkCardBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (!isAdmin) ...[
          const SizedBox(width: 12),
          const CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.darkCardBackground,
            child: Icon(
              Icons.person,
              color: AppColors.textWhite,
              size: 24,
            ),
          ),
        ],
      ],
    );
  }
}

