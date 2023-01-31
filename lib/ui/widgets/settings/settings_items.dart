import 'package:cats_fact/models/settings/settings_item_model.dart';
import 'package:flutter/material.dart';

class SettingsItems extends StatelessWidget {
  final List<SettingsItemModel> items;
  const SettingsItems(this.items, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: items.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(fontSize: 17),
                ),
                item.trailing != null
                    ? item.trailing!
                    : item.icon != null
                        ? IconButton(
                            onPressed: () =>
                                item.onTap != null ? item.onTap!() : null,
                            icon: Icon(item.icon),
                          )
                        : const SizedBox(),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 2),
      ),
    );
  }
}
