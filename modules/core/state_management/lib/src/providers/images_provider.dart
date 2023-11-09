import 'package:flutter/foundation.dart';

String pinkPanther =
    'https://i.pinimg.com/736x/21/61/1a/21611a8447dd839db62fc64de01e92c6--panther-images-pink-panter.jpg';

String lisaImage =
    'https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F82109c15-5f39-4882-9bec-55e074a81c03_1080x1080.png';

String octopusImage =
    'https://images.theconversation.com/files/443875/original/file-20220201-25-lb03xa.jpg';

class ImagesProvider with ChangeNotifier {
  String _currentImage = octopusImage;

  ImagesProvider();

  String get currentImage => _currentImage;

  void updateImage(String image) {
    _currentImage = image;
    notifyListeners();
  }
}
