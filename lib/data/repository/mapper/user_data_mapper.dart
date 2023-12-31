import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../../shared/shared.dart';
import '../model/user_data.dart';
import 'base/base_data_mapper.dart';
import 'gender_data_mapper.dart';
import 'image_url_data_mapper.dart';

@Injectable()
class UserDataMapper extends BaseDataMapper<UserData, User> {
  UserDataMapper(
    this._genderDataMapper,
    this._imageUrlDataMapper,
  );

  final GenderDataMapper _genderDataMapper;
  final ImageUrlDataMapper _imageUrlDataMapper;

  @override
  User mapToEntity(UserData? data) {
    return User(
      id: data?.id ?? '',
      email: data?.email ?? '',
      money: BigDecimal.tryParse(data?.money) ?? BigDecimal.zero,
      birthday: DateTimeUtils.tryParse(date: data?.birthday, format: FormatConstants.appServerResponse),
      avatar: _imageUrlDataMapper.mapToEntity(data?.avatar),
      photos: _imageUrlDataMapper.mapToListEntity(data?.photos),
      gender: _genderDataMapper.mapToEntity(data?.gender),
    );
  }
}
