import 'package:flutter/material.dart';

/// Halaman Beranda SIKARA.
/// Bottom navigation tidak dibuat di sini karena sebaiknya dikelola
/// oleh MainScreen agar bisa dipakai bersama halaman Peta, Setor, Poin, dan Profil.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color primary = Color(0xFF103602);
  static const Color primaryContainer = Color(0xFF274D16);
  static const Color secondary = Color(0xFF2F6B0E);
  static const Color secondaryContainer = Color(0xFFAFF589);
  static const Color surface = Color(0xFFF1FCF3);
  static const Color surfaceContainer = Color(0xFFE5F1E7);
  static const Color surfaceLow = Color(0xFFEBF7ED);
  static const Color textColor = Color(0xFF141E18);
  static const Color muted = Color(0xFF43493D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surface,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: const [
            _HomeHeader(),
            SizedBox(height: 20),
            _GreetingSection(),
            SizedBox(height: 20),
            _EcoPointCard(),
            SizedBox(height: 20),
            _QuickActions(),
            SizedBox(height: 20),
            _GalunganBanner(),
            SizedBox(height: 20),
            _NearestDropPoint(),
            SizedBox(height: 20),
            _RecentActivity(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: HomePage.surfaceContainer,
          child: const Icon(Icons.person, color: HomePage.primary, size: 27),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'SIKARA',
                    style: TextStyle(
                      color: HomePage.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(width: 7),
                  _SmallPill(
                    text: 'KRAMA',
                    background: HomePage.secondaryContainer,
                    foreground: HomePage.primary,
                  ),
                ],
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: HomePage.secondary),
                  SizedBox(width: 3),
                  Expanded(
                    child: Text(
                      'Desa Adat Ubud • Banjar Taman',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11, color: HomePage.muted),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, size: 17, color: HomePage.muted),
                ],
              ),
            ],
          ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_rounded),
              color: HomePage.muted,
            ),
            Positioned(
              right: 7,
              top: 5,
              child: Container(
                width: 16,
                height: 16,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFFBA1A1A),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _GreetingSection extends StatelessWidget {
  const _GreetingSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SmallPill(
              text: '♧  Warga Aktif Lestari',
              background: HomePage.secondaryContainer,
              foreground: HomePage.primary,
            ),
            _SmallPill(
              text: '✓  Terverifikasi Banjar',
              background: HomePage.surfaceContainer,
              foreground: HomePage.muted,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Om Swastyastu, Halo Meisya 👋',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: HomePage.textColor,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Krama Banjar Taman, Desa Adat Ubud',
          style: TextStyle(color: HomePage.muted, fontSize: 13),
        ),
      ],
    );
  }
}

class _EcoPointCard extends StatelessWidget {
  const _EcoPointCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [HomePage.primary, HomePage.primaryContainer, Color(0xFF1B3D10)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: HomePage.primary.withOpacity(0.22),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '★  TABUNGAN ECO-POIN',
                      style: TextStyle(
                        color: HomePage.secondaryContainer,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.7,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '1.250',
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(width: 7),
                        Text('Poin', style: TextStyle(color: HomePage.secondaryContainer, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      '≈ Rp 25.000 / Voucher Pupuk Organik',
                      style: TextStyle(color: Color(0xFFE5F1E7), fontSize: 11),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              FilledButton.icon(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: HomePage.secondaryContainer,
                  foregroundColor: HomePage.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                icon: const Icon(Icons.redeem, size: 17),
                label: const Text('Tukar Poin', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.18),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Row(
              children: [
                Expanded(child: _MetricItem(label: 'Total Setoran', value: '18 Kali')),
                Expanded(child: _MetricItem(label: 'Berat Limbah', value: '64.5 kg')),
                Expanded(child: _MetricItem(label: 'Reduksi CO₂', value: '128 kg', highlight: true)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MetricItem extends StatelessWidget {
  final String label;
  final String value;
  final bool highlight;

  const _MetricItem({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFFDCE8DE), fontSize: 10)),
        const SizedBox(height: 5),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: highlight ? HomePage.secondaryContainer : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    const actions = [
      (Icons.location_on_outlined, 'Cari Titik\nKumpul'),
      (Icons.compost, 'Setor Limbah'),
      (Icons.menu_book_outlined, 'Panduan\nPemilahan'),
      (Icons.local_shipping_outlined, 'Jadwal Pickup'),
    ];

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Layanan Yadnya Mandiri', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: HomePage.textColor)),
            Text('Bantuan Banjar', style: TextStyle(fontSize: 11, color: HomePage.secondary, fontWeight: FontWeight.w600)),
          ],
        ),
        const SizedBox(height: 14),
        Row(
          children: List.generate(actions.length, (index) {
            final item = actions[index];
            final isFeatured = index == 1;
            return Expanded(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(14),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Column(
                    children: [
                      if (isFeatured)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(color: HomePage.secondary, borderRadius: BorderRadius.circular(20)),
                          child: const Text('POPULER', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                        )
                      else
                        const SizedBox(height: 14),
                      const SizedBox(height: 4),
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          color: isFeatured ? HomePage.primaryContainer : HomePage.surfaceLow,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(item.$1, color: isFeatured ? Colors.white : HomePage.secondary, size: 27),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.$2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          height: 1.2,
                          fontWeight: isFeatured ? FontWeight.bold : FontWeight.w600,
                          color: isFeatured ? HomePage.primary : HomePage.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _GalunganBanner extends StatelessWidget {
  const _GalunganBanner();

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF92400E);
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: const Color(0xFFD97706).withOpacity(0.08), blurRadius: 14, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.event_available, color: Color(0xFFD97706)),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Menjelang Hari Raya Galungan 🌿', style: TextStyle(color: brown, fontSize: 13, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text(
                  'Volume canang & janur meningkat. Drop Point Balai Banjar Taman buka 06:00 – 18:00 WITA. Mohon siapkan wadah terpilah tanpa kantong kresek plastik.',
                  style: TextStyle(color: Color(0xFF78350F), fontSize: 11, height: 1.45),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    _SmallPill(text: '⚠  H-3 Galungan', background: Color(0xFFFDE68A), foreground: Color(0xFFB45309)),
                    SizedBox(width: 8),
                    Text('Baca SOP Penyetoran', style: TextStyle(color: brown, fontSize: 10, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NearestDropPoint extends StatelessWidget {
  const _NearestDropPoint();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Titik Kumpul Terdekat', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: HomePage.textColor)),
            Text('Peta Lengkap  →', style: TextStyle(color: HomePage.secondary, fontSize: 11, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(color: HomePage.primary.withOpacity(0.07), blurRadius: 14, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(color: HomePage.surfaceContainer, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.temple_hindu, color: HomePage.primary, size: 27),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 6,
                          children: [
                            Text('Drop Point Balai Banjar Taman', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HomePage.textColor)),
                            _SmallPill(text: '350 m', background: HomePage.secondaryContainer, foreground: HomePage.primary),
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(Icons.circle, size: 7, color: HomePage.secondary),
                            SizedBox(width: 5),
                            Text('Buka', style: TextStyle(color: HomePage.secondary, fontSize: 10, fontWeight: FontWeight.bold)),
                            Text(' • Beroperasi hingga 18:00 WITA', style: TextStyle(color: HomePage.muted, fontSize: 10)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: HomePage.surfaceLow, borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('▣  Kapasitas Penampungan', style: TextStyle(fontSize: 11, color: HomePage.muted)),
                        Text('65% Terisi', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: HomePage.textColor)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 0.65,
                        minHeight: 9,
                        backgroundColor: Color(0xFFDAE5DC),
                        valueColor: AlwaysStoppedAnimation(HomePage.secondary),
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text('Tersedia ruang untuk ± 45 kg sampah canang hari ini.', style: TextStyle(fontSize: 10, color: HomePage.muted)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text('LIMBAH YANG DITERIMA:', style: TextStyle(fontSize: 10, color: HomePage.muted, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              const SizedBox(height: 7),
              const Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _WasteChip('Canang & Banten'),
                  _WasteChip('Dupa Dingin'),
                  _WasteChip('Bunga Segar'),
                  _WasteChip('Kulit Kelapa / Danyuh'),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: FilledButton.icon(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: HomePage.surfaceContainer,
                    foregroundColor: HomePage.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
                  ),
                  icon: const Icon(Icons.near_me, size: 18),
                  label: const Text('Petunjuk Arah (Navigasi Peta)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WasteChip extends StatelessWidget {
  final String text;
  const _WasteChip(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(color: HomePage.surfaceContainer, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, size: 12, color: HomePage.secondary),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(fontSize: 10, color: HomePage.textColor)),
        ],
      ),
    );
  }
}

class _RecentActivity extends StatelessWidget {
  const _RecentActivity();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Aktivitas Terkini', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: HomePage.textColor)),
            Text('Lihat Semua Riwayat →', style: TextStyle(fontSize: 11, color: HomePage.secondary, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(color: HomePage.primary.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4)),
            ],
          ),
          child: const Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: HomePage.surfaceLow,
                child: Icon(Icons.spa, color: HomePage.secondary, size: 24),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Canang & Dupa Dingin', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HomePage.textColor)),
                    SizedBox(height: 4),
                    Text('4.2 kg • Balai Banjar Taman', style: TextStyle(fontSize: 10, color: HomePage.muted)),
                    SizedBox(height: 4),
                    Text('Kemarin, 16:30 WITA', style: TextStyle(fontSize: 10, color: HomePage.muted)),
                  ],
                ),
              ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _SmallPill(text: '+ 84 Poin', background: HomePage.secondaryContainer, foreground: HomePage.primary),
                  SizedBox(height: 5),
                  Text('✓ Terverifikasi', style: TextStyle(fontSize: 9, color: HomePage.secondary, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SmallPill extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;

  const _SmallPill({
    required this.text,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: background, borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: TextStyle(color: foreground, fontSize: 9, fontWeight: FontWeight.bold),
      ),
    );
  }
}
