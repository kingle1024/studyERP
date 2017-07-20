$('INPUT[type="file"]').change(function () {
    var ext = this.value.match(/\.(.+)$/)[1].toLowerCase();
    switch (ext) {
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
        case 'war':
        case 'zip':
        case 'xlsx':
        case 'docx':
        case 'hwp':
            $('#uploadButton').attr('disabled', false);
            break;
        default:
            alert('지원하지 않는 형식입니다');
            this.value = '';
    }
});