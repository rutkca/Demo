<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>雇员列表</title>
<%
    pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>SSM Demo</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12 offset-8">
                <button class="btn btn-primary" id="addBtn">新增</button>
                <button class="btn btn-danger" id="delAllBtn">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deparment</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list }" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.gender}</td>
                            <td>${emp.email}</td>
                            <td>${emp.department.deptName}</td>
                            <td>
                                <button class="btn btn-primary btn-sm editBtn" edit_id="${emp.empId}" >修改</button>
                                <button class="btn btn-danger btn-sm delBtn" delete_id="${emp.empId}" >删除</button>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-5">
                <p>
                    当前${pageInfo.pageNum}页，共${pageInfo.pages}页，总${pageInfo.total}条记录
                </p>
            </div>
            <div class="col-7 text-right">
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-end">
                        <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=1">首页</a> </li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li class="page-item">
                                <a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum}">
                                <li class="page-item active"><a class="page-link" href="#">${page_Num}</a> </li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum}">
                                <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${page_Num}">${page_Num}</a> </li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                            <li class="page-item">
                                <a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li class="page-item"><a class="page-link" href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a> </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

    <!-- Modal新增页面 -->
    <div class="modal fade" id="myModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="emptform">
                        <div class="form-group">
                            <label for="inputName" class="col-sm-4 control-label">员工姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputName" placeholder="姓名" name="empName" >
                                <span  class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputgender" class="col-sm-4 control-label">性别</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputgender" placeholder="性别" name="gender">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputemail" class="col-sm-4 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="inputemail" placeholder="邮箱" name="email">
                                <span class="help-block"></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">部门</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="deptselect" name="dId">

                                </select>
                            </div>
                        </div>


                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="addbutton">保存</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal修改页面 -->
    <div class="modal fade" id="myModalUpdate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabelupdate">员工修改</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="emptformupdate">
                        <input type="hidden" name="empId" id="empId">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">员工姓名</label>
                            <div class="col-sm-12">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">性别</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="inputgenderupdate" placeholder="性别" name="gender">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">部门</label>
                            <div class="col-sm-12">
                                <select class="form-control" id="deptselectupdate" name="dId">

                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputemail" class="col-sm-4 control-label">邮箱</label>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="inputemailupdate" placeholder="邮箱" name="email">
                                <span class="help-block"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="buttonupdate">更新</button>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="${APP_PATH}/static/js/jquery.min.js"></script>
<script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
<script>
    $("#addBtn").click(function (){
        $.ajax({
            url:"depts",
            method:"get",
            success:function (result){
                let str = "";
                for(let dept of result){
                    str += "<option value='"+dept.deptId+"'>"+dept.deptName+"</option>>";
                }
               $("#deptselect").html(str);
            }
        });
        $("#myModalAdd").modal({
            backdrop:"static"
        })
    });

    $(".editBtn").click(function (){
        let empId = $(this).attr("edit_id");
        $.ajax({
            url:"depts",
            method:"get",
            async:false,
            success:function (result) {
                let str = "";
                for(let dept of result){
                    str += "<option value='"+dept.deptId+"'>"+dept.deptName+"</option>"
                }
                $("#deptselectupdate").html(str);
            }
        })
        $.ajax({
            url:"emps/"+empId,
            method:"get",
            success:function (result) {
                $("#empId").val(result.empId);
                $("#empName_update_static").html(result.empName);
                $("#inputgenderupdate").val(result.gender);
                $("#inputemailupdate").val(result.email);
                $("#deptselectupdate").val(result.dId);
            }
        })
        $("#myModalUpdate").modal({
            backdrop:"static"
        });
    });

    $("#addbutton").click(function (){
        $.ajax({
            url:"emps",
            method: "post",
            data:$("#emptform").serialize(),
            success:function (result){
                if(result.code == 200){
                    $("#myModalAdd").modal('hide');
                    location.reload();
                }else{
                    alert("保存失败");
                }
            }
        });

    });
    $("#buttonupdate").click(function () {
        $.ajax({
            url:"emps",
            method:"post",
            data:$("#emptformupdate").serialize()+"&_method=PUT",
            success:function (result) {
                if(result.code == 200){
                    alert("更新成功");
                    location.reload();
                }
            }
        });
    });
    $(".delBtn").click(function () {
        let empId = $(this).attr("delete_id");
        let r = confirm("确认删除{"+empId+"}记录吗？")
        if(r) {
            $.ajax({
                url: "emps" + empId,
                method: "post",
                data: "_method=DELETE",
                success: function (result) {
                    if (result.code == 200) {
                        alert("刷新成功");
                        location.reload();
                    }
                }
            })
        }
    });
</script>
</html>
