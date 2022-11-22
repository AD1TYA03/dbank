import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
stable var currentValue: Float = 3000;
stable var startTime=Time.now();
Debug.print(debug_show(startTime));

 
 public func topUp(amount: Float){
  currentValue +=amount;
  Debug.print(debug_show(currentValue));
 };

 public func withdraw(amount: Float){
  let temp: Float =currentValue-amount;
  if (temp >= 0){  currentValue -=amount;
  Debug.print(debug_show(currentValue));
 } else {
  Debug.print("Sorry you can't withdraw! Your current value is less :");
  Debug.print(debug_show(currentValue));
 }
 };

 public query func checkBalance(): async Float{
  return currentValue;
 };

 public func compound(){
  let currentTime= Time.now();
  let timeElaspedNS=startTime-currentTime;
  let timeElaspedS=timeElaspedNS/1000000000;
  currentValue := currentValue *( 1.01 ** Float.fromInt(timeElaspedS));
 }


}