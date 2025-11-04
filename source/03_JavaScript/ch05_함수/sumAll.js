function sumAll(){
  if(arguments.length === 0){
    return -999;
  }
  let sum=0;
  for(let i =0; i<arguments.length; i++){
    sum += arguments[i];
  }
  return sum;
}