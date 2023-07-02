<%@include file="link-include-subpage-imports.jsp"%>
<script>DarkSwitch(parent.darkBool)</script>
<body class="bg-transparent text-zinc-900 dark:text-zinc-50 transition-all">
    <div class="m-1.5 p-1.5 bg-transparent transition-all">
        <h1  class="font-mono text-3xl font-bold p-1.5">Trade Log View_</h1>
        <table class="mt-2.5 table  table-striped transition-all w-full
                        stab-table shadow rounded border-separate
                        bg-slate-100 dark:bg-slate-600 border-spacing-2
                        dark:text-zinc-100 text-zinc-900 hover:shadow-lg hover:bg-slate-200 hover:dark:bg-slate-700
                        " >
            <thead>
            <tr class="rounded bg-opacity-30">
                <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">ID</td>
                <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Buyer</td>
                <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Domain</td>
                <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Price</td>
                <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Type</td>
                <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Info</td>
            </tr>
            </thead>
            <tbody id="tradelog-tbody">
            <tr class="my-1.5"> </tr>
            <c:forEach items="${page.list}" var="log">
                <tr class="rounded border-0 hover:border-2 transition-all">
                    <td class="rounded border-0 text-left"><c:out value="${log.id}" /></td>
                    <td class="rounded border-0 text-left"><c:out value="${log.purchaser.userName}" /></td>
                    <td class="rounded border-0 "><c:out value="${log.domain.domainName}" /></td>
                    <td class="rounded border-0 price"><c:out value="${log.domain.price}" /></td>
                    <td class="rounded border-0 "><c:out value="${log.orderType}" /></td>
                    <td class="rounded border-0 "><c:out value="${log.detail}" /></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:set value="${page.hasPreviousPage}" var="hasprev_tran" scope="request" />
        <c:set value="${page.hasNextPage}" var="hasnext_tran" scope="request" />
        <div class="grid grid-cols-9 gap-1" id="trade-pagination">
            <div class="col-start-2">
<%--                 , ${hasprev_tran? __ : disabledh}--%>
            </div>
            <div class="text-center align-middle " id="trade-prev" title="${hasprev_tran? _change_ : disabledh}">
                <a class="my-auto h-full ${hasprev_tran? bena : bdis} rounded text-xl text-zinc-900 dark:text-zinc-50 btn shadow hover:shadow-lg"
                   href="${path}/admin-cont/trade/page/${page.prePage}"
                >&larr;</a>
            </div>
            <div class="col-span-3" id="trade-page">
                <input type="text" value=""
                       placeholder="${page.pageNum} / ${page.pages}"
                       class="form-control bg-zinc-50 dark:bg-zinc-700 text-center text-zinc-900 dark:text-zinc-50" id="queryTradePage" />
            </div>
            <div class="text-center align-middle  " id="trade-next" title="${hasnext_tran? _change_ : disabledh}">
                <a class="my-auto h-full ${hasnext_tran? bena : bdis} rounded text-zinc-900 dark:text-zinc-50 text-xl btn shadow hover:shadow-lg"
                   href="${path}/admin-cont/trade/page/${page.nextPage}">&rarr;</a>
            </div>
            <div class=""></div>
        </div>

        <script>
            var PaginationInput_Trade = document.getElementById('queryTradePage'),
                PagiTable_Trade = document.getElementById('tradelog-tbody');
            var CurrentQueryPage_Trade = ${page.pageNum},
                QueryTotalPages_Trade = ${page.pages};

            window.onload = () => {
                setPageInput();
            }

            const setPageInput = () => {
                PaginationInput_Trade.setAttribute('placeholder', '${page.pageNum} / ${page.pages}');
            }

            PaginationInput_Trade.addEventListener('blur', (e)=>{
                // on blur, save query-to to CQPD, make value to null and placeholder to "CQPD / QueryTotalPages"...
                CurrentQueryPage_Trade = (PaginationInput_Trade.value <= 0 ? 1 : PaginationInput_Trade.value);
                PaginationInput_Trade.value = "";
                PaginationInput_Trade.setAttribute('placeholder', CurrentQueryPage_Trade + ' / ' + QueryTotalPages_Trade);
                window.location = '${path}/admin-cont/trade/page/' + CurrentQueryPage_Trade;
            });
        </script>
        <br>
    </div>

</body>

