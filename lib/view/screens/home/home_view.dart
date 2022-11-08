import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ptc_project/model/utils/sizer.dart';
import 'package:ptc_project/model/utils/sql.dart';
import 'package:ptc_project/translations/locale_keys.g.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/style_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:ptc_project/view/widgets/custom_textfiled.dart';
import 'package:ptc_project/view/widgets/multi_form_lan.dart';
import '../search/search_view.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controllerName = TextEditingController();

  final controllerAge = TextEditingController();

  final controllerGender = TextEditingController();

  final controllerEmail = TextEditingController();

  final controllerPhone = TextEditingController();

  final controllerAddress = TextEditingController();

  final controllerMilitary = TextEditingController();

  final controllerMarital = TextEditingController();

  final controllerPageView = PageController(
  );
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  int currentIndex = 0;

  double progresValue = .3;
  var db = new MySQL();
  var mail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  SizedBox(
        height: Sizer.getH(context)*0.175,
        child: CircleProgressBar(
          foregroundColor: ColorManager.success,
          backgroundColor: Colors.white,
          value: progresValue,
          child: FloatingActionButton(
            backgroundColor: ColorManager.primaryColor,
            onPressed: ()async{
await controllerPageView.nextPage(duration: Duration(seconds: 1),
    curve: Curves.easeInOut);
            },
            child: Text(
              currentIndex == 2?"+":"${currentIndex+1}",
              style: getRegularStyle(
                  color: ColorManager.white,
                fontSize: Sizer.getH(context) / 24
              ),
            ),
          ),
        ),
      ),

      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("PTC ADMIN"),
              accountEmail: Text("ptc@gmail.com"),
              currentAccountPicture: CircleAvatar(),
            ),
            ListTile(
              onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => SearchView()))
                  .then((value) => Navigator.pop(context)),
              leading: Icon(Icons.search),
              title: Text('Search'),
            )
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p40
            ),
            child: PageView(
              onPageChanged: (index){
                currentIndex = index;
                setState(() {});
                if(currentIndex!=2){
                  progresValue+=.3;
                }else{
                  progresValue=1.0;
                }
              },
              controller: controllerPageView,
              scrollDirection: Axis.horizontal,
              children: [
            buildFirstPage(),

            buildSecondPage(),
            buildFirstPage(),
              ],
            ),
          ),
          Positioned(
              left: AppSize.s4,
              child: IconButton(onPressed: (){
                controllerPageView.previousPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
              }, icon: Icon(Icons.arrow_back_ios))),
          Positioned(
              right: AppSize.s4,
              child: IconButton(onPressed: (){
                controllerPageView.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
              }, icon: Icon(Icons.arrow_forward_ios))),
        ],
      ),
    );
  }

  Widget buildFirstPage() {
    return Form(
      key: formKey1,
      child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              CustomTextFiled(
                  controller: controllerName,
                  validator: (String? val) {
                    if (val!.trim().isEmpty) {
                      return "this filed is required";
                    } else {
                      return null;
                    }
                  },
                  onChange: null,
                  prefixIcon: Icons.person,
                  hintText: tr(LocaleKeys.your_name)),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextFiled(
                  controller: controllerAge,
                  textInputType: TextInputType.number,
                  validator: (String? val) {
                    if (val!.trim().isEmpty) {
                      return "this filed is required";
                    } else {
                      return null;
                    }
                  },
                  onChange: null,
                  prefixIcon: Icons.person,
                  hintText: tr(LocaleKeys.your_age)),
              const SizedBox(
                height: AppSize.s10,
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: AppMargin.m10
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s8),
                        border: Border.all(color: ColorManager.primaryColor)),
                    child: Column(
                      children: [
                        RadioListTile(
                            title: Text("Female"),
                            value: true,
                            groupValue: [false, true],
                            onChanged: (val) {}),
                        RadioListTile(
                            title: Text("Male"),
                            value: true,
                            groupValue: [false, true],
                            onChanged: (val) {})
                      ],
                    ),
                  ),
                  Positioned(
                    left: AppSize.s30,
                    top: AppSize.s4,
                    child: Container(
                      color: ColorManager.white,
                      child: Text(tr(LocaleKeys.your_gender),style: getBoldStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s10
                      ),),
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextFiled(
                  controller: controllerAddress,
                  validator: (String? val) {
                    if (val!.trim().isEmpty) {
                      return "this filed is required";
                    } else {
                      return null;
                    }
                  },
                  onChange: null,
                  prefixIcon: FontAwesomeIcons.addressCard,
                  hintText: tr(LocaleKeys.your_address)),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextFiled(
                  controller: controllerEmail,
                  validator: (String? val) {
                    if (val!.trim().isEmpty) {
                      return "this filed is required";
                    } else {
                      return null;
                    }
                  },
                  onChange: null,
                  prefixIcon: Icons.email,
                  hintText: tr(LocaleKeys.your_email)),
              const SizedBox(
                height: AppSize.s20,
              ),
              CustomTextFiled(
                  controller: controllerPhone,
                  validator: (String? val) {
                    if (val!.trim().isEmpty) {
                      return "this filed is required";
                    } else {
                      return null;
                    }
                  },
                  textInputType: TextInputType.phone,
                  onChange: null,
                  prefixIcon: Icons.phone_android,
                  hintText: tr(LocaleKeys.your_phone)),
              const SizedBox(
                height: AppSize.s20,
              ),
              DropdownButtonFormField<String>(
                validator: (String? val) {
                  if (val!.trim().isEmpty) {
                    return "this filed is required";
                  } else {
                    return null;
                  }
                },
                items: ['yes', 'no']
                    .map((e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                ))
                    .toList(),
                decoration: InputDecoration(
                    hintText: tr(LocaleKeys.your_military_status),
                    prefixIcon: Icon(FontAwesomeIcons.personMilitaryRifle)
                ),
                onChanged: (val) {
                  controllerMilitary.text = val.toString();
                },
              )
            ],
          ),
    );
  }
  List<Widget> languages = [];
  Widget buildSecondPage() {
    return Form(
      key: formKey2,
      child: MultiFormLan(),
    );
  }
}
