<?
header("Content-Type: application/javascript; charset=UTF-8");
$callback_name = $_GET['callback'];
$callback_name = trim($callback_name);

if (!$callback_name) {
    $callback_name = "callback";
}
?>
<?=$callback_name ?>({
    "title": "Javascript + jQuery + Ajax 완벽가이드",
    "description": "그린IT학원에서 진행중인 Javascript 강의 학생용 자료 입니다. 각 게시판의 다운로드 권한은 매 강의 개강시마다 부여됩니다.",
    "total": 4,
    "item" : [{
        "no" : "공지",
        "subject" : "'Javascript + jQuery + Ajax 완벽가이드' 강의 자료실 입니다.",
        "hit" : 3,
        "date" : "2013.10.29"
    }, {
        "no" : 3,
        "subject" : "Javascript + jQuery + Ajax 완벽가이드 3일차 강의자료 입니다.",
        "hit" : 6,
        "date" : "2013.11.08"
    }, {
        "no" : 2,
        "subject" : "Javascript + jQuery + Ajax 완벽가이드 2일차 강의자료 입니다.",
        "hit" : 15,
        "date" : "2013.11.07"
    }, {
        "no" : 1,
        "subject" : "Javascript + jQuery + Ajax 완벽가이드 1일차 강의자료 입니다.",
        "hit" : 19,
        "date" : "2013.11.05"
    }]
});