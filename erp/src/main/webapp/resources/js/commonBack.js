$('INPUT[type="file"]').change(function () {
    var ext = this.value.match(/\.(.+)$/)[1].toLowerCase();
    switch (ext) {// String extensionCheck = "(txt|pdf|pptx|docx|hwp|xls|xlsx|png|PNG|jpg|JPG|war|zip|egg|sql|SQL)"; // 파일 형식 제어
    	case 'txt':
    	case 'pdf':
    	case 'pptx':
    	case 'docx':
    	case 'hwp':
    	case 'xls':
    	case 'xlsx':
    	case 'png':
        case 'jpg':
        case 'jpeg':
        case 'war':
        case 'zip':
        case 'gif':
        case 'egg':
        case 'sql':
            $('#uploadButton').attr('disabled', false);
            break;
        default:
            alert('지원하지 않는 형식입니다');
            this.value = '';
    }
});

//script구문 내부에 해당 메소드를 입력합니다.
$(function() {
  $('.datePicker').datepicker({
	  nextText: '다음 달',
	  prevText: '이전 달',
     showButtonPanel: true, 
     	currentText: '오늘',
     	closeText: '닫기',
     	dateFormat: "yy-mm-dd",
     changeMonth: true, 
     	dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
     	dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
      monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
     maxDate: "+3D",
		changeYear: true
  });
});


$(function(){
$('.timePicker').timepicker({
	step: 10,            //시간간격 : 5분
	timeFormat: "H:i"    //시간:분 으로표시

});
})
