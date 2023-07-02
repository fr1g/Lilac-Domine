<%@include file="link-include-subpage-imports.jsp"%>
<%@page import="com.lilac.pojo.DomainInfo" %>
<script>DarkSwitch(parent.darkBool)</script>

<%--something wrong made it need to re-import rather than using include--%>


<body class="bg-transparent text-zinc-900 dark:text-zinc-50 transition-all">
<div class="m-1.5 p-1.5 bg-transparent transition-all">
    <h1  class="font-mono text-lg font-semibold p-1">Activated Domain List_</h1>

    <table class="mt-0.5 table  table-striped transition-all w-full
          stab-table shadow rounded border-separate table-fixed
          bg-slate-100 dark:bg-slate-600 border-spacing-1
          dark:text-zinc-100 text-zinc-900 hover:shadow-lg hover:bg-slate-200 hover:dark:bg-slate-700
          " >
        <thead>
        <tr class="rounded bg-opacity-30">
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Domain</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Ex/Cr&Lr(h)</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Cur.Payer</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Price</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Acts.</td>
        </tr>
        </thead>
        <tbody id="dtba">
        <tr class="my-1.5"> </tr>
        <c:forEach items="${page.list}" var="cont">
            <tr class="rounded">
                <td class="rounded border-0 text-left" title="id: ${cont.domainId}"><c:out value="${cont.domainName}" /></td>
                <td class="rounded border-0 text-left text-xs font-thin"
                    style="width: 10ch !important; overflow-x: scroll; overflow-y: hidden"
                    title="create: ${cont.createTime}, update: ${cont.updateTime}">
                    <c:out value="${cont.expireTime}" />
                </td>
                <td class="rounded border-0" title="...">
                    <c:out value="${cont.purchaserUserName}" />
                </td>
                <td class="rounded border-0 price"><c:out value="${cont.price}" /></td>
                <td class="rounded border-0 text-center w-min">
                    <button class="btn-sm my-0.5 transition-all btn-danger h-full"
                            onclick="AdminRemoveDomain(${cont.domainId}, ${cont.purchaserId})"
                            title="Remove this one domain.">&times;</button>
                    <button class="btn-sm my-0.5 transition-all btn-success h-full"
                            onclick="AdminRenewDomain(${cont.domainId})"
                            title="Renew this one for One month.">&plus;</button>
                </td>
            </tr>
        </c:forEach>
        <c:set value="${page.hasPreviousPage}" var="hasprev_tran" scope="request" />
        <c:set value="${page.hasNextPage}" var="hasnext_tran" scope="request" />
        </tbody>
        <script>
            const AdminRenewDomain = (did) => {
                var ard = new XMLHttpRequest(), ards = false;
                ard.open("post", JSP_PATH + "/domain/rea");
                ard.onreadystatechange = () => {
                    if(ards) alertt(ard.responseText);
                    setTimeout(() => {window.location.reload();}, 100);
                }
                ard.send(did);
                ards = true;
            }
            const AdminRemoveDomain = (did, uid) => {
                //var uid = parseInt(event.target.parentElement.parentElement.firstElementChild.nextElementSibling.nextElementSibling.getAttribute("title").replace("id: ", ""))
                parent.console.log(did + " uid: " + uid);
                parent.parentExecDomainDisable(did, uid);
            }
        </script>
    </table>
    <div class="grid grid-cols-9 gap-1" id="adomain-pagination">
        <div class="col-start-2"></div>
        <div class="text-center align-middle " id="adomain-prev" title="${hasprev_tran? _change_ : disabledh}">
            <a class="my-auto h-full ${hasprev_tran? bena : bdis} rounded text-xl text-zinc-900 dark:text-zinc-50 btn shadow hover:shadow-lg"
               href="${path}/admin-cont/domains/page/${page.prePage}"
            >&larr;</a>
        </div>
        <div class="col-span-3" id="adomain-page">
            <input type="text" value=""
                   placeholder="${page.pageNum} / ${page.pages}"
                   class="form-control bg-zinc-50 dark:bg-zinc-700 text-center text-zinc-900 dark:text-zinc-50" id="queryDomain-a" />
        </div>
        <div class="text-center align-middle  " id="adomain-next" title="${hasnext_tran? _change_ : disabledh}">
            <a class="my-auto h-full ${hasnext_tran? bena : bdis} rounded text-zinc-900 dark:text-zinc-50 text-xl btn shadow hover:shadow-lg"
               href="${path}/admin-cont/domains/page/${page.nextPage}">&rarr;</a>
        </div>
        <div class=""></div>
    </div>
</div>
</body>
<%--@code--%>
<script>

    var PaginationInput_aDomain = document.getElementById('queryDomain-a'),
        PagiTable_aDomain = document.getElementById('dtba');
    var CurrentQueryPage_aDomain = ${page.pageNum},
        QueryTotalPages_aDomain = ${page.pages};

    window.onload = () => {
        setPageInput();
    }

    const setPageInput = () => {
        PaginationInput_aDomain.setAttribute('placeholder', '${page.pageNum} / ${page.pages}');
    }

    PaginationInput_aDomain.addEventListener('blur', (e)=>{
        // on blur, save query-to to CQPD, make value to null and placeholder to "CQPD / QueryTotalPages"...
        CurrentQueryPage_aDomain = (PaginationInput_aDomain.value <= 0 ? 1 : PaginationInput_aDomain.value);
        PaginationInput_aDomain.value = "";
        PaginationInput_aDomain.setAttribute('placeholder', CurrentQueryPage_aDomain + ' / ' + QueryTotalPages_aDomain);
        window.location = '${path}/admin-cont/domains/page/' + CurrentQueryPage_aDomain;
    });
</script>
<% //TODO not finished: admin domain management %>