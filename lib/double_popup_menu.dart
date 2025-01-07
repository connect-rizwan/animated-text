import 'package:flutter/material.dart';



class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  _buildChatItem(
                    'AN',
                    'Anas Nadi',
                    'Mobile App',
                    'Anas: Okay',
                    null,
                    isOnline: true,
                  ),
                  _buildChatItem(
                    '',
                    'Ali Ahmed',
                    'Need full',
                    'Rizwan Al',
                    'assets/moon.jpg',
                  ),
                  _buildChatItem(
                    'ZH',
                    'Zena Horaibi',
                    'Mobile app prototype',
                    'You: No problem at all! I look forw...',
                    null,
                    date: '10/31/24',
                  ),
                  _buildChatItem(
                    'SL',
                    'Syd L',
                    'Vue + TypeScript + Django Devel...',
                    'You: Hi there,...',
                    null,
                    date: '10/25/24',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildSearchBar()),
            _buildMenuButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey[400]),
          prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
          filled: true,
          fillColor: Colors.grey[900],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 0),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Color(0xFF2D2D2D),
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 200,
      ),
      itemBuilder: (context) => [
        _buildMenuItem('Unread', Icons.mail_outline),
        _buildMenuItem('Favorites', Icons.star_border),
        PopupMenuItem<String>(
          padding: EdgeInsets.zero,
          child: ContractsSubmenuButton(),
        ),
        _buildMenuItem('Other', Icons.chat_bubble_outline),
      ],
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(Icons.more_vert, color: Colors.grey[400]),
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(String text, IconData icon) {
    return PopupMenuItem(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(
    String initials,
    String name,
    String subtitle,
    String message,
    String? imagePath, {
    bool isOnline = false,
    String? date,
  }) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[800],
            backgroundImage: imagePath != null ? AssetImage(imagePath) : null,
            child: imagePath == null ? Text(initials) : null,
          ),
          if (isOnline)
            Positioned(
              right: 0,
              top: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey[500]),
          ),
          Text(
            message,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
      trailing: date != null
          ? Text(
              date,
              style: TextStyle(color: Colors.grey[500]),
            )
          : null,
    );
  }
}

class ContractsSubmenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.over,
      color: Color(0xFF2D2D2D),
      offset: const Offset(-0, -0),
      constraints: const BoxConstraints(
        minWidth: 200,
        maxWidth: 200,
      ),
      itemBuilder: (context) => [
        _buildContractMenuItem('All contracts', Icons.arrow_forward),
        _buildContractMenuItem('Fixed-price contracts', Icons.attach_money),
        _buildContractMenuItem('Hourly contracts', Icons.access_time),
      ],
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(Icons.description_outlined, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            const Text(
              'Contracts',
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildContractMenuItem(String text, IconData icon) {
    return PopupMenuItem(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
