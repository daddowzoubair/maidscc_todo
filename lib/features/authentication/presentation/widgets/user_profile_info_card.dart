import '../../../../constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class UserProfileInfoCard extends StatelessWidget {
  final String title;
  final List<String> info;
  const UserProfileInfoCard({
    required this.title,
    required this.info,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimensions.sixteenDimension , vertical: AppDimensions.eightDimension),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: AppDimensions.eightDimension),
            ...info.map((item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppDimensions.fourDimension),
                  child: Text(item),
                )),
          ],
        ),
      ),
    );
  }
}
