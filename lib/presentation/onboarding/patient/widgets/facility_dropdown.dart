// Flutter imports:

import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/application/redux/actions/flags/app_flags.dart';
import 'package:healthcloud/application/redux/actions/register_client/fetch_facilites_action.dart';
import 'package:healthcloud/application/redux/states/app_state.dart';
import 'package:healthcloud/application/redux/view_models/register_client/fetch_facilities_view_model.dart';
import 'package:healthcloud/domain/core/entities/core/facility.dart';
import 'package:healthcloud/presentation/surveys/widgets/selection_option_field.dart';
import 'package:shared_ui_components/platform_loader.dart';

class FacilityDropdown extends StatefulWidget {
  const FacilityDropdown({
    required this.label,
    required this.stream,
    required this.dropdownInputKey,
    this.onChanged,
    this.validator,
  });

  final String label;
  final Stream<String> stream;
  final Key dropdownInputKey;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;

  @override
  State<FacilityDropdown> createState() => _FacilityDropdownState();
}

class _FacilityDropdownState extends State<FacilityDropdown> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        FetchFacilitiesAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.greyTextColor,
            ),
          ),
        ),
        const SizedBox(height: 10),
        StreamBuilder<String>(
          stream: widget.stream,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            final String? data = snapshot.data;
            return StoreConnector<AppState, ListFacilitiesViewModel>(
              converter: (Store<AppState> store) =>
                  ListFacilitiesViewModel.fromStore(store),
              builder: (BuildContext context, ListFacilitiesViewModel vm) {
                if (vm.wait.isWaitingFor(fetchFacilitiesFlag)) {
                  return const SILPlatformLoader();
                }

                return SelectOptionField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0x00eeeeee)),
                    ),
                  ),
                  dropDownInputKey: widget.dropdownInputKey,
                  value: data ?? 'Kanairo',
                  options: vm.facilities!
                      .map<String>(
                        (Facility facility) => facility.name ?? UNKNOWN,
                      )
                      .toList(),
                  onChanged: widget.onChanged,
                  validator: widget.validator,
                );
              },
            );
          },
        ),
      ],
    );
  }
}
