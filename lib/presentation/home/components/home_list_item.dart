import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:supabase_squid_game/utils/base.dart';

class HomeListItem extends StatefulWidget {
  const HomeListItem(
      {super.key,
      required this.name,
      required this.onDelete,
      required this.onUpdate});

  final String name;
  final Function onDelete;
  final Function onUpdate;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            foregroundColor: Colors.red,
            backgroundColor: Colors.transparent,
            onPressed: (context) async {
              widget.onDelete();
            },
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          widget.onUpdate();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primary),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Row(
                children: [
                  const SizedBox(
                    height: 36,
                    width: 36,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            widget.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
