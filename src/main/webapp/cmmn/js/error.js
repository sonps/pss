//카운트 시작 숫자
var count = 20;
//카운트다운함수
var countdown = setInterval(function(){
//해당 태그에 아래 내용을 출력
$("p.countdown").html("<span style='color:blue;font-size:23pt;font-weight:bold'>"
+ count + "</span><span style='font-size:20pt'>초 후 메인으로 이동 합니다.</span>");
    //0초면 초기화 후 이동되는 사이트
    if (count == 0) {
        clearInterval(countdown);
        window.open('/', "_self");
        }
    count--;//카운트 감소
}, 1000);