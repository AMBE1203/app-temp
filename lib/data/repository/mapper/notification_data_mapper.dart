import 'package:injectable/injectable.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

@Injectable()
class NotificationDataMapper extends BaseDataMapper<NotificationData, AppNotification> {
  @override
  AppNotification mapToEntity(NotificationData? data) {
    return AppNotification(
      notificationId: data?.notificationId ?? '',
      image: data?.image ?? '',
      title: data?.title ?? '',
      message: data?.message ?? '',
    );
  }
}
