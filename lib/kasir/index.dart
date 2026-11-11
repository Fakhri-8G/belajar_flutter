import 'package:flutter/material.dart';
import 'payment.dart';

class KasirIndexPage extends StatefulWidget {
  const KasirIndexPage({super.key});

  @override
  State<KasirIndexPage> createState() => _KasirIndexPageState();
}

class _KasirIndexPageState extends State<KasirIndexPage> {
  // =====================
  // DATA PRODUK
  // =====================
  final List<Map<String, dynamic>> items = [
    {
      'nama': 'Nasi Goreng',
      'harga': 15000,
      'icon': Icons.rice_bowl,
    },
    {
      'nama': 'Mie Goreng',
      'harga': 12000,
      'icon': Icons.ramen_dining,
    },
    {
      'nama': 'Es Teh',
      'harga': 5000,
      'icon': Icons.local_drink,
    },
    {
      'nama': 'Kopi',
      'harga': 8000,
      'icon': Icons.coffee,
    },
    {
      'nama': 'Ayam Goreng',
      'harga': 20000,
      'icon': Icons.restaurant,
    },
    {
      'nama': 'Air Mineral',
      'harga': 3000,
      'icon': Icons.water_drop,
    },
  ];

  // =====================
  // JUMLAH PRODUK
  // =====================
  final List<int> jumlah = [0, 0, 0, 0, 0, 0];

  // =====================
  // HITUNG TOTAL HARGA
  // =====================
  int getTotal() {
    int total = 0;

    for (int i = 0; i < items.length; i++) {
      total += (items[i]['harga'] as int) * jumlah[i];
    }

    return total;
  }

  // =====================
  // HITUNG TOTAL ITEM
  // =====================
  int getTotalItem() {
    int totalItem = 0;

    for (int item in jumlah) {
      totalItem += item;
    }

    return totalItem;
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      // =====================
      // HEADER MODERN
      // =====================
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        toolbarHeight: 75,

        title: Row(
          children: [
            // ICON APLIKASI
            Container(
              width: 46,
              height: 46,

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Icon(
                Icons.point_of_sale,
                color: Colors.white,
                size: 26,
              ),
            ),

            const SizedBox(width: 12),

            // NAMA APLIKASI
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'KasirKu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 2),

                Text(
                  'Point of Sale System',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),

        // BAGIAN KANAN HEADER
        actions: [
          // NOTIFIKASI
          IconButton(
            onPressed: () {},

            icon: const Icon(
              Icons.notifications_none,
            ),

            tooltip: 'Notifikasi',
          ),

          const SizedBox(width: 8),

          // PROFIL KASIR
          Padding(
            padding: const EdgeInsets.only(right: 24),

            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,

                  decoration: const BoxDecoration(
                    color: Color(0xFFE3F2FD),
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),

                const SizedBox(width: 10),

                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      'Kasir',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                      'Online',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
            // =====================
            Expanded(
              flex: 3,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // =====================
                  // WELCOME CARD
                  // =====================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Text(
                          'Selamat Datang!',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'Pilih produk untuk memulai transaksi hari ini.',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 24),

                        Row(
                          children: [
                            // =====================
                            // TOTAL ITEM
                            // =====================
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),

                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF6FF),
                                  borderRadius:
                                      BorderRadius.circular(16),
                                ),

                                child: Row(
                                  children: [
                                    Container(
                                      width: 46,
                                      height: 46,

                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),

                                      child: const Icon(
                                        Icons.shopping_cart_outlined,
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(width: 14),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        const Text(
                                          'Total Item',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                          ),
                                        ),

                                        const SizedBox(height: 3),

                                        Text(
                                          '${getTotalItem()} Item',
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(width: 16),

                            // =====================
                            // TOTAL BELANJA
                            // =====================
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(16),

                                decoration: BoxDecoration(
                                  color: const Color(0xFFF0FDF4),
                                  borderRadius:
                                      BorderRadius.circular(16),
                                ),

                                child: Row(
                                  children: [
                                    Container(
                                      width: 46,
                                      height: 46,

                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),

                                      child: const Icon(
                                        Icons.payments_outlined,
                                        color: Colors.white,
                                      ),
                                    ),

                                    const SizedBox(width: 14),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        const Text(
                                          'Total Belanja',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13,
                                          ),
                                        ),

                                        const SizedBox(height: 3),

                                        Text(
                                          formatRupiah(getTotal()),
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight:
                                                FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // =====================
                  // JUDUL PRODUK
                  // =====================
                  const Text(
                    'Daftar Produk',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Pilih produk yang ingin dibeli',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =====================
                  // GRID PRODUK
                  // =====================
                  Expanded(
                    child: GridView.builder(
                      itemCount: items.length,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.2,
                      ),

                      itemBuilder: (context, index) {
                        bool sudahDipilih = jumlah[index] > 0;

                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),

                            border: Border.all(
                              color: sudahDipilih
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 2,
                            ),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(16),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                // =====================
                                // ICON + JUMLAH
                                // =====================
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    // ICON PRODUK
                                    Container(
                                      width: 52,
                                      height: 52,

                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEFF6FF),
                                        borderRadius: BorderRadius.circular(14),
                                      ),

                                      child: Icon(
                                        items[index]['icon'],
                                        size: 28,
                                        color: Colors.blue,
                                      ),
                                    ),

                                    // BADGE JUMLAH
                                    if (sudahDipilih)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 6,
                                        ),

                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),

                                        child: Text(
                                          '${jumlah[index]} Item',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),

                                const Spacer(),

                                // =====================
                                // NAMA PRODUK
                                // =====================
                                Text(
                                  items[index]['nama'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 6),

                                // =====================
                                // HARGA PRODUK
                                // =====================
                                Text(
                                  formatRupiah(items[index]['harga']),

                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 14),

                                // =====================
                                // TOMBOL TAMBAH
                                // =====================
                                SizedBox(
                                  width: double.infinity,
                                  height: 42,

                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        jumlah[index]++;
                                      });
                                    },

                                    icon: const Icon(
                                      Icons.add,
                                      size: 18,
                                    ),

                                    label: const Text(
                                      'Tambah',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 24),

            // =====================
            // BAGIAN KANAN
            // KERANJANG MODERN
            // =====================
            Container(
              width: 360,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // =====================
                  // HEADER KERANJANG
                  // =====================
                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,

                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: const Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.blue,
                          size: 25,
                        ),
                      ),

                      const SizedBox(width: 12),

                      // JUDUL + SUBTITLE
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text(
                              'Keranjang',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 3),

                            Text(
                              '${getTotalItem()} item dipilih',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // BADGE TOTAL ITEM
                      Container(
                        width: 34,
                        height: 34,

                        alignment: Alignment.center,

                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),

                        child: Text(
                          '${getTotalItem()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const SizedBox(height: 10),

                  // =====================
                  // LIST PRODUK
                  // =====================
                  Expanded(
                    child: getTotalItem() == 0
                        ? const Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 55,
                                  color: Colors.grey,
                                ),

                                SizedBox(height: 12),

                                Text(
                                  'Keranjang masih kosong',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Text(
                                  'Pilih produk untuk memulai',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          )

                        : ListView.builder(
                            itemCount: items.length,

                            itemBuilder: (context, index) {
                              if (jumlah[index] == 0) {
                                return const SizedBox();
                              }

                              return Container(
                                margin: const EdgeInsets.only(bottom: 12),

                                padding: const EdgeInsets.all(12),

                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius:
                                      BorderRadius.circular(14),
                                ),

                                child: Row(
                                  children: [
                                    // =====================
                                    // ICON PRODUK
                                    // =====================
                                    Container(
                                      width: 42,
                                      height: 42,

                                      decoration: BoxDecoration(
                                        color: const Color(0xFFEFF6FF),
                                        borderRadius:
                                            BorderRadius.circular(12),
                                      ),

                                      child: Icon(
                                        items[index]['icon'],
                                        color: Colors.blue,
                                        size: 22,
                                      ),
                                    ),

                                    const SizedBox(width: 12),

                                    // =====================
                                    // NAMA + HARGA
                                    // =====================
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,

                                        children: [
                                          Text(
                                            items[index]['nama'],
                                            maxLines: 1,
                                            overflow:
                                                TextOverflow.ellipsis,

                                            style: const TextStyle(
                                              fontWeight:
                                                  FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),

                                          const SizedBox(height: 4),

                                          Text(
                                            formatRupiah(
                                              items[index]['harga'],
                                            ),
                                            style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // =====================
                                    // BUTTON JUMLAH
                                    // =====================
                                    Row(
                                      mainAxisSize: MainAxisSize.min,

                                      children: [
                                        // MINUS
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (jumlah[index] > 0) {
                                                jumlah[index]--;
                                              }
                                            });
                                          },

                                          borderRadius:
                                              BorderRadius.circular(8),

                                          child: Container(
                                            width: 30,
                                            height: 30,

                                            alignment: Alignment.center,

                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),

                                            child: const Icon(
                                              Icons.remove,
                                              size: 18,
                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),

                                          child: Text(
                                            '${jumlah[index]}',
                                            style: const TextStyle(
                                              fontWeight:
                                                  FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        // PLUS
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              jumlah[index]++;
                                            });
                                          },

                                          borderRadius:
                                              BorderRadius.circular(8),

                                          child: Container(
                                            width: 30,
                                            height: 30,

                                            alignment: Alignment.center,

                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),

                                            child: const Icon(
                                              Icons.add,
                                              size: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),

                  const SizedBox(height: 10),

                  const Divider(),

                  const SizedBox(height: 15),

                  // =====================
                  // TOTAL
                  // =====================
                  const Text(
                    'Total Pembayaran',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    formatRupiah(getTotal()),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =====================
                  // BUTTON CHECKOUT
                  // =====================
                  SizedBox(
                    width: double.infinity,
                    height: 52,

                    child: ElevatedButton.icon(
                      onPressed: getTotal() == 0
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                    items: items,
                                    jumlah: jumlah,
                                  ),
                                ),
                              );
                            },

                      icon: const Icon(
                        Icons.arrow_forward,
                      ),

                      label: const Text(
                        'CHECKOUT',
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
          ],
        ),
      ),
    );
  }
}