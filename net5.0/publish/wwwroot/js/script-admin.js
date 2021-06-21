function LoadWysiwyg() {
    $('#summernote').summernote({
        width: 1200,
        height: 500,
        tabsize: 2,
        lang: 'lt-LT',
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'strikethrough', 'clear']],
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['strikethrough', ['strikethrough']],
            ['para', ['style', 'ul', 'ol', 'paragraph', 'height']],
            ['table', ['table']],
            ['insert', ['link', 'picture', 'video', 'hr', 'table']],
            ['view', ['fullscreen', 'help']]
        ]
    });
}

function GetWysiwygContent() {
    var markupStr = $('#summernote').summernote('code');
    return markupStr;
}
