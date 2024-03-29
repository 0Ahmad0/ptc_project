
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firedart/firedart.dart' as firedart;
import 'package:firedart/firestore/firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
//import 'package:multi_select_search/multi_select_search.dart';
import 'package:ptc_project/controller/home_controller.dart';
import 'package:ptc_project/controller/json_controller.dart';
import 'package:ptc_project/controller/utils/firebase.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/model/utils/const.dart';

import '../../../model/utils/sizer.dart';
import '../../resourse/color_manager.dart';
import '../../resourse/font_manager.dart';
import '../../resourse/style_manager.dart';
import '../../resourse/values_manager.dart';
import '../../widgets/custom_textfiled2.dart';
import '../information/information_page.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_, index) => BuildCVItem(),
    );
  }
}

class BuildCVItem extends StatelessWidget {
//  final String? name;
  final CvUser? cvUser;
  String item='';
  BuildCVItem({super.key, this.cvUser});

  @override
  Widget build(BuildContext context) {
    for(TechnicalSkill technicalSkill in cvUser!.technicalSkills.listTechnicalSkill){
      if(technicalSkill.skillsName!='')
      item+='${technicalSkill.skillsName}: ${technicalSkill.skillsLevel}, ';
    }
    return InkWell(
      onTap: (){
        HomeController.cvUserView=cvUser!;
        HomeController.cvUser=CvUser.fromJson(HomeController.cvUserView.toJson());
        Get.to(() => InformationPage());},
      child: Container(
        margin: const EdgeInsets.all(AppMargin.m10),
        padding: const EdgeInsets.all(AppPadding.p12),
        width: double.infinity,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s4),
            boxShadow: [
              BoxShadow(
                  color: ColorManager.lightGray.withOpacity(.2),
                  blurRadius: AppSize.s8,
                  offset: Offset(0, AppSize.s4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.file_present_sharp),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              children: [
                Flexible(child: Text("Name : ")),
                Flexible(
                  child: Text(
                    cvUser!.personalInformation.name,
                    //name!,
                    style: getBoldStyle(
                        fontSize: Sizer.getH(context) / 38,
                        color: ColorManager.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
              Text(
              item
              ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Last Learn : "
                    "${HomeController().findLastEducation(cvUser!)}")),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: AppMargin.m12),
                  width: .5,
                  height: AppSize.s12,
                  color: ColorManager.primaryColor,
                ),
                Expanded(child: Text("Last WorkPlace: ${HomeController().findLastWorkPlace(cvUser!)}")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchView extends StatefulWidget {
   SearchView({Key? key}) : super(key: key);
   static var setStateSearch;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<String> itemSearch=['All','PersonalInformation','Languages','Skills',
    'Courses',
    'WorkPlaces',
    'Projects',
    'TechnicalSkills',
    'Works',
    'Education'];
  List<DataSearch> selectedItems =[];// [DataSearch(1, "name")];
  final searchController = TextEditingController();
  late JsonController jsonController;
  @override
  Widget build(BuildContext context) {
     HomeController.cvUsersSearch = CvUsers();
     jsonController=JsonController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
          ///Export Cvs
          // actions: [IconButton(onPressed: () {
          //   final textController=TextEditingController(text: jsonController.pathCVsExport);
          //   AwesomeDialog(
          //     context: context,
          //     dialogType: DialogType.info,
          //     animType: AnimType.rightSlide,
          //     title: "Export Cvs",
          //     body: CustomTextFiled2(
          //         maxLines: 12,
          //         controller: textController,
          //         validator: (String? val) {
          //           if (val!.trim().isEmpty) {
          //             return "this filed is required";
          //           } else {
          //             return null;
          //           }
          //         },
          //         readOnly: true,
          //
          //         onChange: (val){},
          //         prefixIcon: Icons.link,
          //         hintText: tr("link")),
          //     desc: "AppStrings",
          //      btnCancelOnPress: () {},
          //     btnOkOnPress: () async {
          //       jsonController.exportCvs(context, cvUsers: HomeController.cvUsersSearch);
          //     },
          //   )..show();
          // }, icon: Icon(Icons.archive_outlined),
          //
          // ),
          //   SizedBox(width: AppSize.s20,)]
        // actions: [
        //   StatefulBuilder(builder: (_,setState1){
        //     SearchView.setStateSearch=setState1;
        //     return Visibility(
        //       visible: HomeController.cvUsersSearch.listCvUser.length>0,
        //         child: Center(child: Text('${HomeController.cvUsersSearch.listCvUser.length}')))
        //     ;},),
        //   const SizedBox(width: 10,)
        // ],
      ),
      body: Column(
        children: [
          buildContainerSearch(context),
          Expanded(child:
          StatefulBuilder(builder: (_, setStateSearch) {
            HomeController.setStateSearch=setStateSearch;
            return FutureBuilder(
              //prints the messages to the screen0
                future: HomeController().fetchCvUsers(context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return
                      // HomeController.cvUsers.listCvUser.length>0?
                      // bodyListSearchCv()
                      // :
                      CONSTANTSAPP.SHOWLOADINGINDECATOR();
                    //Const.CIRCLE(context);
                  }
                  else if (snapshot.connectionState ==
                      ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                       CONSTANTSAPP.SHOWLOADINGINDECATOR();
                       HomeController.mapSearch=HomeController().convertToMapSearch(selectedItems, itemSearch);
                       HomeController.cvUsersSearch=HomeController().search(HomeController.cvUsers);
                       print(HomeController.cvUsersSearch.listCvUser.length);
                       return bodyListSearchCv();
                      //   });

                      /// }));
                    } else {
                      return const Text('Empty data');
                    }
                  }
                  else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                });
          })

          )
        ],
      ),
    );
  }
  String categorySearch = 'All';
  int categorySearchId = 0;
  Container buildContainerSearch(BuildContext context) {
    return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorManager.primaryColor,
                width: .3
              )
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p4),
            child: Wrap(
              children: [
                for (var i = 0; i < selectedItems.length; i++)
                  Container(
                    margin: Platform.isAndroid
                        ?EdgeInsets.symmetric(horizontal: AppMargin.m4,vertical: 1)
                        :EdgeInsets.all(AppMargin.m8),
                    child: Chip(
                      label: Text('${itemSearch[selectedItems[i].id]}: '+selectedItems[i].name),
                      onDeleted: () {
                        setState(() {
                          selectedItems.removeAt(i);
                        });
                      },
                      deleteIconColor: ColorManager.error,

                    ),
                  ),
               Row(
                 children: [
                   Expanded(
                     child: DropdownButtonFormField(
                       style: TextStyle(
                         fontSize: 14,
                         color: ColorManager.secondaryColor
                       ),
                       value: categorySearch,
                       decoration: InputDecoration(
                           hintText: 'Search By'
                       ),
                       items: itemSearch.map((e) => DropdownMenuItem(
                         child: Text('$e'),
                         value: e,
                       )).toList(),
                       onChanged: (String? value) {
                         categorySearch = value!;
                         categorySearchId = itemSearch.indexOf(value);
                       },
                     ),
                   ),
                   Expanded(
                     child: TextFormField(
                       onFieldSubmitted: (val){

                       },
                       controller: searchController,
                       decoration: InputDecoration(
                         suffixIcon: IconButton(
                           onPressed: (){
                             setState(() {
                               if(searchController.text.trim().isNotEmpty){
                                 selectedItems.add(
                                     DataSearch(categorySearchId, searchController.text)
                                 );
                                 searchController.clear();
                               }
                             });
                           },
                           icon: Icon(Icons.search),
                         ),
                         hintText: "Search here",
                         enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(AppSize.s8),
                             borderSide: BorderSide(
                                 color: Colors.transparent
                             )
                         ),
                         focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(AppSize.s8),
                             borderSide: BorderSide(
                                 color: Colors.transparent
                             )
                         ),
                         errorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(AppSize.s8),
                             borderSide: BorderSide(
                                 color: Colors.transparent
                             )),
                         focusedErrorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(AppSize.s8),
                             borderSide: BorderSide(
                                 color: Colors.transparent
                             )),
                       ),
                     ),
                   )
                 ],
               )
              ],
            ),
          ),
        );
  }
  Widget bodyListSearchCv(){
    return  ListView.builder(
      itemCount: HomeController.cvUsersSearch.listCvUser.length,//selectedItems.length,
      itemBuilder: (_,index)=>BuildCVItem(
        cvUser: HomeController.cvUsersSearch.listCvUser[index],
      ),
    );
  }
}

class DataSearch {
  final int id;
  final String name;

  DataSearch(
    this.id,
    this.name,
  );

  DataSearch.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
