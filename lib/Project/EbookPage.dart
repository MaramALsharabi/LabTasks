import 'package:flutter/material.dart';
class EbookPage extends StatefulWidget {
  const EbookPage({super.key});

  @override
  State<EbookPage> createState() => _EbookPageState();
}

class _EbookPageState extends State<EbookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Ebook"),
    );
  }
}
