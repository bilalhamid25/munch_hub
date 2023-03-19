import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:munch_hub/screens/restaurant_detail/restaurant_detail_view.dart';
import 'package:munch_hub/screens/search_view/search_viewmodel.dart';

class SearchView extends StatelessWidget {
  final SearchViewModel searchViewModel = Get.put(SearchViewModel());

  SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 10, 0),
              child: Row(
                children: [
                  searchTextField(),
                  filterButton(),
                ],
              ),
            ),
            searchListView(),
          ],
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(0.0, 0.0), //(x,y)
              blurRadius: 10,
              spreadRadius: 0.5,
            ),
          ],
        ),
        child: TextFormField(
          onChanged: (value){
            searchViewModel.onTextChange(value);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15, 12, 6.5, 12),
            prefixIcon: Icon(
              Icons.search,
              size: 22,
              color: Colors.grey,
            ),
            suffixIcon: Icon(Icons.close),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            hintText: 'Search...',
            hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
            isDense: true,
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget filterButton() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color(0xffE23744),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const FaIcon(
          FontAwesomeIcons.filter,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }

  Widget searchListView() {
    return Obx(
      () => Expanded(
        child: ListView.separated(
          itemCount: searchViewModel.filteredRestaurantsList.length,
          itemBuilder: (context, int index) {
            return searchListViewItem(index);
          },
          separatorBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                height: 0,
                thickness: 0.5,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget searchListViewItem(int index) {
    return InkWell(
      onTap: () {
        Get.off(() => RestaurantDetailView(),
            arguments: {"id": searchViewModel.filteredRestaurantsList[index].id});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              size: 20,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Text(
                searchViewModel.filteredRestaurantsList[index].companyName ??
                    "",
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff031F4B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
