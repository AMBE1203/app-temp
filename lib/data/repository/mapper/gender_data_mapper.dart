import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import 'base/base_data_mapper.dart';

@Injectable()
class GenderDataMapper extends BaseDataMapper<int, Gender> with DataMapperMixin {
  @override
  Gender mapToEntity(int? data) {
    return Gender.values.firstOrNullWhere((element) => element.serverValue == data) ?? Gender.unknown;
  }

  @override
  int mapToData(Gender entity) {
    return entity.serverValue;
  }
}
