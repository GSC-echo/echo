import 'package:echo_app/widgets/other_widget.dart';
import 'package:flutter/material.dart';

// 기존 코드
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return SearchWidget();
  }
}
