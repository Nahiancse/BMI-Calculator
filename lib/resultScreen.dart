import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'bmiModel.dart';

class Result extends StatelessWidget {
 final BmiModel bmiModel;
 Result(this.bmiModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
                
                height: 160,width: 200,
                child: bmiModel.isNormal! ? SvgPicture.asset('assets/images/happyH.svg',fit: BoxFit.contain,):SvgPicture.asset('assets/images/sadH.svg',fit: BoxFit.contain,),
              ),

              SizedBox(height: 8,),
            Text('Your BMI is ${bmiModel.bmi?.round()}',style: TextStyle(color: Colors.red[600],fontSize: 30,fontWeight: FontWeight.w700),),
            SizedBox(height: 8,),
            Text('${bmiModel.comments}',style: TextStyle(color: Colors.grey[700],fontSize: 26,fontWeight: FontWeight.w700),),
             SizedBox(height: 8,),
             bmiModel.isNormal! ?
            Text('Hurra!! Your BMI is Normal',style: TextStyle(color: Colors.red[500],fontSize: 26,fontWeight: FontWeight.w700),)
            :Text('Sad!! Your BMI is not Normal',style: TextStyle(color: Colors.red[500],fontSize: 22,fontWeight: FontWeight.w700),),
SizedBox(height: 10,),
             Container(
                color: Colors.red,
                width: double.infinity,
                padding: EdgeInsets.only(right: 16,left: 16),
                child: TextButton.icon(
                  onPressed: (){
                   Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.arrow_back,color: Colors.white,), 
                  label: Text('Calculate Again',style: TextStyle(color: Colors.white),),
                  ),
              )
          ],
        ),
      ),
      
    );
  }
}