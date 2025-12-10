let num1= 20;
let num2= 21;
let difference = (num1 > num2) ? num1 - num2 : num2 - num1;
msg = (num1 > num2) ? ('첫 번째 수가' + difference +'만큼 더 크다'):
                      (num2> num1)?'두 번째수가 '+ difference +'만큼 더 크다':
                                  '두수는 같다';
// lef difference; // 차이값 저장할 예정

// if(num1>num2){
//   let difference = num1 - num2;
// }
// else{
//   let difference = num2 - num1;
//}

// if(num1 > num2){
//   msg = '첫 번째 수가' + difference +'만큼 더 크다';
// }
// else if(num2> num1){
//   msg = '두 번째 수가' + difference +'만큼 더 크다';
// }
// else{
//   msg=' 두 수는 같다';
// }

console.log(msg);