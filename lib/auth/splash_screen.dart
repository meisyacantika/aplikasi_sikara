import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  static const Color backgroundColor = Color(0xFFFAFDF8);
  static const Color primaryColor = Color(0xFF274D16);
  static const Color darkColor = Color(0xFF1C331E);
  static const Color mutedColor = Color(0xFF3A5A40);

  late final AnimationController _fadeController;
  late final AnimationController _pulseController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutCubic,
    );

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 0.4,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          // Ambient light di sudut kanan atas.
          Positioned(
            top: -95,
            right: -95,
            child: _AmbientCircle(
              size: 255,
              color: const Color(0xFFDCFCE7).withOpacity(0.45),
            ),
          ),

          // Ambient light di sudut kiri bawah.
          Positioned(
            bottom: -105,
            left: -105,
            child: _AmbientCircle(
              size: 290,
              color: const Color(0xFFECFCCB).withOpacity(0.35),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 12),

                // Bagian utama: logo dan identitas aplikasi.
                Expanded(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 192,
                              child: Image.network(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuCsM9u4MICzjibooWfJ5IqX-OZBwTLug20JnbAGX6pnK_Mqn1Z295bq3Osp-OOzbyY5Y-lbLTX8-VbC72gK0xwJ5KEDHR8b_ZFCviQK81rDiOP7sy9_OkiJOseZ8y4wWAKOWclwlppeDPsUe_16LjW4kMnFBZq8QTyt49VFmV15Wl9OeIUtM56sn_2_dYEhuyuIZA5rE0ZfKWck2FlBl8W98ChR-37q_W8Y0ug0a3wSdDNR5IH_BeKuyBJ8nTIeArsKpw',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.eco_rounded,
                                    size: 110,
                                    color: primaryColor,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Kelola Limbah Upakara Bersama',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: mutedColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const SizedBox(
                              width: 270,
                              child: Text(
                                'Sistem Pengelolaan Limbah Organik Upakara Berbasis Desa Adat',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: darkColor,
                                  fontSize: 12,
                                  height: 1.6,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Bagian loading dan informasi versi.
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 30),
                  child: Column(
                    children: [
                      const SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.8,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            primaryColor,
                          ),
                          backgroundColor: Color(0x33274D16),
                        ),
                      ),
                      const SizedBox(height: 13),
                      FadeTransition(
                        opacity: _pulseAnimation,
                        child: const Text(
                          'Memuat aplikasi...',
                          style: TextStyle(
                            color: mutedColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.7,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Opacity(
                        opacity: 0.6,
                        child: Text(
                          'v1.0.0 Desa Adat Lestari',
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmbientCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _AmbientCircle({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
