import 'package:flutter/material.dart';
import '../enums/sort_option.dart';

class SortDropdown extends StatelessWidget {
  final SortOption selectedSort;
  final ValueChanged<SortOption?> onChanged;

  const SortDropdown({
    super.key,
    required this.selectedSort,
    required this.onChanged,
  });

  String getLabel(SortOption option) {
    switch (option) {
      case SortOption.az:
        return 'A-Z';
      case SortOption.za:
        return 'Z-A';
      case SortOption.year:
        return 'Year';
      case SortOption.rating:
        return 'Rating';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SortOption>(
      value: selectedSort,
      decoration: const InputDecoration(
        labelText: 'Sort By',
        border: OutlineInputBorder(),
      ),
      items: SortOption.values.map((option) {
        return DropdownMenuItem(value: option, child: Text(getLabel(option)));
      }).toList(),
      onChanged: onChanged,
    );
  }
}
