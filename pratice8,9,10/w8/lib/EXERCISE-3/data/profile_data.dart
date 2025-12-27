import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Ronan",
  position: "Flutter Developer",
  avatarUrl: 'assets/w5-s2/aang.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    TileData(icon: Icons.work, title: "Company", value: "CADT"),
    TileData(icon: Icons.calendar_today, title: "Birthday", value: "January 1, 2000"),
    TileData(icon: Icons.language, title: "Website", value: "www.ronan-dev.com"),
    TileData(icon: Icons.school, title: "Education", value: "Bachelor of Computer Science"),
  ],
);
