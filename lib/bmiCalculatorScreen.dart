import 'resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'bmiModel.dart';


class BmiCalculatorScreen extends StatefulWidget {
  @override
  _BmiCalculatorScreenState createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
double _userHeight=100.0;
double _userWeight=40.0;
double _bmi=0.0;
BmiModel? _bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                
                height: 160,width: 200,
                child: SvgPicture.asset('assets/images/heart.svg',fit: BoxFit.contain,),
              ),
              SizedBox(height: 8,),
              Text('BMI CALCULATOR',style: TextStyle(color: Colors.red[600],fontSize: 30,fontWeight: FontWeight.w700),),
              Text('We Care About Your Heart',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w400),),
              SizedBox(height: 12,),
              Text('Height(cm)',style: TextStyle(color: Colors.grey,fontSize: 21,fontWeight: FontWeight.w400),),
              Container(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Slider(
                  label: '$_userHeight',
                  divisions: 100,
                  activeColor: Colors.red,
                  value: _userHeight,
                  min: 80.0, 
                  max: 250.0,
                  onChanged: (height){
                    setState(() {
                      _userHeight=height;
                    });
                  }),
              ),
              Text('$_userHeight cm',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w900),),
              SizedBox(height: 16,),

              Text('Weight(kg)',style: TextStyle(color: Colors.grey,fontSize: 21,fontWeight: FontWeight.w400),),
              Container(
                padding: EdgeInsets.only(left: 16,right: 16),
                child: Slider(
                  label: '$_userWeight',
                  divisions: 100,
                  activeColor: Colors.red,
                  value: _userWeight,
                  min: 30, 
                  max: 120,
                  onChanged: (weight){
                    setState(() {
                      _userWeight=weight;
                    });
                  }),
              ),
              Text('$_userWeight kg',style: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.w900),),
              SizedBox(height: 8,),
              Container(
                color: Colors.red,
                width: double.infinity,
                padding: EdgeInsets.only(right: 16,left: 16),
                child: TextButton.icon(
                  onPressed: (){
                    setState(() {
                      _bmi=_userWeight/((_userHeight/100)*(_userHeight/100));
                      if(_bmi>=18.5 && _bmi<=25){
                        _bmiModel=BmiModel(bmi: _bmi,isNormal: true,comments: 'You are fit');
                      }
                      else if(_bmi<18.5){
                        _bmiModel=BmiModel(bmi: _bmi,isNormal: false,comments: 'You are underweighted');
                      }
                      else if(_bmi>25 && _bmi<=30){
                        _bmiModel=BmiModel(bmi: _bmi,isNormal: false,comments: 'You are overweighted');
                      }else{
                        _bmiModel=BmiModel(bmi: _bmi,isNormal: false,comments: 'You are obese');
                      }
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>Result(_bmiModel!)));
                    });
                  }, 
                  icon: Icon(Icons.favorite,color: Colors.white,), 
                  label: Text('Calculate',style: TextStyle(color: Colors.white),),
                  ),
              )
            ],
          ),
        ),
      ),
      
    );
  }
}