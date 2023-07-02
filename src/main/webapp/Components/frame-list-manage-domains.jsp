<%-- domain list for users. need internal-outernal control of front-end. need get time. --%>
<%@include file="link-include-subpage-imports.jsp"%>
<script>DarkSwitch(parent.darkBool)</script>
<body class="bg-transparent transition-all p-3">
    <table class="mt-2.5 table  table-striped transition-all w-full
                          stab-table shadow rounded border-separate
                          bg-slate-100 dark:bg-slate-600 border-spacing-2
                          dark:text-zinc-100 text-zinc-900 hover:shadow-lg hover:bg-slate-200 hover:dark:bg-slate-700
                          " >
        <thead>
        <tr class="rounded bg-opacity-30">
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Domain</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Expire</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Price</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Acts.</td>
        </tr>
        </thead>
        <tbody id="domain-tbody">
        <tr class="my-1.5"> </tr>
        <c:forEach items="${page.list}" var="cont">
            <tr class="rounded">
                <td class="rounded border-0 text-left"><span class="doman"><c:out value="${cont.domainName}" /></span></td>
                <td class="rounded border-0 text-left font-light font-mono text-sm"><span class="exp-item"><c:out value="${cont.expireTime}" /></span></td>
                <td class="rounded border-0 price"><c:out value="${cont.price}" /></td>
                <td class="rounded border-0 text-center w-min">
                    <button title="Switch Auto-Renew" class="btn-sm my-0.5 transition-all btn-primary h-full" onclick="SwitchAutoRenew('${cont.id}')">Sw.AR</button>
                    <button title="Renew" class="btn-sm my-0.5 transition-all btn-success h-full" onclick="RenewNow('${cont.domainName}')">Re</button>
<%--                    <button class="btn-sm my-0.5 transition-all btn-warning h-full rounded-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span></button>--%>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:set value="${page.hasPreviousPage}" var="hasprev_tran" scope="request" />
    <c:set value="${page.hasNextPage}" var="hasnext_tran" scope="request" />

    <div class="grid grid-cols-9 gap-1" id="domain-pagination">
        <div class="col-start-2"></div>
        <div class="text-center align-middle " id="domain-prev" title="${hasprev_tran? _change_ : disabledh}">
            <a class="my-auto h-full ${hasprev_tran? bena : bdis} rounded text-xl text-zinc-900 dark:text-zinc-50 btn shadow hover:shadow-lg"
               href="${path}/query/own-domain/${page.prePage}"
            >&larr;</a>
            <%--      ${hasprev_tran? __ : disabledh}    onclick="tradeSetpage('${path}/trade/page/${page.prePage}')"  --%>
        </div>
        <div class="col-span-3" id="trade-page">
            <input type="text" value=""
                   placeholder="${page.pageNum} / ${page.pages}"
                   class="form-control bg-zinc-50 dark:bg-zinc-700 text-center text-zinc-900 dark:text-zinc-50" id="queryOwnDomainPage" />
        </div>
        <div class="text-center align-middle  " id="domain-next" title="${hasnext_tran? _change_ : disabledh}">
            <a class="my-auto h-full ${hasnext_tran? bena : bdis} rounded text-zinc-900 dark:text-zinc-50 text-xl btn shadow hover:shadow-lg"
               href="${path}/query/own-domain/${page.nextPage}">&rarr;</a>
        </div>
        <div class=""></div>
    </div>
</body>
<%--@code--%>
<script>

    window.onload = () => {
        setTimeout(() => {
            detectPageItems();
        }, 800);
    }

    var PaginationInput_Domain = document.getElementById('queryOwnDomainPage'),
        PagiTable_Domain = document.getElementById('domain-tbody');
    var CurrentQueryPage_Domain = ${page.pageNum},
        QueryTotalPages_Domain = ${page.pages};
     PaginationInput_Domain.addEventListener('blur', (e)=>{
         // on blur, save query-to to CQPD, make value to null and placeholder to "CQPD / QueryTotalPages"...

         CurrentQueryPage_Domain = (PaginationInput_Domain.value <= 0 ? 1 : PaginationInput_Domain.value);
         PaginationInput_Domain.value = "";
         PaginationInput_Domain.setAttribute('placeholder', CurrentQueryPage_Domain + ' / ' + QueryTotalPages_Domain);
         window.location = '${path}/query/own-domain/' + CurrentQueryPage_Domain;

     });

     window.location.onchange = () => {console.log('change')}

</script>