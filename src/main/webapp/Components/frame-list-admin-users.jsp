<%@include file="link-include-subpage-imports.jsp"%>
<script>DarkSwitch(parent.darkBool)</script>
<body class="bg-transparent text-zinc-900 dark:text-zinc-50 transition-all">
<div class="m-1.5 p-1.5 bg-transparent transition-all">
    <h1  class="font-mono text-3xl font-bold p-1.5">All-Users_</h1>
    <table class="mt-2.5 table  table-striped transition-all w-full
                        stab-table shadow rounded border-separate
                        bg-slate-100 dark:bg-slate-600 border-spacing-2
                        dark:text-zinc-100 text-zinc-900 hover:shadow-lg hover:bg-slate-200 hover:dark:bg-slate-700
                        " >
        <thead>
        <tr class="rounded bg-opacity-30">
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">ID</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Name</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">@</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Bal.</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Type</td>
            <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Act</td>
        </tr>
        </thead>
        <tbody id="userlog-tbody">
        <tr class="my-1.5"> </tr>
        <c:forEach items="${page.list}" var="log">
            <tr class="rounded border-0 hover:border-2 transition-all">
                <td class="rounded border-0 text-left"><c:out value="${log.id}" /></td>
                <td class="rounded border-0 text-left"><c:out value="${log.userName}" /></td>
                <td class="rounded border-0 "><c:out value="${log.email}" /></td>
                <td class="rounded border-0 price"><c:out value="${log.balance}" /></td>
                <td class="rounded border-0 "><c:out value="${(log.status == 2 ? __admin : (log.status == 1 ? __user : __ban ) )}" /></td>
                <td class="rounded border-0 "><a href="javascript:AdBan(${log.id})">Sw. Ban</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:set value="${page.hasPreviousPage}" var="hasprev_tran" scope="request" />
    <c:set value="${page.hasNextPage}" var="hasnext_tran" scope="request" />
    <div class="grid grid-cols-9 gap-1" id="user-pagination">
        <div class="col-start-2">
            <script>
                const AdBan = (id) => {
                    var adban = new XMLHttpRequest(), _comsent = false;
                    adban.open('post', JSP_PATH + '/admin-cont/ban');
                    adban.onreadystatechange = () => {
                        if(!_comsent) return;
                        var _keepResp = adban.responseText;
                        if(_keepResp.includes('ex')) return alertt('Error occured while switching ban and unban.');
                        else setTimeout(() => {
                            window.location.reload();
                        }, 345);
                        // if(_keepResp.includes('done'))
                        //else alertt(_keepResp, "result", "warning");
                    }
                    adban.send(id);
                    _comsent = true;
                }
            </script>
        </div>
        <div class="text-center align-middle " id="user-prev" title="${hasprev_tran? _change_ : disabledh}">
            <a class="my-auto h-full ${hasprev_tran? bena : bdis} rounded text-xl text-zinc-900 dark:text-zinc-50 btn shadow hover:shadow-lg"
               href="${path}/admin-cont/user/page/${page.prePage}"
            >&larr;</a>
            <%--      ${hasprev_tran? __ : disabledh}    onclick="userSetpage('${path}/user/page/${page.prePage}')"  --%>
        </div>
        <div class="col-span-3" id="user-page">
            <input type="text" value=""
                   placeholder="${page.pageNum} / ${page.pages}"
                   class="form-control bg-zinc-50 dark:bg-zinc-700 text-center text-zinc-900 dark:text-zinc-50" id="queryuserPage" />
        </div>
        <div class="text-center align-middle  " id="user-next" title="${hasnext_tran? _change_ : disabledh}">
            <a class="my-auto h-full ${hasnext_tran? bena : bdis} rounded text-zinc-900 dark:text-zinc-50 text-xl btn shadow hover:shadow-lg"
               href="${path}/admin-cont/user/page/${page.nextPage}">&rarr;</a>
        </div>
        <div class=""></div>
    </div>

    <script>
        var PaginationInput_user = document.getElementById('queryuserPage'),
            PagiTable_user = document.getElementById('userlog-tbody');
        var CurrentQueryPage_user = ${page.pageNum},
            QueryTotalPages_user = ${page.pages};

        window.onload = () => {
            setPageInput();
        }

        const setPageInput = () => {
            PaginationInput_user.setAttribute('placeholder', '${page.pageNum} / ${page.pages}');
        }

        PaginationInput_user.addEventListener('blur', (e)=>{
            // on blur, save query-to to CQPD, make value to null and placeholder to "CQPD / QueryTotalPages"...
            CurrentQueryPage_user = (PaginationInput_user.value <= 0 ? 1 : PaginationInput_user.value);
            PaginationInput_user.value = "";
            PaginationInput_user.setAttribute('placeholder', CurrentQueryPage_user + ' / ' + QueryTotalPages_user);
            window.location = '${path}/admin-cont/user/page/' + CurrentQueryPage_user;
        });
    </script>
    <br>
</div>

</body>

