import 'package:demo_metalogyc_task/service.dart';

import 'base_provider.dart';
import 'image_list_model.dart';

class ImageListProvider extends BaseProvider {
  ServiceClass serviceClas = ServiceClass();
  ImagesListRes? imageData;
  bool isLoading = false;
  Future<void> getImageData() async {
    isLoading = true;
    update();
    var response = await serviceClas.getImageData();
    if (response != null) {
      try {
        imageData = response;
      } catch (err) {
        imageData = null;
      }
      isLoading = false;
      update();
    }
  }
}
