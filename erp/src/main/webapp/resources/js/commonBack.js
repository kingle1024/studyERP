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