import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  late Future<UserModel> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = _auth.getUser();
  }

  Future<void> _logout() async {
    await _auth.logout();
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Keluar',
          ),
        ],
      ),
      body: FutureBuilder<UserModel>(
        future: _futureUser,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(snap.error.toString(), textAlign: TextAlign.center),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: _logout,
                      child: const Text('Kembali ke Login'),
                    ),
                  ],
                ),
              ),
            );
          }

          final user = snap.data!;
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Info Akun User
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: theme.colorScheme.outline.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, ${user.name}',
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Pilih Halaman Tujuan',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Daftar Pilihan Menu
              _menuTile(context, Icons.date_range_rounded, 'Form Date Picker', '/form-page'),
              _menuTile(context, Icons.photo_camera_rounded, 'Instagram UI', '/instagram'),
              _menuTile(context, Icons.view_column_rounded, 'Column Widget', '/column-widget'),
              _menuTile(context, Icons.splitscreen_rounded, 'Row Column Widget', '/row-column-widget'),
              _menuTile(context, Icons.view_week_outlined, 'Row Widget', '/row-widget'),
              _menuTile(context, Icons.description_rounded, 'Form', '/form'),
              _menuTile(context, Icons.input_rounded, 'Form Input dan Output', '/input-page'),
              _menuTile(context, Icons.school_rounded, 'Form Ekstrakurikuler', '/form-eskul-page'),
              _menuTile(context, Icons.point_of_sale_rounded, 'Tugas Kasir', '/index-page'),
              _menuTile(context, Icons.cloud_download_rounded, 'Fetch API', '/fetch-api-page'),
              _menuTile(context, Icons.cloud_upload_rounded, 'Post API', '/post-api-page'),
              _menuTile(context, Icons.comment_rounded, 'Comment API', '/comment-api-page'),
              _menuTile(context, Icons.format_list_bulleted_sharp, 'Article API & CRUD', '/article-page'),
            ],
          );
        },
      ),
    );
  }

  Widget _menuTile(BuildContext context, IconData icon, String title, String route) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon, size: 20),
        label: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
      ),
    );
  }
}