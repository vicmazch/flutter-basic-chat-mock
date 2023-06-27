import 'package:flutter/material.dart';
import 'package:sec_five_app/domain/entities/message.dart';

class YourMessageBubble extends StatelessWidget {
  
  final Message message;
  
  const YourMessageBubble({
    super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colors.secondary,
          ),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle( color: Colors.white),
            ),
          ),
        ),
        const SizedBox( height: 5,),
        message.imageUrl != null ? _ImageBubble(image: message.imageUrl!) : const SizedBox(),
        const SizedBox(height: 10,)
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String image;
  const _ImageBubble({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        image,//'https://yesno.wtf/assets/no/2-101be1e3d8a0ed407c4e3c001ef8fa66.gif',
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if( loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding:  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('...'),
          );
        },
      ));
  }
}