import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpape_app/models/photo_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpape_app/widgets/widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModel> photos = [];
  TextEditingController searchController = TextEditingController();
  bool search = false; //because the app is adding all the searched images in the same list.


  //method to search wallpapers
  Future<void> getSearchWallpapers(String searchQuery) async {
    await http.get(
        Uri.parse(
            'https://api.pexels.com/v1/search?query=$searchQuery&per_page=30'),
        headers: {
          'Authorization':
              'Yzq9ZMsOQSPGbtrNglVQANNWdWMHt1WybOEZ4KXfxvlMkLWHqw5IcaZj'
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData['photos'].forEach((element) {
        PhotosModel photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {
        search = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'SEARCH',
                style: GoogleFonts.poppins(
                  fontSize: 28.0,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xFFececf8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for free photos',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      getSearchWallpapers(searchController.text);
                    },
                    child: search ?  GestureDetector(
                      onTap: (){
                        photos = [];
                        search = false;
                        searchController.clear();
                        setState(() {

                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ) : const Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: wallpaper(photos, context),
            ),
          ],
        ),
      ),
    );
  }
}
