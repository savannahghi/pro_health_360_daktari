// Flutter imports:

import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/view_models/app_entry_point_view_model.dart';
import 'package:mycarehubpro/presentation/core/mycarehub_pro_app.dart';

class AppEntryPointViewModelFactory
    extends VmFactory<AppState, MyCareHubProApp> {
  @override
  AppEntryPointViewModel fromStore() {
    return AppEntryPointViewModel(
      idToken: state.credentials?.idToken,
      userId: state.staffState?.user?.userId,
    );
  }
}
