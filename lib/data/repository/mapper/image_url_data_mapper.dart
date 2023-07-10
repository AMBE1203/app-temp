import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../model/image_url_data.dart';
import 'base/base_data_mapper.dart';

@Injectable()
class ImageUrlDataMapper extends BaseDataMapper<ImageUrlData, ImageUrl> {
  @override
  ImageUrl mapToEntity(ImageUrlData? data) {
    return ImageUrl(
      origin: data?.origin ?? '',
      sm: data?.sm ?? '',
      md: data?.md ?? '',
      lg: data?.lg ?? '',
    );
  }
}
