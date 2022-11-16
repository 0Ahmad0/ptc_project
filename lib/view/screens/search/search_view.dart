import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ptc_project/model/utils/sizer.dart';
import 'package:ptc_project/view/resourse/color_manager.dart';
import 'package:ptc_project/view/resourse/style_manager.dart';
import 'package:ptc_project/view/resourse/values_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.white,
            prefixIcon: IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
            ),

            hintText: "Search CVs",

          ),
        ),
      ),
      body: SearchBody(),
    );
  }
}

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_,index)=>BuildCVItem(),
    );
  }
}

class BuildCVItem extends StatelessWidget {
  const BuildCVItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      padding: const EdgeInsets.all(AppPadding.p12),
      height: Sizer.getH(context) / 6,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s4),
        boxShadow: [
          BoxShadow(
            color: ColorManager.lightGray.withOpacity(.2),
            blurRadius: AppSize.s8,
            offset: Offset(
              0 , AppSize.s4
            )
          )
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.file_present_sharp),
          const SizedBox(height: AppSize.s10,),
          Row(
            children: [
              Text("Name : "),
              Text("Hiba Hashem ❤️",style: getBoldStyle(
                  fontSize: Sizer.getH(context) / 38,
                  color: ColorManager.primaryColor),),
            ],
          ),
          const SizedBox(height: AppSize.s10,),
          Text("Hiba Hashem ❤️"),

        ],
      ),
    );
  }
}
