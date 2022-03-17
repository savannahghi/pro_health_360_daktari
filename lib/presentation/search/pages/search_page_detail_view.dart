import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_search_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/staff_search_widget.dart';

class SearchPageDetailView extends StatefulWidget {
  const SearchPageDetailView({
    required this.clientResponse,
    required this.idNumber,
    required this.isClient,
  });

  final SearchUserResponse clientResponse;
  final String idNumber;
  final bool isClient;

  @override
  State<SearchPageDetailView> createState() => _SearchPageDetailViewState();
}

class _SearchPageDetailViewState extends State<SearchPageDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.clientResponse.user?.userName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: widget.isClient
            ? ClientSearchWidget(
                clientResponse: widget.clientResponse,
                cccNumber: widget.idNumber,
              )
            : StaffSearchWidget(
                clientResponse: widget.clientResponse,
                staffNumber: widget.idNumber,
              ),
      ),
    );
  }
}
