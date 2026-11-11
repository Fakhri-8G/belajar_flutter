import 'package:flutter/material.dart';
import 'struk.dart';

class PaymentPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final List<int> jumlah;

  const PaymentPage({
    super.key,
    required this.items,
    required this.jumlah,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String metodePembayaran = 'Cash';

  final TextEditingController uangController =
      TextEditingController();

  // =====================
  // HITUNG TOTAL
  // =====================
  int getTotal() {
    int total = 0;

    for (int i = 0; i < widget.items.length; i++) {
      total +=
          (widget.items[i]['harga'] as int) *
          widget.jumlah[i];
    }

    return total;
  }

  // =====================
  // UANG DIBAYAR
  // =====================
  int getUangDibayar() {
    return int.tryParse(
          uangController.text.replaceAll('.', ''),
        ) ??
        0;
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
  void dispose() {
    uangController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int total = getTotal();
    int uangDibayar = getUangDibayar();
    int kembalian = uangDibayar - total;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      // =====================
      // APPBAR
      // =====================
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Row(
          children: [
            Icon(
              Icons.payments_outlined,
              color: Colors.blue,
            ),

            SizedBox(width: 10),

            Text(
              'Pembayaran',
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
      body: Padding(
        padding: const EdgeInsets.all(24),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // =====================
            // BAGIAN KIRI
            // DETAIL PESANAN
            // =====================
            Expanded(
              flex: 3,

              child: Container(
                padding: const EdgeInsets.all(24),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [
                    // HEADER
                    const Row(
                      children: [
                        Icon(
                          Icons.receipt_long_outlined,
                          color: Colors.blue,
                        ),

                        SizedBox(width: 10),

                        Text(
                          'Detail Pesanan',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Divider(),

                    // =====================
                    // LIST ITEM
                    // =====================
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.items.length,

                        itemBuilder: (context, index) {
                          if (widget.jumlah[index] == 0) {
                            return const SizedBox();
                          }

                          int subtotal =
                              (widget.items[index]['harga']
                                      as int) *
                                  widget.jumlah[index];

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 12,
                            ),

                            child: Row(
                              children: [
                                // ICON
                                Container(
                                  width: 46,
                                  height: 46,

                                  decoration: BoxDecoration(
                                    color:
                                        const Color(0xFFEFF6FF),
                                    borderRadius:
                                        BorderRadius.circular(
                                      12,
                                    ),
                                  ),

                                  child: Icon(
                                    widget.items[index]['icon'],
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
                                        widget.items[index]
                                            ['nama'],
                                        style: const TextStyle(
                                          fontWeight:
                                              FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      Text(
                                        '${widget.jumlah[index]} × ${formatRupiah(widget.items[index]['harga'])}',
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // SUBTOTAL
                                Text(
                                  formatRupiah(subtotal),
                                  style: const TextStyle(
                                    fontWeight:
                                        FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const Divider(),

                    const SizedBox(height: 16),

                    // =====================
                    // TOTAL
                    // =====================
                    const Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      formatRupiah(total),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 24),

            // =====================
            // BAGIAN KANAN
            // PAYMENT
            // =====================
            Container(
              width: 400,

              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  // =====================
                  // JUDUL
                  // =====================
                  const Text(
                    'Metode Pembayaran',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Pilih metode pembayaran',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =====================
                  // BUTTON CASH
                  // =====================
                  InkWell(
                    onTap: () {
                      setState(() {
                        metodePembayaran = 'Cash';
                      });
                    },

                    borderRadius: BorderRadius.circular(14),

                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: metodePembayaran == 'Cash'
                            ? const Color(0xFFEFF6FF)
                            : const Color(0xFFF8FAFC),

                        borderRadius:
                            BorderRadius.circular(14),

                        border: Border.all(
                          color:
                              metodePembayaran == 'Cash'
                                  ? Colors.blue
                                  : Colors.transparent,
                          width: 2,
                        ),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.payments_outlined,
                            color: Colors.blue,
                          ),

                          const SizedBox(width: 12),

                          const Expanded(
                            child: Text(
                              'Cash',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          if (metodePembayaran == 'Cash')
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                            ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // =====================
                  // BUTTON QRIS
                  // =====================
                  InkWell(
                    onTap: () {
                      setState(() {
                        metodePembayaran = 'QRIS';

                        // Bersihkan input cash
                        uangController.clear();
                      });
                    },

                    borderRadius: BorderRadius.circular(14),

                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: metodePembayaran == 'QRIS'
                            ? const Color(0xFFEFF6FF)
                            : const Color(0xFFF8FAFC),

                        borderRadius:
                            BorderRadius.circular(14),

                        border: Border.all(
                          color:
                              metodePembayaran == 'QRIS'
                                  ? Colors.blue
                                  : Colors.transparent,
                          width: 2,
                        ),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.qr_code,
                            color: Colors.blue,
                          ),

                          const SizedBox(width: 12),

                          const Expanded(
                            child: Text(
                              'QRIS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          if (metodePembayaran == 'QRIS')
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                            ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // =====================
                  // CASH INPUT
                  // =====================
                  if (metodePembayaran == 'Cash') ...[
                    const Text(
                      'Uang Dibayar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      controller: uangController,

                      keyboardType: TextInputType.number,

                      onChanged: (value) {
                        setState(() {});
                      },

                      decoration: InputDecoration(
                        prefixText: 'Rp ',

                        hintText: 'Masukkan nominal uang',

                        filled: true,
                        fillColor:
                            const Color(0xFFF8FAFC),

                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // =====================
                    // KEMBALIAN
                    // =====================
                    if (uangDibayar > total)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color:
                              const Color(0xFFF0FDF4),
                          borderRadius:
                              BorderRadius.circular(14),
                        ),

                        child: Row(
                          children: [
                            const Icon(
                              Icons.change_circle_outlined,
                              color: Colors.green,
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,

                                children: [
                                  const Text(
                                    'Kembalian',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    formatRupiah(kembalian),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight:
                                          FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: 20),
                  ],

                  // =====================
                  // INFO QRIS
                  // =====================
                  if (metodePembayaran == 'QRIS')
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius:
                            BorderRadius.circular(14),
                      ),

                      child: const Column(
                        children: [
                          Icon(
                            Icons.qr_code_2,
                            size: 70,
                            color: Colors.blue,
                          ),

                          SizedBox(height: 10),

                          Text(
                            'Scan QRIS untuk membayar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Pastikan pembayaran sudah berhasil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const Spacer(),

                  // =====================
                  // BUTTON BAYAR
                  // =====================
                  SizedBox(
                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Validasi cash
                        if (metodePembayaran == 'Cash' &&
                            uangDibayar < total) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Uang pembayaran belum mencukupi',
                              ),
                            ),
                          );

                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StrukPage(
                              items: widget.items,
                              jumlah: widget.jumlah,
                              metodePembayaran:
                                  metodePembayaran,
                              uangDibayar:
                                  metodePembayaran == 'Cash'
                                      ? uangDibayar
                                      : total,
                            ),
                          ),
                        );
                      },

                      icon: const Icon(
                        Icons.arrow_forward,
                      ),

                      label: const Text(
                        'BAYAR SEKARANG',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}