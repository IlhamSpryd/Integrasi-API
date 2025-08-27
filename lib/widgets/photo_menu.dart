import 'dart:ui';
import 'package:flutter/material.dart';

class PhotoMenuButton extends StatelessWidget {
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final double size; 
  final double backgroundSize; 
  final Color backgroundColor; 
  final double backgroundOpacity; 

  const PhotoMenuButton({
    super.key,
    this.onEdit,
    this.onDelete,
    this.size = 20,
    this.backgroundSize = 40,
    this.backgroundColor = Colors.white,
    this.backgroundOpacity = 0.3, 
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(backgroundSize / 2),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), 
        child: Container(
          width: backgroundSize,
          height: backgroundSize,
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(backgroundOpacity),
            borderRadius: BorderRadius.circular(backgroundSize / 2),
          ),
          child: Center(
            child: PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              icon: Icon(Icons.more_vert, color: Colors.white, size: size),
              onSelected: (value) {
                if (value == 'edit' && onEdit != null) onEdit!();
                if (value == 'delete' && onDelete != null) onDelete!();
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'edit', child: Text('Edit')),
                const PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
