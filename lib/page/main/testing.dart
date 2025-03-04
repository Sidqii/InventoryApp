import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:pusdatin_end/module/controller/ctrl_items.dart';

class TestingPage extends StatelessWidget {
  final CtrlItems controller = Get.put(CtrlItems());
  final ScrollController scrollController = ScrollController();

  TestingPage() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
        controller.fetchItems(); // Panggil lazy loading ketika hampir di bawah
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TestingPage')),
      body: Obx(() {
        return controller.items.isEmpty && controller.isLoading.value
            ? _buildShimmerLoading() // Tampilkan shimmer loading saat data awal dimuat
            : ListView.builder(
                controller: scrollController,
                itemCount: controller.items.length + (controller.isLoading.value ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= controller.items.length) {
                    return _buildShimmerLoadingItem(); // Munculkan loading saat memuat lebih banyak data
                  }

                  var item = controller.items[index];
                  return _buildItemCard(item);
                },
              );
      }),
    );
  }

  // Widget untuk menampilkan Card item
  Widget _buildItemCard(Map<String, dynamic> item) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 6, // Membuat Card lebih terangkat
      shadowColor: Colors.grey.withAlpha(30),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Icon(Icons.shopping_cart, size: 40, color: Colors.blue),
        title: Text(item['nama_barang'].toString(),
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Harga: Rp. ${item['harga'].toString()}'),
            Text('Lokasi: ${item['lokasi'].toString()}'),
          ],
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  // Widget untuk menampilkan Shimmer Loading
  Widget _buildShimmerLoading() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => _buildShimmerLoadingItem(),
    );
  }

  // Widget efek shimmer untuk loading item
  Widget _buildShimmerLoadingItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 10, // Efek terangkat lebih tinggi saat loading
        shadowColor: Colors.grey.withAlpha(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          title: Container(
            height: 16,
            width: double.infinity,
            color: Colors.white,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Container(height: 14, width: 150, color: Colors.white),
              SizedBox(height: 4),
              Container(height: 14, width: 100, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
