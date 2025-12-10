// 자료형: string, number, boolean, function, object(array), undefined
var variable;
console.log('1. variable타입: ',typeof(variable),'- 값: ',variable);
variable= '이름은 \'홍길동\'입니다.';
console.log('2. variable타입: ',typeof(variable),'- 값: ',variable);
variable= -313131313131313.2323;
console.log('3. variable타입: ',typeof(variable),'- 값: ',variable);
variable=false;
console.log('4. variable타입: ',typeof(variable),'- 값: ',variable);
variable= function(){ 
  alert('함수 속');
};
console.log('5. variable타입: ',typeof(variable),'- 값: ',variable);
variable={'name':'홍길동','age':'20'};
console.log('6. variable타입: ',typeof(variable),'- 값: ',variable.name, variable.age);

variable=['홍길동',10, function(){}, true,{'name':'홍길동'},[1,2,3]];
console.log('7. variable타입: ',typeof(variable),'- 값: ',variable.name,variable.age);