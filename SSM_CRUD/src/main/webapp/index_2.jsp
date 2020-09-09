<%--
  Created by IntelliJ IDEA.
  User: zhaoyao
  Date: 2020/7/10
  Time: 9:15 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%--注意了script标签必须是成对的不能写成<script/>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <link type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
          rel="stylesheet"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <title>studentPag.jsp</title>
    <link rel="shortcut icon" href="img/bitbug_favicon2.ico" />
</head>
<body>


<!-- Modal -->
<div class="modal fade" id="StudentUpData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" >修改学生👨‍🎓</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="studentFormUp">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="name"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Sour</label>
                        <div class="col-sm-10">
                            <input name="sour" type="text" class="form-control" id="UpSour3" placeholder="sour">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Sex</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="UpSex1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="UpSex2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">class</label>
                        <div class="col-sm-4">
                            <select name="classes" class="form-control"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="UpDataStudent">Apply</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="StudentMode" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加学生👨‍🎓</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="studentForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input name="name" type="text" class="form-control" id="inputName3" placeholder="name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Sour</label>
                        <div class="col-sm-10">
                            <input name="sour" type="text" class="form-control" id="inputSour3" placeholder="sour">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Sex</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="AddSex1" value="男" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="AddSex2" value="女"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">class</label>
                        <div class="col-sm-4">
                            <select name="classes" class="form-control">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveStudent">Save changes</button>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM_CRUD</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button type="button" class="btn btn-primary" id="AddStudent"><span class="glyphicon glyphicon-pencil"
                                                                                aria-hidden="true"></span>新增
            </button>
            <button type="button" class="btn btn-danger" id="deleteAll"><span class="glyphicon glyphicon-trash"
                                                                aria-hidden="true"></span>删除
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="StudentTable">
                <thead>
                <tr>
                    <th><input type="checkbox" id="check_All"></th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>成绩</th>
                    <th>班级</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <div class="row" id="Mpage">
        <!--分页文字信息  -->
        <div class="col-md-6" id="MpageS"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="MpageN"></div>
    </div>
</div>
<script type="text/javascript">
    // 页面加载完成后直接发送ajax请求拿到数据
    $(function () {
        //默认首页
        to_page(1);
    });

    var datatotal,pagnumber;

    function to_page(pageNumber) {
        $.ajax({
            url: "${pageContext.request.contextPath}/student/finaByPagRJ",
            data: "pageNumber=" + pageNumber,
            type: "GET",
            success: function (result) {
                //在控制台显示
                //console.log(result);
                //解析员工数据并显示
                BuildStudentTable(result);
                //解析数据并显示分页信息
                BuildPage(result);
                //分页条
                BuildPageNav(result);
            }
        });

    }

    //展示数据
    function BuildStudentTable(result) {
        $("#StudentTable tbody").empty()
        var stduent = result.extents.pageInfo.list;
        $.each(stduent, function (index, item) {
            // alert(item.name)
            var name0 =$("<td><input type='checkbox' class='check'/></td>")
            var name6 = $("<td></td>").append(item.id);
            var name1 = $("<td></td>").append(item.name);
            var name2 = $("<td></td>").append(item.sex);
            var name3 = $("<td></td>").append(item.sour);
            var name4 = $("<td></td>").append(item.classesnmae.name);
            var UpDataBtn = $("<button></button>").addClass("btn btn-success btn-sm updata_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //给按钮添加学生ID属性以便修改
             UpDataBtn.attr("upId",item.id)
            var Delete = $("<butten></butten>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            //给按钮添加学生ID属性以便删除
             Delete.attr("DeId",item.id)
            var name5 = $("<td></td>").append(UpDataBtn).append(" ").append(Delete);

            $("<tr></tr>").append(name0).append(name6).append(name1).append(name2).append(name3).append(name4).append(name5)
                .appendTo("#StudentTable tbody");
        });

    }

    //数据数
    function BuildPage(result) {
        $("#MpageS").empty()
        var stduent = result.extents.pageInfo;
        $("#MpageS").append("当前页").append(stduent.pageNum).append("当前页记录数").append(stduent.pageSize).append("总页数").append(stduent.pages).append("总记录数").append(stduent.total);
        datatotal = stduent.total;
        pagnumber =stduent.pageNum;
    };

    //分页
    function BuildPageNav(result) {
        $("#MpageN").empty()
        var ul = $("<ul></ul>").addClass("pagination");
        var stduent = result.extents.pageInfo.navigatepageNums;
        var befor = $("<li></li>").append($("<a></a>").append("首页").attr("key", "#"));
        var Abefor = $("<li></li>").append($("<a></a>").append("&laquo;"));
        //如果没有前一页了就禁用不让点击  否则可以发送请求
        if (result.extents.pageInfo.hasPreviousPage == false) {
            befor.addClass("disabled");
            Abefor.addClass("disabled");
        } else {
            befor.click(function () {
                to_page(1)
            })
            Abefor.click(function () {
                to_page(result.extents.pageInfo.pageNum - 1)
            })
        }
        var Bbefor = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var after = $("<li></li>").append($("<a></a>").append("末页").attr("key", "#"));
        if (result.extents.pageInfo.hasNextPage == false) {
            Bbefor.addClass("disabled");
            after.addClass("disabled");
        } else {
            Bbefor.click(function () {
                to_page(result.extents.pageInfo.pageNum + 1)
            })
            after.click(function () {
                to_page(result.extents.pageInfo.pages)
            })
        }
        ul.append(befor).append(Abefor)

        $.each(stduent, function (index, item) {
            //循环显示页数
            var numberLi = $("<li></li>").append($("<a></a>").append(item))
            //如果显示页数为当前页，则加深颜色
            if (result.extents.pageInfo.pageNum == item) {
                numberLi.addClass("active");
            }
            numberLi.click(function () {
                to_page(item)
            })
            ul.append(numberLi)
        });
        ul.append(Bbefor).append(after)
        var nav = $("<nav></nav>").append(ul);
        $("#MpageN").append(nav)
    };

    //清除表单样式的方法
    function reset_form(ele) {
        // $("#StudentMode form") [0].reset()
        // $("#StudentMode input").parent().removeClass("has-success has-error")
        // $("#StudentMode input").next("span").text("")
        $(ele) [0].reset()
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("");
    }

    //错误信息的方法抽取
    function Show_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-error has-success");
        $(ele).next("span").text("")
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }

    }

    //弹出模态框
    $("#AddStudent").click(function () {
        //清除表单样式
        reset_form("#StudentMode form")
        //发送ajax信息查出班级信息
        getClass("#StudentMode select")
        //弹出模态框方法
        $("#StudentMode").modal({
            backdrop: "static"
        })

    })

    //查出所有的班级信息，并展示在下拉列表中
    function getClass(ele) {
        //清空下拉列表的值
       $(ele).empty();
        $.ajax({
            url: "${pageContext.request.contextPath}/classes/finaByPagRJ",
            type: "GET",
            success: function (result) {
                // console.log(result)
                $.each(result.extents.Classes, function () {
                    var list = $("<option></option>").append(this.name).attr("value", this.id)
                    list.appendTo(ele)
                })
            }
        })
    }

    //查姓名是否重复
    $("#inputName3").change(function () {
        var putName = this.value;
        $.ajax({
            url: "${pageContext.request.contextPath}/student/findName",
            type: "GET",
            data: "putName=" + putName,
            success: (function (result) {
                if (result.code == 100) {
                    Show_msg("#inputName3", "success", "用户名可用")
                    // 给保存按钮添加自定义属性
                    $("#saveStudent").attr("ifSuccess", "success")
                } else {
                    Show_msg("#inputName3", "error", result.extents.FNS)
                    $("#saveStudent").attr("ifSuccess", "error")
                }
            })
        })

    })

    //前端校验防君子
    function postStdeunt1() {
        //学生姓名校验
        var studentName = $("#inputName3").val();
        var zZN = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var Bear = zZN.test(studentName);
        if (!Bear) {
            Show_msg("#inputName3", "error", "用户名格式为2至5位中文或英文大小写字母A-Z或6-16位数字");
            //不截断继续执行直到全不验证
            // return false
        } else {
            Show_msg("#inputName3", "success", "");
        }
        //学生成绩校验
        var studentSour = $("#inputSour3").val();
        var zZS = /^100|(^([1-9]{0,1})([0-9]{1})(\.[0-9])?)$/;
        var BearS = zZS.test(studentSour)
            if (!BearS) {
                Show_msg("#inputSour3", "error", "请输入正确的成绩最低10分最高100分")
                return false
            } else {
                Show_msg("#inputSour3", "success", "")
            }


        //校验完成后返回true
        return true
    }

    //发送保存请求进行后段数据校验防小人
    function postStdeunt3() {
        $.ajax({
            url: "${pageContext.request.contextPath}/student/save",
            type: "POST",
            // 封装表单数据并发送的后台的保存1.)序列化表单
            data: $("#studentForm").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    //关闭模态框
                    $("#StudentMode").modal('hide');
                    //来到最后一页发送ajax——to_page传入总记录条数
                    to_page(datatotal);
                    //弹出响应信息
                    alert(result.msg)
                } else {
                    //显示失败信息
                    // console.log(result);
                    Show_msg("#inputName3", "error", result.extents.fieldErrors.name)
                    Show_msg("#inputSour3", "error", result.extents.fieldErrors.sour)
                }
            }
        })
    }

    //保存按钮的点击事件
    $("#saveStudent").click(function () {
        // 判断前端校验是否成功
        if (!postStdeunt1()) {
            return false;
        }
        // 判断后段姓名校验是否重复
        if ($(this).attr("ifSuccess") == "error") {
            return false
        }
        //保存数据校验
        postStdeunt3()

    })
    //此时不能普通的绑定因为按钮在绑定事件之前就被创建出来了
    //1）.可以在按钮创建之前进行绑定2）.绑定点击.live
    //jquery新版本中没有live，使用on代替

    function findById(id){
        $.ajax({
            url:"${pageContext.request.contextPath}/student/UpData/"+id,
            type:"GET",
            success:function (result) {
                 // console.log(result)
                $("#name").text(result.extents.allById.name);
                $("#UpSour3").val(result.extents.allById.sour);
                $("#StudentUpData input[name=sex]").val([result.extents.allById.sex]);
                $("#StudentUpData select").val([result.extents.allById.classes])
            }
        })

    }

    $(document).on("click",".updata_btn",function () {
        // alert("ok")
        //通过ID去查并返回到表单
            //清除表单样式
            reset_form("#StudentUpData form");
            //发送ajax信息查出班级信息
            getClass("#StudentUpData select");
            //通过ID去查学生信息
            findById($(this).attr("upId"));
            //给保存按钮添加ID
            $("#UpDataStudent").attr("suId",$(this).attr("upId"))
            //弹出模态框方法
            $("#StudentUpData").modal({
                backdrop: "static"
            })
    })
        $("#UpDataStudent").click(function () {
            //学生成绩校验
            var studentSour = $("#UpSour3").val();
            var zZS = /^100|(^([1-9]{0,1})([0-9]{1})(\.[0-9])?)$/;
            var BearS = zZS.test(studentSour)
            if (!BearS) {
                Show_msg("#UpSour3", "error", "请输入正确的成绩最低10分最高100分")
                return false
            } else {
                Show_msg("#UpSour3", "success", "")
            }

            $.ajax({
                url:"${pageContext.request.contextPath}/student/SupData/"+$(this).attr("suId"),
                type:"PUT",
                data: $("#studentFormUp").serialize(),
                success:function (result) {
                    $("#StudentUpData").modal('hide');
                    to_page(pagnumber);
                    alert(result.msg);
                }
            })
            //关闭模态框回到当前修改页面

        })
    // 单个删除
    $(document).on("click",".delete_btn",function () {
        //找到祖先节点tr下的第一个td拿到要删除的学生姓名
        if (confirm("确认删除（"+$(this).parents("tr").find("td:eq(2)").text()+")吗?")){
            $.ajax({
                url:"${pageContext.request.contextPath}/student//delete/"+$(this).attr("DeId"),
                type:"DELETE",
                success:function (result) {
                    to_page(pagnumber)
                    alert(result.msg);
                }
            })
        }
    })
    //多个删除
    $("#check_All").click(function () {
        // 读取dom愿生属性时用prop（）自定义的用attr（）
        //让所有checked的值和当前点击checked的值相同
        $(".check").prop("checked",$(this).prop("checked"))

    })
    $(document).on("click",".check",function () {
      var flen= $(".check:checked").length==$(".check").length;
        $("#check_All").prop("checked",flen)

    })
    $("#deleteAll").click(function () {
        var emps="";
        var Ids="";
        //把被选中的学生姓名组装
        $.each($(".check:checked"),function () {
             emps+=$(this).parents("tr").find("td:eq(2)").text()+":";
             Ids+=$(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        //去除学生名字间多余的逗号，，
        var nemps=emps.substring(0,emps.length-1);
        //去除学生ID间多余的逗号--
        var nIds=Ids.substring(0,Ids.length-1);
        if (confirm("确认删除（"+nemps+")吗?")){

            $.ajax({
                url:"${pageContext.request.contextPath}/student//delete/"+nIds,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(pagnumber);
                }
            })
        }


    })





</script>
</body>
</html>
