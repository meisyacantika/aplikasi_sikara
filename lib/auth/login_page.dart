import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const Color forest = Color(0xFF1A3A13);
  static const Color primary = Color(0xFF274D16);
  static const Color light = Color(0xFFEAF3E7);
  static const Color accent = Color(0xFF3E7B24);
  static const Color soft = Color(0xFFF4F9F2);
  static const Color pageBackground = Color(0xFFF8FAF7);

  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _identifierController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    // TODO: Hubungkan ke AuthService/API.
    // Role Admin atau User sebaiknya ditentukan dari data akun di backend,
    // bukan dipilih atau dipercaya dari aplikasi.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Form login valid. Hubungkan proses autentikasi untuk masuk.',
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackground,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.zero,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      _buildHeader(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 22, 24, 12),
                          child: _buildLoginForm(),
                        ),
                      ),
                      _buildFooter(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 8),
      child: Column(
        children: [
          SizedBox(
            width: 144,
            height: 80,
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuB_Q-Xe6o7S-uN1xj3hE6xLJk73ZpE6e0Lvgbg-XtQ7exOMP-fEI3jrDNXXI1O2e-7ZyIvMUt91KeLhJjl8Cow9t9EsCpspClTW_Z0hCLu_ZzIM7dE3jPKQiUrYu0gvm3bxjkVUYMeqFGTPYbU38pzy2Ej0tWNLaZjvicXacKEUcF4pNZq6MMzsD2_zeEaT8bvJ0z7-9y8jb_XswD9YWoBfDQTb90ActioKrk0COSGLVUCQCmh2IFGxQ2Q_pwRqpxMuCA',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.eco_rounded,
                color: primary,
                size: 65,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Selamat Datang di SIKARA',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: forest,
              fontSize: 24,
              height: 1.2,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            'Kelola limbah upakara dengan lebih mudah bersama desa dan mitra.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF4A5568),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFieldLabel('Email atau Nomor HP'),
          const SizedBox(height: 7),
          TextFormField(
            controller: _identifierController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: _inputDecoration(
              hint: 'meisya.ubud@gmail.com / 08123456789',
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Email atau nomor HP wajib diisi';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          _buildFieldLabel('Password'),
          const SizedBox(height: 7),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _login(),
            decoration: _inputDecoration(
              hint: 'Masukkan password',
              suffixIcon: IconButton(
                tooltip: _obscurePassword
                    ? 'Tampilkan password'
                    : 'Sembunyikan password',
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xFF94A3B8),
                  size: 21,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Password wajib diisi';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _rememberMe = !_rememberMe;
                    });
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Checkbox(
                          value: _rememberMe,
                          activeColor: primary,
                          side: const BorderSide(color: Color(0xFFCBD5E1)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Flexible(
                        child: Text(
                          'Ingat Saya',
                          style: TextStyle(
                            color: Color(0xFF334155),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () => _showMessage(
                  'Fitur lupa password akan dihubungkan nanti.',
                ),
                style: TextButton.styleFrom(
                  foregroundColor: primary,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 36),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Lupa password?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
                foregroundColor: Colors.white,
                disabledBackgroundColor: primary.withOpacity(0.6),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 21,
                      height: 21,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Masuk',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xFFD1FAE5),
                          size: 21,
                        ),
                      ],
                    ),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(
                  'atau masuk dengan',
                  style: TextStyle(
                    color: Colors.blueGrey.shade300,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              onPressed: () => _showMessage(
                'Login Google belum dihubungkan.',
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF334155),
                backgroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFFE2E8F0)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _googleMark(),
                  const SizedBox(width: 11),
                  const Text(
                    'Masuk dengan Google',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 22),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              const Text(
                'Belum punya akun? ',
                style: TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 14,
                ),
              ),
              GestureDetector(
                onTap: () => _showMessage(
                  'Halaman pendaftaran akan dihubungkan nanti.',
                ),
                child: const Text(
                  'Daftar Sekarang',
                  style: TextStyle(
                    color: primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF1E293B),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Color(0xFF94A3B8),
        fontSize: 13,
      ),
      filled: true,
      fillColor: const Color(0xFFF7FBF6),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFCFE3C9)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primary, width: 1.4),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.4),
      ),
    );
  }

  Widget _googleMark() {
    return const SizedBox(
      width: 21,
      height: 21,
      child: Center(
        child: Text(
          'G',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w800,
            color: Color(0xFF4285F4),
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 22),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              style: const TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 11,
                height: 1.6,
              ),
              children: [
                const TextSpan(text: 'Dengan masuk, Anda menyetujui '),
                TextSpan(
                  text: 'Ketentuan Penggunaan',
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: null,
                ),
                const TextSpan(text: ' dan '),
                const TextSpan(
                  text: 'Kebijakan Privasi',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: ' SIKARA.'),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Container(
            width: 128,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFCBD5E1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
