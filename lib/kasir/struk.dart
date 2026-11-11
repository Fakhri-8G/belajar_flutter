import 'package:flutter/material.dart';
import 'index.dart';

class StrukPage extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final List<int> jumlah;
  final String metodePembayaran;
  final int uangDibayar;

  const StrukPage({
    super.key,
    required this.items,
    required this.jumlah,
    required this.metodePembayaran,
    required this.uangDibayar,
  });

  // =====================
  // HITUNG TOTAL
  // =====================
  int getTotal() {
    int total = 0;

    for (int i = 0; i < items.length; i++) {
      total += (items[i]['harga'] as int) * jumlah[i];
    }

    return total;
  }

  // =====================
  // FORMAT RUPIAH
  // =====================
  String formatRupiah(int angka) {
    return 'Rp ${angka.toString().replaceAllMapped(
          RegExp(r'(?=(\d{3})+(?!\d))'),
          (match) => '.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    final int total = getTotal();
    final int kembalian = uangDibayar - total;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      // =====================
      // APPBAR
      // =====================
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,

        title: const Row(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              color: Colors.blue,
            ),
            SizedBox(width: 10),
            Text(
              'Struk Pembayaran',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // =====================
      // BODY
      // =====================
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),

          child: Container(
            width: 600,
            padding: const EdgeInsets.all(30),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // =====================
                // SUCCESS HEADER
                // =====================
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 90,

                        decoration: const BoxDecoration(
                          color: Color(0xFFF0FDF4),
                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 55,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'Pembayaran Berhasil!',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Terima kasih sudah berbelanja',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // TOTAL UTAMA
                      Text(
                        formatRupiah(total),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Divider(),

                const SizedBox(height: 20),

                // =====================
                // JUDUL DETAIL
                // =====================
                const Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Detail Pesanan',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // =====================
                // LIST ITEM
                // =====================
                ...List.generate(items.length, (index) {
                  if (jumlah[index] == 0) {
                    return const SizedBox();
                  }

                  final int subtotal =
                      (items[index]['harga'] as int) *
                          jumlah[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: Row(
                      children: [
                        // ICON PRODUK
                        Container(
                          width: 46,
                          height: 46,

                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: Icon(
                            items[index]['icon'],
                            color: Colors.blue,
                          ),
                        ),

                        const SizedBox(width: 14),

                        // NAMA + JUMLAH
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text(
                                items[index]['nama'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 4),

                              Text(
                                '${jumlah[index]} × ${formatRupiah(items[index]['harga'])}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // SUBTOTAL
                        Text(
                          formatRupiah(subtotal),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 10),

                const Divider(),

                const SizedBox(height: 16),

                // =====================
                // TOTAL
                // =====================
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [
                    const Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    Text(
                      formatRupiah(total),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // =====================
                // METODE PEMBAYARAN
                // =====================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,

                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(12),
                        ),

                        child: Icon(
                          metodePembayaran == 'Cash'
                              ? Icons.payments_outlined
                              : Icons.qr_code,
                          color: Colors.blue,
                        ),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [
                            const Text(
                              'Metode Pembayaran',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              metodePembayaran,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),

                // =====================
                // INFO CASH
                // =====================
                if (metodePembayaran == 'Cash') ...[
                  const SizedBox(height: 16),

                  _infoRow(
                    icon: Icons.payments_outlined,
                    title: 'Uang Dibayar',
                    value: formatRupiah(uangDibayar),
                  ),

                  // KEMBALIAN HANYA JIKA ADA
                  if (kembalian > 0) ...[
                    const SizedBox(height: 12),

                    _infoRow(
                      icon: Icons.change_circle_outlined,
                      title: 'Kembalian',
                      value: formatRupiah(kembalian),
                      isGreen: true,
                    ),
                  ],
                ],

                const SizedBox(height: 30),

                const Divider(),

                const SizedBox(height: 20),

                // =====================
                // THANK YOU
                // =====================
                const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 28,
                      ),

                      SizedBox(height: 8),

                      Text(
                        'Terima kasih sudah berbelanja!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        'Semoga hari Anda menyenangkan',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // =====================
                // TRANSAKSI BARU
                // =====================
                SizedBox(
                  width: double.infinity,
                  height: 54,

                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const KasirIndexPage(),
                        ),
                        (route) => false,
                      );
                    },

                    icon: const Icon(
                      Icons.add_shopping_cart,
                    ),

                    label: const Text(
                      'TRANSAKSI BARU',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
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

  // =====================
  // WIDGET INFO
  // =====================
  Widget _infoRow({
    required IconData icon,
    required String title,
    required String value,
    bool isGreen = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: isGreen
            ? const Color(0xFFF0FDF4)
            : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [
          Icon(
            icon,
            color: isGreen ? Colors.green : Colors.blue,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isGreen ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}