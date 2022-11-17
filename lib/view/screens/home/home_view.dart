import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ptc_project/controller/home_controller.dart';
import 'package:ptc_project/model/models.dart';
import 'package:ptc_project/model/utils/sizer.dart';
import 'package:ptc_project/model/utils/sql.dart';
import 'package:ptc_project/translations/locale_keys.g.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/style_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';
import 'package:ptc_project/view/widgets/custom_divider.dart';
import 'package:ptc_project/view/widgets/custom_textfiled.dart';
import 'package:ptc_project/view/widgets/multi_form_lan.dart';
import 'package:ptc_project/view/widgets/project_form.dart';
import 'package:ptc_project/view/widgets/skills_technical_form.dart';
import 'package:ptc_project/view/widgets/work_form.dart';
import '../../widgets/work_place_form.dart';
import '../search/search_view.dart';
import 'package:easy_localization/easy_localization.dart';

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

  final controllerPageView = PageController(
  );
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  int currentIndex = 0;

  double progresValue = .3;
  var db = new MySQL();
  var mail = '';
  void _getSql()  {
    db.getConnection().then((conn){
      //String sql='select * from ptc.temp';
     // String sql='CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)';
    //  String sql='INSERT INTO `ptc`.`users` ( `name`, `email`, `age`) VALUES ( \'Bob\', \'bob@bob.com\', \'25\')';
      String sql='SELECT * FROM ptc.users';

      //print('co : ${conn}');
      print(sql);
      conn.query(sql).then((results){
        print(results.length);
        for (var row in results){
          print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
        }
      });
    });
  }
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
  
print('-------------------------------------------------------');
print(nameRef);
print('-------------------------------------------------------');
print(HomeController.cvUser.toJson());
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
            BuildThirdPage(formKey: formKey3,),
                BuildFourthPage(formKey: formKey4)

              ],
            ),
          ),
          Positioned(
              left: AppSize.s4,
              child: IconButton(onPressed: (){
                controllerPageView.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeInOut);
              }, icon: Icon(Icons.arrow_back_ios))),
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
            onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => SearchView()))
                .then((value) => Navigator.pop(context)),
            leading: Icon(Icons.search),
            title: Text('Search'),
          )
        ],
      ),
    );
  }
  bool gender  = true;
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
                  onChange:(val)=>HomeController.cvUser.personalInformation.name=val,
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
                            title: Text("Female"),
                            value: gender,
                            groupValue: [true,false],
                            onChanged: (val) {
                              gender = !gender;
                                  HomeController.cvUser.personalInformation.gender='Female';
                              setState(() {

                              });
                            },),
                        RadioListTile(
                            title: Text("Male"),
                            value: !gender,
                            groupValue: [true,false],
                            onChanged: (val) {
                              gender = !gender;
                              HomeController.cvUser.personalInformation.gender='Male';
                              setState(() {

                              });
                            })
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
                  onChange: (val)=>HomeController.cvUser.personalInformation.address=val,
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
                  onChange: (val)=>HomeController.cvUser.personalInformation.email=val,
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
                  onChange: (val)=>HomeController.cvUser.personalInformation.phone=val,
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
                   //   HomeController.cvUser.personalInformation.militaryStatus=val;
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
        children: [
         for(var work = 0 ; work <   HomeController.cvUser.workPlaces.listWorkPlace.length ; work++)
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
        children: [
          for(var project = 0 ; project < usersProject.length ; project++)
            ProjectForm(
              index: project +1 ,
              userProject: usersProject[project],
              onAddForm: (){
                setState(() {
                  usersProject.add(UserProject(name: "name"));
                });
              },
              onDelete: (){
                setState(() {
                  usersProject.removeAt(project);
                });
              },
            ),
          PTCDvider(),
          for(var techSkills = 0 ; techSkills < userThechnicalSkills.length ; techSkills++)
            SkillsTechnicalForm(
              index: techSkills +1 ,
              userTechnicalSkills: userThechnicalSkills[techSkills],
              onAddForm: (){
                setState(() {
                  userThechnicalSkills.add(UserTechnicalSkills(name: "name"));
                });
              },
              onDelete: (){
                setState(() {
                  userThechnicalSkills.removeAt(techSkills);
                });
              },
            ),

        ],
      ),
    );
  }
}
