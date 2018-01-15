$(document).ready(function () {
    'use strict';
    $('[data-toggle="popover"]').popover()


    var E = window.wangEditor;
    var editor = new E('#mywangeditor');
    // 或者 var editor = new E( document.getElementById('editor') )
    editor.create()
});

/**
 * 点击添加按钮产生的事件
 */
function addChapterTo() {


    /**
     * 发送数据numbr,name
     */
    $.ajax({
        url: 'http://localhost:8080/addChapter',
        type: 'post',
        dataType: 'json',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        data: JSON.stringify({
            "number": $("#selectChapterNumber").val(),
            "name": $("#selectTitle").val(),
            "course_id": "1" //$.session.get('key');
        })
    })
    /**
     * 点击按钮隐藏添加章节,显示章节详情
     */
        .done(function (data) {

            // todo 加上弹出的东西
            // alert("选择的章节是" + $("option selected").val() + "\n" + "标题是:  " + $("#selectTitle").val());
            $("#showchapter").show('slow', function () {

            });
            $("#submitchapter").hide('slow', function () {

            });
            // console.error($("option selected").val());
            // console.log("postsuccess");
            // console.log(data)
            // console.log(data.data.name);
            $("#selectShownChapterNumber").val(data.data.number);
            $("#totalId").val(data.data.id);
            $("#selectShownChapterTitle").val(data.data.name);


        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function clearforms() {
    /**
     * 清空列表
     */
    $("input").val("");

}

function updateShownChapter() {
    $.ajax({
        url: 'http://localhost:8080/updateChapter',
        type: 'post',
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false,
        data: JSON.stringify({
            "number": $("#selectShownChapterNumber").val(),
            "name": $("#selectShownChapterTitle").val(),
            "id": $("#totalId").val() //$.session.get('key');
        })
    })
        .done(function (data) {
            //todo 炫酷更新成功效果
            alert(data.message)
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function addzhishidianSelect() {
    $.ajax({
        url: 'http://localhost:8080/addUnit_knowledgePointRelation',
        type: 'post',
        dataType: 'json',
        data: JSON.stringify({
            id: $("#zhishidinaSelect").val(),
            unit_id: $("#uniteIdInput").val()

        }),
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })
        .done(function (data) {

            $("#updatezhishidianList").append('<a href="#" class="btn btn-primary">' + data.data.content + '</a><a href="#" class="btn btn-link" onclick="">删除</a>');


            console.log(data.data.content);
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function addZhishidian() {
    $.ajax({
        url: 'http://localhost:8080/addKnowledgePoint',
        type: 'post',
        dataType: 'json',
        data: JSON.stringify({

            "content": $("#addZhishidianInput").val()
        }),
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })
        .done(function (data) {

            console.log(data.data.id)

            $("#addZhishidianInput").val("");
            $("#zhishidianList").append('<span href="#" id="' + data.data.id + '" class="btn btn-primary">' + data.data.content + '<a href="#" class="btn btn-link" onclick=deleteKnowledgePoint("' + data.data.id + '")>删除</a></span>');
            $("#zhishidinaSelect").append('<option value="' + data.data.id + '">' + data.data.content + '</option>');

            console.log(data.data.content);
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

//todo 添加课时
function addSerialNumber() {
    $("#hidecourses").show('slow', function () {
    });
    $.ajax({
        url: 'http://localhost:8080/addUnit',
        type: 'post',
        dataType: 'json',
        data: JSON.stringify({
            "number": $("#selectChapterSerialNumber").val(),
            "name": $("#inputChapterName").val(),
            "chapter_id": $("#totalId").val()
        }),
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })
        .done(function (data) {
            $("#selectupdateSerial").val(data.data.number);
$("#inputUpdateSerial").val(data.data.name)
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

//更新章节
function updateSerialNumber() {
    $.ajax({
        url: 'http://localhost:8080/',
        type: 'post',
        dataType: 'json',
        data: JSON.stringify({
            "courseserialnumber": $("#selectChapterSerialNumber").val(),
            "courseSerialName": $("#inputChapterName").val(),
            "id": $("#selectSerialId").val()
        }),
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

}

function showFileName() {
    var inputname = $("#filepreview").val();
    $("#textName").val(inputname);
}

function uploadFile() {
    var name = $("#filepreview").val();
    $.ajax({
        url: 'http://localhost:8080/office',
        type: 'post',
        dataType: 'json',
        data: JSON.stringify({
            "courseserialnumber": $("#selectChapterSerialNumber").val(),
            "courseSerialName": $("#inputChapterName").val(),
            "id": $("#selectSerialId").val()
        }),
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

    // $("#uploadFiles").append('<a href="#" class="btn btn-link" >' + name + '</a><a class="badge">&nbsp;&nbsp;&nbsp;&nbsp;×</a>');

    // $("#uploadFiles").append('')

    // $("#uploadFiles").append('<a href="#" >Inbox <span class="badge">42</span></a>\n' +
    //     '                <button class="btn btn-primary" type="button">\n' +
    //     '                    Messages <span class="badge">4</span>\n' +
    //     '                </button>\n' +
    //     '                <a href="#">Inbox <span class="badge">42</span></a>\n' +
    //     '                <button class="btn btn-primary" type="button">\n' +
    //     '                    Messages <span class="badge">4</span>\n' +
    //     '                </button>\n' +
    //     '                <button type="button" class="btn btn-primary">添加到本课</button>')
}

function addFilesToCourse() {
    $.ajax({
        url: 'http://localhost:8080/bindUnit_offices',
        type: "post",
        dataType: 'json',
        data: JSON.stringify({
            "unit_id": $("#uniteIdInput").val(),
            "office_ids": [
                "7", "8"
            ]
        }),
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

}

function deleteKnowledgePoint(data) {

    console.log("dsdfsfsdfsfs");
    console.log(data);
    $.ajax({
        url: 'http://localhost:8080/deleteKnowledgePoint',
        type: "post",
        dataType: 'json',
        data: JSON.stringify({

            "id": data
        }),
        timeout: 5000,
        contentType: 'application/json; charset=UTF-8',
        cache: false
    })
        .done(function () {
$("#"+data+"").remove();
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}
