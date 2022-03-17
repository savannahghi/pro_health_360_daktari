import 'package:flutter/material.dart';
import 'package:mycarehubpro/domain/core/entities/profile/client_response.dart';
import 'package:mycarehubpro/presentation/core/app_bar/custom_app_bar.dart';
import 'package:mycarehubpro/presentation/search/widgets/client_search_widget.dart';

class SearchPageDetailView extends StatefulWidget {
  const SearchPageDetailView({
    required this.clientResponse,
    required this.cccNumber,
  });

  final ClientResponse clientResponse;
  final String cccNumber;

  @override
  State<SearchPageDetailView> createState() => _SearchPageDetailViewState();
}

class _SearchPageDetailViewState extends State<SearchPageDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.clientResponse.userName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: ClientSearchWidget(
          clientResponse: widget.clientResponse,
          cccNumber: widget.cccNumber,
        ),
      ),
    );
  }
}
