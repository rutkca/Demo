<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <button class="btn btn-primary">新增</button>
                <button class="btnpageContext.setAttribute("APP_PATH",request.getContextPath()); btn-danger">删除</button>
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
                    <tr>
                        <td>1</td>
                        <td>chenguanliang</td>
                        <td>男</td>
                        <td>1730262636@qq.com</td>
                        <td>开发部</td>
                        <td>
                            <button class="btn btn-primary btn-sm">修改</button>
                            <button class="btn btn-danger btn-sm">删除</button>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-5">
                <p>
                    当前XXXX页，共xxx页，总xxxx条记录
                </p>
            </div>
            <div class="col-7 text-right">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">首页</a> </li>
                        <li class="page-item"><a class="page-link" href="#">1</a> </li>
                        <li class="page-item"><a class="page-link" href="#">2</a> </li>
                        <li class="page-item"><a class="page-link" href="#">3</a> </li>
                        <li class="page-item"><a class="page-link" href="#">末页</a> </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>

</body>
<script src="${APP_PATH}/static/js/jquery.min.js"></script>
<script src="${APP_PATH}/static/bootstrap/css/bootstrap.min.css"></script>
</html>
