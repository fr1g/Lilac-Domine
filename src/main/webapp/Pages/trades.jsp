<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="application"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th colspan="5">交易记录</th>
    </tr>
    <tr>
        <th>ID</th>
        <th>买家</th>
        <th>域名</th>
        <th>类型</th>
        <th>详情</th>
    </tr>
    <c:forEach var="log" items="${page.list}">
        <tr>
            <th><c:out value="${log.id}"/></th>
            <th><c:out value="${log.purchaser.userName}"/></th>
            <th><c:out value="${log.domain.domainName}"/></th>
            <th><c:out value="${log.orderType}"/></th>
            <th><c:out value="${log.detail}"/></th>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="5">
            <c:if test="${page.hasPreviousPage}">
                <a href="${path}/trade/page/1">首页</a>
                <a href="${path}/trade/page/${page.prePage}">上一页</a>
            </c:if>
            <c:forEach var="num" items="${page.navigatepageNums}">
                <c:if test="${page.pageNum == num}">
                    <a href="${path}/trade/page/${num}" style="color: blue;">[${num}]</a>
                </c:if>
                <c:if test="${page.pageNum != num}">
                    <a href="${path}/trade/page/${num}">${num}</a>
                </c:if>
            </c:forEach>
            <c:if test="${page.hasNextPage}">
                <a href="${path}/trade/page/${page.nextPage}">下一页</a>
                <a href="${path}/trade/page/${page.pages}">末页</a>
            </c:if>
        </td>
    </tr>
</table>
</body>
</html>
