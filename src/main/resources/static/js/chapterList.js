$(document).ready(function() {
    'use strict';
    $.ajax({
            url: 'http://localhost:8080/getAllChapters',
            type: 'get',
            timeout: 5000,
            contentType: 'application/json; charset=UTF-8',
            cache: false
        })
        .done(function(data) {
            console.log(data.data);
            alert(data.data[0].name)
            // todo 这里显示表格内容
            $("#courseList").dataTable({
                "data": data.data,

                "columns": [
                    { "data": "number" },
                    { "data": "name" },

                    { "data": null },
                    { "data": null }


                ],
                language: {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "显示 _MENU_ 项结果",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "搜索:",
                    "sUrl": "",
                    "sEmptyTable": "表中数据为空",
                    "sLoadingRecords": "载入中...",
                    "sInfoThousands": ",",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    },
                    "oAria": {
                        "sSortAscending": ": 以升序排列此列",
                        "sSortDescending": ": 以降序排列此列"
                    }
                },
                columnDefs: [{
                    targets: 2,
                    render: function(data, type, row, meta) {
                        console.log(data);
                        return "<a type='button' class='btn btn-primary"

                            +
                            "' onclick='showdetails(\"" +
                            "\")' href='#'>详情</a>"
                    }

                }, {
                    targets: 3,
                    render: function(data, type, row, meta) {
                        console.log("2." + data);
                        return "<a type='button' class='btn btn-danger"

                            +
                            "' onclick='delcgroup(\""

                            +
                            "\")' href='#'>删除</a>"


                    }

                }]
            })
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });

});
