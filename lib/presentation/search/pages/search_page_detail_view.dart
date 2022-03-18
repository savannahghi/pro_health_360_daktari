import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/entities/search_user/search_user_response.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_search_widget.dart';
import 'package:mycarehubpro/presentation/search/widgets/staff_search_widget.dart';

class SearchPageDetailView extends StatefulWidget {
  const SearchPageDetailView({
    required this.searchUserResponse,
    required this.isClient,
  });

  final SearchUserResponse searchUserResponse;
  final bool isClient;

  @override
  State<SearchPageDetailView> createState() => _SearchPageDetailViewState();
}

class _SearchPageDetailViewState extends State<SearchPageDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.searchUserResponse.user?.userName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: widget.isClient
            ? ClientSearchWidget(searchUserResponse: widget.searchUserResponse)
            : StaffSearchWidget(searchUserResponse: widget.searchUserResponse),
      ),
    );
  }
}
