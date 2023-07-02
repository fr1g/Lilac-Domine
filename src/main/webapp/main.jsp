<%@ page contentType="text/html;charset=UTF-8" language="java"
         import="com.lilac.servlet.Main, java.util.*"
%>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="application" />

<!DOCTYPE html>
<html lang="en" class="">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script href="${path}/js/mozCookieHelper.js"></script>
    <link rel="stylesheet" href="${path}/css/bootstrap.css" />
    <link rel="stylesheet" href="${path}/css/bootstrap-icons.css" />
    <link type="favicon" rel="icon" href="${path}/src/img/logo.png">
    <link rel="stylesheet" type="text/css" href="${path}/output.css" />
    <link rel="stylesheet" type="text/css" href="${path}/css/main.css" />
    <script>
        const JSP_PATH = '${path}';
        window.cascadingJSPPATH = JSP_PATH;
    </script>
    <%!
        String _PageTitle = "LilacYun Domine - Domain Registeration Service",
        _CurrentPath0 = "initial";
        User _CurrentUser;
    %>
    <%
        UrlPathHelper urlPathHelper = new UrlPathHelper();
        _CurrentPath0 = urlPathHelper.getOriginatingRequestUri(request);
        session.setAttribute("CurrPath", _CurrentPath0);
        try{
            _CurrentUser = (User)session.getAttribute("USER_SESSION");
            session.setAttribute("USER_", _CurrentUser);
        }catch(Exception ex){}
    %>
    <c:set value="${CurrPath}" var="path_" scope="session" />
    <c:set value="${USER_}" var="USER_" scope="session" />

    <c:set value="button-disable" var="bdis" scope="application" />
    <c:set value="ena" var="bena" scope="application" />
    <c:set value="disabled" var="disabledh" scope="application" />
    <c:set value=" " var="__" scope="application" />
    <c:set value="Change current page" var="_change_" scope="application" />
    <c:set value="Admin" var="__admin" scope="application" />
    <c:set value="Act." var="__user" scope="application" />
    <c:set value="Ban" var="__ban" scope="application" />


    <c:set value="about" var="about_" scope="application" />
    <c:set value="lar" var="lar_" scope="application" />
    <c:set value="login" var="login_" scope="application" />
    <c:set value="register" var="register_" scope="application" />
    <c:set value="market" var="market_" scope="application" />
    <c:set value="panel" var="panel_" scope="application" />
    <c:set value="index" var="index_" scope="application" />
    <c:set value="main" var="main_" scope="application" />
    <title><%=_PageTitle%></title>
</head>
<body  class="bg-slate-200 dark:bg-zinc-700 text-stone-800 dark:text-zinc-100 transition-all ">
<%@include file="/Components/content-navbar.jsp"%>
    <div class="">
        <script>window.userdat = "${USER_ == null ? 0 : 1}"; console.log(userdat);</script>
    </div>
<%--  @Body Render Here... (Testing)  --%>
<c:choose>
    <c:when test="${path_.contains(about_)}">
        <%@include file="/Pages/about.jsp"%>
    </c:when>
    <c:when test="${path_.contains(lar_) || path_.contains(login_) || path_.contains(register_)}">
        <c:choose>
            <c:when test="${USER_ != null || USER_SESSION != null}">
                <script>
    <%-- Navigate user to panel if he wanna directly go to login when he do logged in. --%>
                    window.location.href = JSP_PATH + "/panel";
                </script>
            </c:when>
            <c:otherwise>
                <%@include file="/Pages/lar.jsp"%>
                <script src="./js/LoginAndRegFormHelper.js"></script>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${path_.contains(market_)}">
        <%@include file="/Pages/market.jsp"%>
    </c:when>
    <c:when test="${path_.contains(panel_)}">
        <c:choose>
            <c:when test="${USER_SESSION != null}">
                <%@include file="/Pages/panel.jsp"%>
                <script src="./js/PanelHelper.js"></script>
            </c:when>
            <c:otherwise>
                <script>
                    window.location.href = JSP_PATH + "/login";
                </script>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${path_.contains('/') || path_.contains(index_) || path_.contains(main_)}">
                <%@include file="/Pages/index.jsp"%>
            </c:when>
            <c:otherwise>
                <%@include file="/Components/content-error.jsp"%>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
<%@include file="/Components/content-footer.jsp"%>
</body>
<script src="./js/StartupHelpers.js"></script>
<script src="./js/jquery.js"></script>
<script src="./js/bootstrap.bundle.js"></script>

<script src="./js/swal.js"></script>
<script src="./js/GeneralHelpers.js"></script>

<script src="./js/intro.js"></script>
<script>

    setTimeout(()=>{
        if( window.location.pathname.includes("/lar")   ||
            window.location.pathname.includes("/login") ||
            window.location.pathname.includes("/register") ) return;
        var _forw = localStorage.getItem("lilac-forward");
        if(_forw == null || _forw == "" || _forw == undefined) return;
        localStorage.setItem("lilac-forward", "");
        jslink(JSP_PATH + _forw, "_self");

    }, 100);

    function origSwal(...args){
        swal(...args);
    }
</script>

</html>
