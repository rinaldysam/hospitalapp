import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCardView extends StatelessWidget {
  const HomeCardView({
    super.key,
    this.nameText,
    this.addressText,
    this.phoneText,
  });

  final String? nameText;
  final String? addressText;
  final String? phoneText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      constraints: BoxConstraints(
        minHeight: 64,
        maxWidth: MediaQuery.of(context).size.width,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 8),
          ],
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              height: 42,
              width: 42,
              child: Image.asset(
                'assets/images/img-hospital-placeholder.png',
              ),
            ).paddingOnly(right: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (nameText != null)
                    Text(
                      nameText!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  const SizedBox(height: 4),
                  Text(
                    addressText ?? '-',
                    style: const TextStyle(fontSize: 10, color: Colors.black54),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Text(
                      phoneText ?? '-',
                      style:
                          const TextStyle(fontSize: 10, color: Colors.black54),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 8),
      ).marginSymmetric(horizontal: 16, vertical: 4),
    );
  }
}
