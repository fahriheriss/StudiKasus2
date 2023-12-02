import 'package:flutter/material.dart';
import 'package:list_kuliner/detail_page.dart';
import 'package:list_kuliner/http_helper.dart';
import 'package:list_kuliner/makanan.dart';
import 'package:list_kuliner/styles.dart';


class ListItem extends StatelessWidget {
  final Makanan makanan;
  HttpHelper api = HttpHelper();

  ListItem({
    Key? key,
    required this.api, required this.makanan,
  }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:  () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(makanan: makanan, api: api)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: decorBoxContainer(),
        height: 100,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  api.url + makanan.gambarUtama,
                  height: 75,
                  width: 85,
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 10),
            itemText(),
            Icon(Icons.food_bank, color: iconColor, size: 30)
          ],
        ),
      ),
    );
  }

  BoxDecoration decorBoxContainer() {
    return const BoxDecoration(
      color: Color.fromARGB(255, 240, 235, 235),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(255, 178, 178, 178),
          offset: Offset(1.0, 2.0),
          blurRadius: 6.0,
        ),
      ],
    );
  }

  Expanded itemText() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(makanan.nama, style: headerH1),
          Text(
            makanan.deskripsi,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.black38),
          ),
          Text(
            makanan.harga,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}

 
