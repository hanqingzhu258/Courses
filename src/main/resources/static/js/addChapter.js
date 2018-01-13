$(document).ready(function () {
    'use strict';
    $('[data-toggle="popover"]').popover()

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
            $("#addZhishidianInput").val("");
            $("#zhishidianList").append('<a href="#" class="btn btn-primary">' + data.data.content + '</a><a href="#" class="btn btn-link" onclick="">删除</a>');
            $("#zhishidinaSelect").append('<option value="' + data.data.id + '">' + data.data.content + '</option>');
            //todo 添加到
            //todo 把添加的知识点加到下拉框里
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
