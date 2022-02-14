import 'package:async_redux/async_redux.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/domain/core/entities/core/facility.dart';

class ListFacilitiesViewModel extends Vm {
  ListFacilitiesViewModel({
    required this.wait,
    this.facilities,
  }) : super(equals: <Object?>[wait, facilities]);

  final Wait wait;
  final List<Facility>? facilities;

  factory ListFacilitiesViewModel.fromStore(Store<AppState> store) {
    return ListFacilitiesViewModel(
      wait: store.state.wait!,
      facilities: store.state.staffState?.facilities,
    );
  }
}
