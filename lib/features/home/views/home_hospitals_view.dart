import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeHospitalView extends StatelessWidget {
  const HomeHospitalView({
    super.key,
    required this.title,
    required this.filters,
    required this.selectedFilter,
    required this.children,
    this.onTapFilter,
    this.onTapAll,
  });

  final String title;
  final Map<int, String> filters;
  final int selectedFilter;
  final List<Widget> children;
  final Function(int)? onTapFilter;
  final VoidCallback? onTapAll;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 320,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 32,
                child: TextButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry?>(
                      const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                  onPressed: onTapAll,
                  child: const Text('See all'),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
          SizedBox(
            height: 28,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filters.keys.length,
              itemBuilder: (context, index) {
                final key = filters.keys.elementAt(index);
                return GestureDetector(
                  onTap: () {
                    if (onTapFilter != null) {
                      onTapFilter!(index);
                    }
                  },
                  child: _renderChip(
                    filters[key] ?? '',
                    index == selectedFilter,
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: children.length,
              itemBuilder: (context, index) {
                return children[index];
              },
            ).marginOnly(top: 16),
          ),
        ],
      ),
    );
  }

  Widget _renderChip(String text, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueAccent : const Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(right: 8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
