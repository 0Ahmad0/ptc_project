
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ptc_project/controller/home_controller.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/model/utils/sizer.dart';
import 'package:ptc_project/translations/locale_keys.g.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/style_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:ptc_project/view/widgets/custom_divider.dart';
import 'package:ptc_project/view/widgets/custom_textfiled.dart';
import 'package:ptc_project/view/widgets/learn_form.dart';
import 'package:ptc_project/view/widgets/multi_form_lan.dart';
import 'package:ptc_project/view/widgets/project_form.dart';
import 'package:ptc_project/view/widgets/skills_technical_form.dart';
import 'package:ptc_project/view/widgets/work_form.dart';
import '../../../model/utils/const.dart';
import '../../widgets/work_place_form.dart';
import '../search/search_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  CollectionReference nameRef = Firestore.instance.collection("name");
  final controllerName = TextEditingController();
  final HomeController homeController= HomeController();
  final controllerAge = TextEditingController();

  final controllerGender = TextEditingController();

  final controllerEmail = TextEditingController();

  final controllerPhone = TextEditingController();

  final controllerAddress = TextEditingController();

  final controllerMilitary = TextEditingController();

  final controllerMarital = TextEditingController();
  final controllerUrl = TextEditingController();

  final controllerPageView = PageController(
  );
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  int currentIndex = 0;

  double progresValue = .3;

  @override
  Widget build(BuildContext context) {
    HomeController.cvUser=HomeController.cvUserHome;
    controllerName.text=HomeController.cvUser.personalInformation.name;
    controllerGender.text=HomeController.cvUser.personalInformation.gender;
    controllerPhone.text=HomeController.cvUser.personalInformation.phone;
    controllerEmail.text=HomeController.cvUser.personalInformation.email;
    controllerAddress.text=HomeController.cvUser.personalInformation.address;
    if(HomeController.cvUser.personalInformation.age>0)
    controllerAge.text=HomeController.cvUser.personalInformation.age.toString();
    return Scaffold(
      floatingActionButton:  SizedBox(
        height: Sizer.getH(context)*0.125,
        child: CircleProgressBar(
          foregroundColor: ColorManager.success,
          backgroundColor: Colors.white,
          value: progresValue,
          child: FloatingActionButton(
            backgroundColor: ColorManager.primaryColor,
onPressed: ()async{
  
print('-------------------------------------------------------');
print(nameRef);
print('-------------------------------------------------------');
print(HomeController.cvUser.toJson());
print('-------------------------------------------------------');
CONSTANTSAPP.LOADIG(context);
var result= await homeController.createCvUser(context);
Get.back();
if(result['status']){
  HomeController.cvUserHome=CvUser.genCvUser();
  setState(() {
  });
}
print('-------------------------------------------------------');
},
//             onPressed: ()async{
//                _getSql();
// await controllerPageView.nextPage(duration: Duration(seconds: 1),
//     curve: Curves.easeInOut);
//             },
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
      drawer: buildDrawer(context),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: Platform.isWindows?AppPadding.p40:0.0
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
               BuildFirstPage(
                 gender: gender,
                 controllerName: controllerName,
                 controllerAge: controllerAge,
                 controllerAddress: controllerAddress,
                 controllerPhone: controllerPhone,
                 controllerEmail: controllerEmail,
                 controllerDriveLink: TextEditingController(
                   text: HomeController.cvUser.urlCv
                 ),
                 controllerMilitary: TextEditingController(
                   text: (HomeController.cvUser.personalInformation.militaryStatus)?'yes':'no'
                 ),
                 form: formKey1,
               ),
            BuildSecondPage(form: formKey2),
            BuildThirdPage(formKey: formKey3,),
                BuildFourthPage(formKey: formKey4)

              ],
            ),
          ),
          if(Platform.isWindows)
          Positioned(
              left: AppSize.s4,
              child: IconButton(onPressed: (){
                controllerPageView.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
              }, icon: Icon(Icons.arrow_back_ios))),
          if(Platform.isWindows)
            Positioned(
              right: AppSize.s4,
              child: IconButton(onPressed: (){
                controllerPageView.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
              }, icon: Icon(Icons.arrow_forward_ios))),
        ],
      ),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text("PTC ADMIN"),
            accountEmail: Text("ptc@gmail.com"),
            currentAccountPicture: CircleAvatar(),
          ),
          ListTile(
            onTap: () {
              HomeController.mapSearch.clear();
              Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => SearchView()))
                .then((value) => Navigator.pop(context));},
            leading: Icon(Icons.search),
            title: Text('Search'),
          )
        ],
      ),
    );
  }
  String gender  = "Male";

  List<Widget> languages = [];
}

class BuildFirstPage extends StatefulWidget {
  final GlobalKey<FormState> form;
  final TextEditingController controllerName
  ,controllerAge,controllerDriveLink,controllerAddress,controllerEmail,controllerPhone;
  String gender;
  final TextEditingController? controllerMilitary;

   BuildFirstPage({super.key, required this.form, required this.controllerName, required this.controllerAge, required this.gender, required this.controllerAddress, required this.controllerEmail, required this.controllerPhone, required this.controllerMilitary, required this.controllerDriveLink});
  @override
  State<BuildFirstPage> createState() => _BuildFirstPageState();
}

class _BuildFirstPageState extends State<BuildFirstPage> {
  List<UserLearn> learns = [
    UserLearn(name: "name")
  ];
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: widget.form,
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
        children: [

          CustomTextFiled(
              controller: widget.controllerName,
              validator: (String? val) {
                if (val!.trim().isEmpty) {
                  return "this filed is required";
                } else {
                  return null;
                }
              },
              onChange:(val)=>HomeController.cvUser.personalInformation.name=val,
              prefixIcon: Icons.person,
              hintText: tr(LocaleKeys.your_name)),
          const SizedBox(
            height: AppSize.s20,
          ),
          CustomTextFiled(
              controller: widget.controllerAge,
              textInputType: TextInputType.number,
              validator: (String? val) {
                if (val!.trim().isEmpty) {
                  return "this filed is required";
                } else {
                  return null;
                }
              },
              onChange: (val)=>HomeController.cvUser.personalInformation.age=int.parse(val),
              // onTap:(val)=>,
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
                        title: Text("Male"),
                        value: "Male",
                        groupValue: widget.gender,
                        onChanged: (val) {
                          widget.gender = val.toString();
                          HomeController.cvUser.personalInformation.gender=widget.gender;
                          setState(() {

                          });
                        }),
                    RadioListTile(
                      title: Text("Female"),
                      value: "Female",
                      groupValue: widget.gender,
                      onChanged: (val) {
                        widget.gender = val.toString();
                        HomeController.cvUser.personalInformation.gender=widget.gender;
                        setState(() {

                        });
                      },),
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
              controller: widget.controllerAddress,
              validator: (String? val) {
                if (val!.trim().isEmpty) {
                  return "this filed is required";
                } else {
                  return null;
                }
              },
              onChange: (val)=>HomeController.cvUser.personalInformation.address=val,
              prefixIcon: FontAwesomeIcons.addressCard,
              hintText: tr(LocaleKeys.your_address)),
          const SizedBox(
            height: AppSize.s20,
          ),
          CustomTextFiled(
              controller: widget.controllerEmail,
              validator: (String? val) {
                if (val!.trim().isEmpty) {
                  return "this filed is required";
                } else {
                  return null;
                }
              },
              onChange: (val)=>HomeController.cvUser.personalInformation.email=val,
              prefixIcon: Icons.email,
              hintText: tr(LocaleKeys.your_email)),
          const SizedBox(
            height: AppSize.s20,
          ),
          CustomTextFiled(
              controller: widget.controllerPhone,
              validator: (String? val) {
                if (val!.trim().isEmpty) {
                  return "this filed is required";
                } else {
                  return null;
                }
              },
              textInputType: TextInputType.phone,
              onChange: (val)=>HomeController.cvUser.personalInformation.phone=val,
              prefixIcon: Icons.phone_android,
              hintText: tr(LocaleKeys.your_phone)),
          const SizedBox(
            height: AppSize.s20,
          ),
          CustomTextFiled(
              controller: widget.controllerDriveLink,
              validator: (String? val) {
                if (val!.trim().isEmpty || val.isURL) {
                  return "this filed is required";
                } else {
                  return null;
                }
              },
              textInputType: TextInputType.url,
              onChange: (val)=>HomeController.cvUser.personalInformation.phone=val,
              prefixIcon: Icons.link,
              hintText: "Your Link Cv"),

          const SizedBox(
            height: AppSize.s20,
          ),
          DropdownButtonFormField<String>(
            value: widget.controllerMilitary!.text,
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
              (val.toString().contains('yes'))?
              HomeController.cvUser.personalInformation.militaryStatus=true
                  :HomeController.cvUser.personalInformation.militaryStatus=false;

            },
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          PTCDvider(),
          const SizedBox(
            height: AppSize.s20,
          ),
          for(var learn = 0 ; learn < HomeController.cvUser.learns.listLearn.length ; learn++)
            LearnForm(
              index: learn+1,
              userLearn: learns[learn],
              onDelete: (){
                setState(() {
                  HomeController.cvUser.learns.listLearn.removeAt(learn);
                 // learns.removeAt(learn);
                });
              },
              onAddForm: (){
                setState(() {
                  HomeController.cvUser.learns.listLearn.add(Learn.genCourse());
                  learns.add(UserLearn(name: "name"));
                });
              },
            )
        ],
      ),
    );
  }
}
/**/
class BuildSecondPage extends StatefulWidget {
  final GlobalKey<FormState> form;
  const BuildSecondPage({Key? key, required this.form}) : super(key: key);

  @override
  State<BuildSecondPage> createState() => _BuildSecondPageState();
}

class _BuildSecondPageState extends State<BuildSecondPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.form,
      child: MultiFormLan(),
    );
  }
}

/**/
class BuildThirdPage extends StatefulWidget {
   BuildThirdPage({super.key, required this.formKey});
  final GlobalKey formKey;

  @override
  State<BuildThirdPage> createState() => _BuildThirdPageState();
}

class _BuildThirdPageState extends State<BuildThirdPage> {
List<UserPlaceWork> usersWorkPlace = [
  UserPlaceWork(name: "name", company: "company")
];


  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
         for(var work = 0   ; work <   HomeController.cvUser.workPlaces.listWorkPlace.length ; work++)
           WorkPlaceForm(
             index: work +1 ,
             userWork: usersWorkPlace[0],
             onAddForm: (){
               setState(() {
                 usersWorkPlace.add(UserPlaceWork(name: "name", company: "company"));
                 HomeController.cvUser.workPlaces.listWorkPlace.add(WorkPlace.genCourse());
               });
             },
             onDelete: (){
               setState(() {
                // usersWorkPlace.removeAt(work);
                 HomeController.cvUser.workPlaces.listWorkPlace.removeAt(work);
               });
             },
           )
        ],
      ),
    );
  }
}

class BuildFourthPage extends StatefulWidget {
  final GlobalKey formKey;
  const BuildFourthPage({Key? key, required this.formKey}) : super(key: key);

  @override
  State<BuildFourthPage> createState() => _BuildFourthPageState();
}

class _BuildFourthPageState extends State<BuildFourthPage> {
  List<UserProject> usersProject = [
    UserProject(name: "name",)
  ];
  List<UserTechnicalSkills> userThechnicalSkills = [
    UserTechnicalSkills(name: "name",)
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ListView(
        shrinkWrap: true,
        children: [
          for(var project = 0 ; project < HomeController.cvUser.projects.listProject.length ; project++)
            ProjectForm(
              index: project +1 ,
              userProject: usersProject[0],
              onAddForm: (){
                setState(() {
                  usersProject.add(UserProject(name: "name"));
                  HomeController.cvUser.projects.listProject.add(Project.genCourse());
                });
              },
              onDelete: (){
                setState(() {
                  HomeController.cvUser.projects.listProject.removeAt(project);
                  // usersProject.removeAt(project);
                });
              },
            ),
          PTCDvider(),
          for(var techSkills = 0 ; techSkills < HomeController.cvUser.technicalSkills.listTechnicalSkill.length ; techSkills++)
            SkillsTechnicalForm(
              index: techSkills +1 ,
              userTechnicalSkills: userThechnicalSkills[0],
              onAddForm: (){
                setState(() {
                  userThechnicalSkills.add(UserTechnicalSkills(name: "name"));
                  HomeController.cvUser.technicalSkills.listTechnicalSkill.add(TechnicalSkill.genCourse());
                });
              },
              onDelete: (){
                setState(() {
                  HomeController.cvUser.technicalSkills.listTechnicalSkill.removeAt(techSkills);
                  // userThechnicalSkills.removeAt(techSkills);
                });
              },
            ),

        ],
      ),
    );
  }
}
