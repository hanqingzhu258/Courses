$(document).ready(function () {
    'use strict';
    $.ajax({
        url: "json/homework.json",
        type: "post",
        data: JSON.stringify({
                "homeworkTitle": $("#homeworkTitle").val(),
                "homeworkContent": editor.txt.html()
            }
        ),
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })
        .done(function () {
            
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

});

function addHomework() {
    console.log($("#homeworkTitle").val());
    alert(editor.txt.html());
    $.post('json/homework.json', {
        "homeworkTitle": $("#homeworkTitle").val(),
        "homeworkContent": editor.txt.html()
    }, function (data) {
        console.log(data);
      alert(editor.txt.html())  /*optional stuff to do after success */
    }, 'json');

}
