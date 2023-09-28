import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextImageScreem extends StatefulWidget {
  const TextImageScreem({
    super.key,
    required this.title,
    required this.urlImage,
    required this.nameDetailsTwo,
  });
  final String title;
  final String urlImage;
  final String nameDetailsTwo;
  @override
  State<TextImageScreem> createState() => _TextImageScreemState();
}

class _TextImageScreemState extends State<TextImageScreem> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.nameDetailsTwo),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.title));
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Copy Success")));
                },
                icon: const Icon(
                  Icons.content_copy,
                  size: 35,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                widget.urlImage != "none"
                    ? SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            imageUrl: widget.urlImage,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : const SizedBox(
                        height: 10,
                      ),
                const SizedBox(
                  height: 10,
                ),
                SelectableText(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
