// Flutter imports:
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';

// Project imports:
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_asset_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/no_results_found.dart';
import 'package:mycarehubpro/presentation/engagement/home/widgets/patient_search_results.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              smallVerticalSizedBox,
              Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: CustomTextField(
                  hintText: searchUser,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: SvgPicture.asset(
                      magnifierToolIconSvg,
                    ),
                  ),
                  borderColor: Colors.white,
                  onChanged: (String val) {
                    setState(() {
                      query = val;
                    });
                  },
                ),
              ),
              if (query.isEmpty)
                const NoResultsFound()
              else
                const PatientSearchResults(
                  items: patientSearchResults,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
