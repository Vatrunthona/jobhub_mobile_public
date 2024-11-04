import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/constants/app_constants.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/ui/search/widgets/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrange,
        iconTheme: IconThemeData(color: Color(kLight.value)),
        title: CustomField(
          hintText: 'Search For a Job',
          controller: _searchController,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {

              });
            },
            child: Icon(
              AntDesign.search1,
              color: Color(kLight.value),
            ),
          ),
        ),
        elevation: 1,
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/optimized_search.png"),
              ReusableText(text: "Start Search For Jobs", style: appstyle(24, kDark, FontWeight.bold)),
            ],
          )
        ),
      ),
    );
  }
}
