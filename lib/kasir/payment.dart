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

  final TextEditingController uangController = TextEditingController();

  int getTotal() {
    int total = 0;

    for (int i = 0; i < widget.items.length; i++) {
      total += (widget.items[i]['harga'] as int) * widget.jumlah[i];
    }

    return total;
  }

  int getUangDibayar() {
    // Menghapus titik pemisah ribuan sebelum mengubahnya menjadi angka.
    return int.tryParse(uangController.text.replaceAll('.', '')) ?? 0;
  }

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
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final bool isMobile = constraints.maxWidth < 800;

          if (isMobile) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildOrderCard(isMobile: true),
                  const SizedBox(height: 20),
                  _buildPaymentCard(isMobile: true),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _buildOrderCard(isMobile: false),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  width: 400,
                  child: _buildPaymentCard(isMobile: false),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOrderCard({required bool isMobile}) {
    final int total = getTotal();

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

          if (isMobile)
            _buildOrderItems(shrinkWrap: true)
          else
            Expanded(
              child: _buildOrderItems(shrinkWrap: false),
            ),

          const Divider(),
          const SizedBox(height: 16),
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
    );
  }

  Widget _buildOrderItems({required bool shrinkWrap}) {
    return ListView.builder(
      itemCount: widget.items.length,
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap
          ? const NeverScrollableScrollPhysics()
          : null,
      itemBuilder: (context, index) {
        if (widget.jumlah[index] == 0) {
          return const SizedBox.shrink();
        }

        final int harga = widget.items[index]['harga'] as int;
        final int subtotal = harga * widget.jumlah[index];
        final String nama = widget.items[index]['nama'] as String;
        final IconData icon = widget.items[index]['icon'] as IconData;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
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
                  icon,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.jumlah[index]} × ${formatRupiah(harga)}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                formatRupiah(subtotal),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPaymentCard({required bool isMobile}) {
    final int total = getTotal();
    final int uangDibayar = getUangDibayar();
    final int kembalian = uangDibayar - total;

    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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

          _buildPaymentMethodTile(
            title: 'Cash',
            icon: Icons.payments_outlined,
          ),
          const SizedBox(height: 12),
          _buildPaymentMethodTile(
            title: 'QRIS',
            icon: Icons.qr_code,
          ),

          const SizedBox(height: 24),

          if (metodePembayaran == 'Cash') ...[
            const Text(
              'Uang Dibayar',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: uangController,
              keyboardType: TextInputType.number,
              onChanged: (_) {
                setState(() {});
              },
              decoration: InputDecoration(
                prefixText: 'Rp ',
                hintText: 'Masukkan nominal uang',
                filled: true,
                fillColor: const Color(0xFFF8FAFC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            if (uangDibayar >= total && uangDibayar > 0)
              _buildChangeInfo(kembalian)
            else if (uangDibayar > 0 && uangDibayar < total)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Uang pembayaran belum mencukupi.',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),

            const SizedBox(height: 20),
          ],

          if (metodePembayaran == 'QRIS') ...[
            _buildQrisInfo(),
            const SizedBox(height: 20),
          ],

          if (!isMobile) const Spacer(),

          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: () {
                _prosesPembayaran(
                  total: total,
                  uangDibayar: uangDibayar,
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text(
                'BAYAR SEKARANG',
                style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }

  Widget _buildPaymentMethodTile({
    required String title,
    required IconData icon,
  }) {
    final bool selected = metodePembayaran == title;

    return InkWell(
      onTap: () {
        setState(() {
          metodePembayaran = title;

          if (title == 'QRIS') {
            uangController.clear();
          }
        });
      },
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFFEFF6FF)
              : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (selected)
              const Icon(
                Icons.check_circle,
                color: Colors.blue,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildChangeInfo(int kembalian) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(14),
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrisInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
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
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Pastikan pembayaran sudah berhasil.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  void _prosesPembayaran({
    required int total,
    required int uangDibayar,
  }) {
    if (metodePembayaran == 'Cash' && uangDibayar < total) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Uang pembayaran belum mencukupi'),
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
          metodePembayaran: metodePembayaran,
          uangDibayar: metodePembayaran == 'Cash'
              ? uangDibayar
              : total,
        ),
      ),
    );
  }
}