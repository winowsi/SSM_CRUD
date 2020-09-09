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
        <link type="text/css" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <title>studentPag.jsp</title>
</head>
<body>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM_CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-primary">Primary</button>
                <button type="button" class="btn btn-success">Success</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>成绩</th>
                        <th>班级</th>
                    </tr>
                    <c:forEach items="${studentByPag.list }" var="emp">
                        <tr>
                            <th>${emp.name }</th>
                            <th>${emp.sex }</th>
                            <th>${emp.sour }</th>
                            <th>${emp.classesnmae.name }</th>
                            <th>
                                <button class="btn btn-primary btn-sm">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                    删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-6">当前 ${studentByPag.pageNum }页,总${studentByPag.pages }
                    页,总 ${studentByPag.total } 条记录</div>
                <!-- 分页条信息 -->
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/student/finaByPag?pageNumber=1">首页</a></li>
                            <c:if test="${studentByPag.hasPreviousPage }">
                                <li><a href="${pageContext.request.contextPath}/student/finaByPag?pageNumber=${studentByPag.pageNum-1}"
                                       aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                </a></li>
                            </c:if>


                            <c:forEach items="${studentByPag.navigatepageNums }" var="page_Num">
                                <c:if test="${page_Num == studentByPag.pageNum }">
                                    <li class="active"><a href="#">${page_Num }</a></li>
                                </c:if>
                                <c:if test="${page_Num != studentByPag.pageNum }">
                                    <li><a href="${pageContext.request.contextPath}/student/finaByPag?pageNumber=${page_Num }">${page_Num }</a></li>
                                </c:if>

                            </c:forEach>
                            <c:if test="${studentByPag.hasNextPage }">
                                <li><a href="${pageContext.request.contextPath}/student/finaByPag?pageNumber=${studentByPag.pageNum+1 }"
                                       aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                </a></li>
                            </c:if>
                            <li><a href="${pageContext.request.contextPath}/student/finaByPag?pageNumber=${studentByPag.pages}">末页</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
    </div>
</body>
</html>
