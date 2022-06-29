import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';

class ListFacilitiesViewModel extends Vm {
  ListFacilitiesViewModel({
    required this.wait,
    this.facilities,
    required this.selectedFacility,
  }) : super(equals: <Object?>[wait, facilities, selectedFacility]);

  final Wait wait;
  final List<Facility>? facilities;
  final Facility selectedFacility;

  factory ListFacilitiesViewModel.fromStore(Store<AppState> store) {
    return ListFacilitiesViewModel(
      wait: store.state.wait!,
      facilities: store.state.staffState?.facilities,
      selectedFacility: store.state.miscState?.selectedFacility ?? Facility.initial(),
    );
  }
}
