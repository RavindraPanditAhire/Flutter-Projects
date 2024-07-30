
// class Ravi{

//   void fun(){
//     print("Hii this is Fun Function");
//   }

//   int sum(int a,int b){
//     return a+b;
//   }
// }

class OpenAc{

  late String name;
  late int age;
  late bool isPan;

  // OpenAc(String name,int age,bool isPan){
  //   this.name=name;
  //   this.age=age;
  //   this.isPan=isPan;
  // }

  void open(String name,int age,bool isPan){
    this.name=name;
    this.age=age;
    this.isPan=isPan;
    print("$name Your account is  Open Successully..");
  }

  // for accont detials
  void profile(){
    print("---------Account Details---------");
    print("Name: ${this.name}");
    print("Age: ${this.age}");
    // print("isPan: "+this.isPan);
  }

}
void main(){

  OpenAc a1=OpenAc();
  OpenAc a2=OpenAc();
  a1.open("Ravindra",23,true);
  a1.profile();

  a2.open("Ganesh",34,true);
  a2.profile();
  

  // print("Ravindra Ahire");

  // Ravi r=Ravi();/
  // r.fun();

  // int roll=76;
  // String name="Ravindra";
  // double doub=50.32;
  // bool isRain=false;
  // print("Name: $name");
  // print("Roll No: $roll");
  // print("Mob: $doub");
  // print("Raining: $isRain");

  // int res=r.sum(10, 20);
  // print("Sum is: $res");

  // dynamic dyn="Ravindra";
  // print("Dyn: $dyn");

  // dyn=452;
  // print("dyn $dyn");

  // List list=["Ravindra","Rajendra","Ganesh","Mahesh"];
  // print("List: $list");

  // list.add("Machhindra");
  // print("List: $list");
  // list.clear();
  // print("List: $list");

}