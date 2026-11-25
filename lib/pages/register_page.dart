import 'package:flutter/material.dart';
import '../services/api_exception.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();
  final _auth = AuthService();
  bool _loading = false;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _register() async {
    if (_nameC.text.trim().isEmpty ||
        _emailC.text.trim().isEmpty ||
        _passC.text.length < 8) {
      _showMessage('Lengkapi data, password minimal 8 karakter');
      return;
    }

    setState(() => _loading = true);
    try {
      await _auth.register(
        name: _nameC.text.trim(),
        email: _emailC.text.trim(),
        password: _passC.text,
      );
      if (!mounted) return;
      _showMessage('Register berhasil, silakan login');
      Navigator.pop(context); // kembali ke halaman login
    } on ApiException catch (e) {
      if (mounted) _showMessage(e.message);
    } catch (_) {
      if (mounted) _showMessage('Terjadi kesalahan tak terduga');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

 @override
Widget build(BuildContext context) {
  final theme = Theme.of(context);

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        onPressed: () => Navigator.pop(context),
      ),
    ),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Buat Akun',
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Lengkapi informasi di bawah untuk mendaftar.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 36),
              
              // Input Nama
              TextField(
                controller: _nameC,
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  prefixIcon: const Icon(Icons.badge_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: theme.colorScheme.outline.withOpacity(0.5)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Input Email
              TextField(
                controller: _emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.alternate_email_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: theme.colorScheme.outline.withOpacity(0.5)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Input Password
              TextField(
                controller: _passC,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  helperText: 'Minimal 8 karakter',
                  prefixIcon: const Icon(Icons.key_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: theme.colorScheme.outline.withOpacity(0.5)),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              
              // Tombol Register
              SizedBox(
                height: 52,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: _loading ? null : _register,
                  child: _loading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Daftar',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}