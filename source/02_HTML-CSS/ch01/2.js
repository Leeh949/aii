// 2.js:동적인부분(파일-> 다른이름으로 저장 -> 인코딩저장 UTF-8 선택후 저장)
name = prompt("이름은?", "홍길동"); // 취소를 클릭시 'null'저장

if (name != 'null') {
    document.write(name + '님 반갑습니다<br>');
}

