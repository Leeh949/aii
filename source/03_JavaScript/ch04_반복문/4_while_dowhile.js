// 1초동안 반복하는 while 구문/ do~while 구문
var cnt = 0;
var startTime = new Date().getTime(); // 시작시점 밀리세컨
// while(new Date().getTime() <= startTime + 1000){
//   cnt++; //cnt1증가
// }
do{
  cnt++
}while(new Date().getTime()<= startTime+1000);
console.log('1초동안 while문 수행한 횟수: ',cnt);