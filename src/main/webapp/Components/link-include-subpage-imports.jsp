<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${pageContext.request.contextPath}" var="path" scope="application" />
<script>var JSP_PATH = parent.cascadingJSPPATH</script>
<link rel="stylesheet" type="text/css" href="${path}/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${path}/css/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="${path}/css/main.css">
<link rel="stylesheet" type="text/css" href="${path}/output.css">

<script src="<c:url value="/js/DomainPurchaseHelper.js"/>"></script>
<%--tailwindplaycdn--%>
<script>
    const detectPageItems = () => {
        var Expires = document.getElementsByClassName('exp-item'),
            Domains = document.getElementsByClassName('doman');

        for(var eSpan of Expires){
            if(isThisDateExpiresIn30(eSpan))
                if(isThisDomainHasSharp(eSpan.parentElement.parentElement.firstElementChild.firstElementChild))
                    eSpan.classList.add('danger');
        }

        for(var dSpan of Domains){
            if(isThisDomainHasSharp(dSpan)) dSpan.classList.add('able');
            else dSpan.classList.add('warn');
        }

    }

    const isThisDateExpiresIn30 = (span) => {
        var domDate = new Date(span.innerHTML),
            nowDate = parent.pageDate;
        if(Math.abs(domDate.getTime() - nowDate.getTime()) <= 2592000 * 1000) return true;
        else return false;
    }

    const isThisDomainHasSharp = (span) => {
        if(span.innerHTML.includes("#")) {
            span.innerHTML = span.innerHTML.replace("#", "");
            return true;
        }
        else return false;
    }

    const swal = (...args) => {
        parent.origSwal(...args);
    }
</script>

<style>
    .button-disable{
        background-color: rgba(158,162,160,0.55) !important;
        text-decoration: line-through !important;
        pointer-events: none !important;
        cursor: not-allowed;

    }
    .button-disable:hover::after{
        position: fixed;
        background-color: darkgray;
        border: transparent 1px solid;
        border-radius: .5rem;
        padding: 3px 5px;
        content: 'disabled.';
    }

</style>

<script>
    const alertt = (txt, ...args) => {
        parent.alertt(txt, ...args)
    }
    var idarkbool = parent.darkBool;

    function DarkSwitch (n = false) {
        if(n){
            document.documentElement.classList.add('dark');
            localStorage.setItem('theme', 'dark');
            idarkbool = false;

        }else{
            document.documentElement.classList.remove('dark');
            localStorage.setItem('theme', 'light');
            idarkbool = true;

        }
        console.log('iframe switch dmode to: ' + n + ', while idarkbool is: ' + idarkbool);

    }
    window.onload = () => {
        // localStorage.setItem('theme', '');
        DarkSwitch(idarkbool);
    }
</script>
