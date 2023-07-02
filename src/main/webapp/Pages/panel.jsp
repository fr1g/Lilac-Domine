<%@ page import="com.lilac.pojo.User" %>

<c:set scope="application" var="_adm" value="Admin"></c:set>
<c:set scope="application" var="_nor" value="User"></c:set>
<div class="container m-0 w-full h-fit mx-auto px-0 lg:px-8 mt-20 top-20 lgmin"  >
<script>
    window.pageDate = new Date();
    var thisCountAutoRenew, thisCountAboutExpire, thisOwnCount, thisBalance,
        startStageRequest = new XMLHttpRequest();
        const applyUserCounts = () => {
            if(!startStageRequest.responseText.includes("$") && startStageRequest.readyState != 4)
            {console.error('receive init infos error.'); return;}
            var counts = startStageRequest.responseText.split("$");
            thisCountAutoRenew = parseInt(counts[0]);
            thisCountAboutExpire = parseInt(counts[1]);
            thisOwnCount = parseInt(counts[2]);
            document.getElementById('owns').innerHTML = thisOwnCount;
        }
        startStageRequest.open('post', JSP_PATH + '/user/startstage');
        startStageRequest.onreadystatechange = applyUserCounts;
        startStageRequest.send();
</script>
    <div class="h-fit grid grid-cols-12 gap-1 bg-zinc-100 dark:bg-zinc-600 justify-center justify-items-center shadow-xl hover:shadow-2xl rounded-lg transition-all">

        <div class="col-span-full lgmin lg:block grid grid-cols-7 gap-0.5 p-1.5 px-0 lg:col-span-2 shadow transition-all hover:shadow-xl bg-slate-100 dark:bg-slate-600  w-full rounded-l-lg rounded-r-lg lg:rounded-r-none" id="tbar" >
            <h1 class="py-1.5 unselect px-2 text-2xl mb-1.5 font-bold font-mono border-b-2 hidden lg:block">
                Control Panel_
            </h1>

            <h1 class="py-2 px-3 text-xl unselect col-span-full w-full" id="user-info">
                <img src="./src/img/logo.png" class="rounded-full inline border w-1/6 lg:w-1/4" />
                <%!
                    User _currUser;
                %>
                <%
                    _currUser = (User)session.getAttribute("USER_SESSION");
                %>
                <div class="overflow-x-hidden  ml-0.5 text-center max-w-min inline-block  border-b-4 w-28 border-b-indigo-400 border-spacing-1">
                        <span class="font-light elop   inline-block filter  h-full drop-shadow border-b" id="usrname">
                             <%=_currUser.getUserName()%>
                        </span>
                </div>
                <div class="ml-1.5 lg:ml-0 inline-block">
                    <span class="badge badge-info text-sm font-light mt-1.5 badge-sm badge-pill " id="group">
                        <!-- style="top: 0px; left: 0px; transform: translate(-10px, -10px);" -->
                        <%=_currUser.getStatus().toString().contains("2") ? "Admin" : "User"%>
                    </span>

                    <span class="badge badge-primary text-sm font-light mt-1.5 badge-sm badge-pill " id="fund-tag">
                            Br:<b class="balance font-sans font-normal" id="balance">--</b>
                        </span>
                            <script>
                                thisBalance = "0.0"; // !!!
                                var queryBalance = new XMLHttpRequest();
                                const pushBalance = () => {
                                    if(!sentBalQue) return;
                                    else {
                                        thisBalance = queryBalance.responseText;
                                        document.getElementById('balance').innerHTML = thisBalance;
                                    }
                                }
                                var sentBalQue = false;
                                queryBalance.open('post', JSP_PATH + '/user/getfund');
                                queryBalance.onreadystatechange = pushBalance;
                                queryBalance.send();
                                sentBalQue = true;
                            </script>
                    <span class="badge badge-success text-sm font-light mt-1.5 badge-sm badge-pill " >
                            <b class="owns font-sans font-normal" id="owns">
                                --
                            </b>
                        </span>

                </div>
            </h1>
            <br class="hidden lg:block">
            <h1 class="lg:py-2.5 lmn  unselect lg:px-3 px-1 py-0.5 text-xl bg-slate-100 dark:bg-slate-500 hover:bg-sky-100 dark:hover:bg-sky-800 border-t w-full transition-all"
                onclick="updateOverview()" id="over">
                <span class="inline-block inners">Overview</span>
            </h1>

            <h1 class="lg:py-2.5 lmn unselect lg:px-3 px-1 py-0.5 text-xl bg-slate-100 dark:bg-slate-500 hover:bg-sky-100 dark:hover:bg-sky-800 border-t w-full transition-all"
                onclick="UpdatePageDate()" id="doma">
                <span class="inline-block inners">Domains</span>
            </h1>

            <h1 class="lg:py-2.5 lmn unselect lg:px-3 px-1 py-0.5 text-xl bg-slate-100 dark:bg-slate-500 hover:bg-sky-100 dark:hover:bg-sky-800 border-t w-full transition-all"
                onclick="" id="docs">
                <span class="inline-block inners">Docs.</span>
            </h1>
    <c:if test="${USER_.status == 2}">

            <h1 class="lg:py-2.5 lmn hidden unselect lg:px-3 px-1 py-0.5 text-xl bg-slate-100 dark:bg-slate-500 hover:bg-sky-100 dark:hover:bg-sky-800 border-t w-full transition-all"
                onclick="" id="ords">
                <span class="inline-block inners">Orders*</span>
            </h1>

            <h1 class="lg:py-2.5 lmn hidden unselect lg:px-3 px-1 py-0.5 text-xl bg-slate-100 dark:bg-slate-500 hover:bg-sky-100 dark:hover:bg-sky-800 border-t w-full transition-all"
                onclick="" id="usrs">
                <span class="inline-block inners">Users*</span>
            </h1>

            <h1 class="lg:py-2.5 lmn hidden unselect lg:px-3 px-1 py-0.5 text-xl bg-slate-100 dark:bg-slate-500 hover:bg-sky-100 dark:hover:bg-sky-800 border-t w-full transition-all"
                onclick="" id="arch">
                <span class="inline-block inners">Archwork*</span>
            </h1>

    </c:if>

            <h1 class="lg:py-2.5 lmn unselect lg:px-3 px-1 py-0.5 text-xl bg-slate-100 dark:bg-slate-500 hover:bg-sky-100 dark:hover:bg-sky-800 border-y w-full transition-all"
                onclick="" id="hlpd">
                <span class="inline-block inners">Helpdesk</span>
            </h1>

        </div>
        <div class="col-span-full lg:col-span-10 w-full min-h-60 lg:min-h-full" id="display">
            <div id="content-main" class="displayd p-1 lg:p-3.5 sh min-h-60 lg:min-h-full">
                <h1 class="font-mono text-3xl font-bold p-1.5">
                    Welcome to the Control Panel!_
                </h1><br>
                <p class="text-lg font-mono font-semibold p-1 first-letter:text-xl indent-6">
                    Here you can manage your domains that registered on our site, add or remove DNS recording, add your fund, buying new ones, and more...
                </p>
                <p class="text-lg font-mono font-semibold p-1 first-letter:text-xl indent-6">
                    Start your operations from clicking the Tags on the <code class="inline lg:hidden">Top</code><code class="hidden lg:inline">Left</code>...
                </p>
                <p class="text-lg font-mono font-semibold p-1 first-letter:text-xl indent-6">
                    Need help? Send your issue by using our <a href="javascript:document.getElementById('hlpd').click()" class="text-info font-sans">Helpdesk &rarr;</a>
                </p>
                <div class=" border rounded-lg shadow-lg hover:shadow-xl p-9 px-11 m-6 transition-all
                    bg-slate-100 bg-opacity-30 dark:bg-opacity-40 hover:bg-opacity-50 hover:dark:bg-opacity-60
                    text-stone-800 dark:text-zinc-100
                    "   id="ad-dioxide-1">
                        <span class="badge bg-zinc-300 border px-2 py-1 absolute float-left bg-opacity-50"
                              style="transform: translate(-36px, -29px);">AD</span>
                    <div class=" grid grid-cols-3 gap-2 ">
                        <h4 class="text-4xl font-sans col-span-full md:col-span-2">
                            A global network built for the cloud
                        </h4>
                        <p class="text-right col-span-full md:col-span-1" >
                            <svg class="inline-block m-0 " width="602" height="203" viewBox="0 0 602 203" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: auto; height: 40px; clip-path: 3px;"><path d="M510.338 128.167L511.809 123.081C513.562 117.031 512.91 111.438 509.969 107.329C507.262 103.544 502.752 101.315 497.274 101.056L393.528 99.7432C393.206 99.7369 392.89 99.655 392.606 99.504C392.321 99.353 392.077 99.1373 391.891 98.8742C391.71 98.6023 391.594 98.2918 391.553 97.9674C391.513 97.6429 391.549 97.3135 391.658 97.0053C391.836 96.4971 392.159 96.0521 392.587 95.7254C393.016 95.3987 393.53 95.2045 394.068 95.1668L498.775 93.8398C511.196 93.2698 524.644 83.1988 529.352 70.9178L535.323 55.3265C535.568 54.6672 535.624 53.9529 535.485 53.2637C528.705 22.7889 501.487 0 468.944 0C438.96 0 413.501 19.3385 404.369 46.2179C398.198 41.5895 390.504 39.4618 382.83 40.2608C368.445 41.6882 356.879 53.2613 355.455 67.6379C355.09 71.2277 355.357 74.8538 356.246 78.3513C332.747 79.0358 313.902 98.2738 313.902 121.922C313.905 124.033 314.061 126.141 314.369 128.23C314.437 128.712 314.676 129.154 315.043 129.475C315.41 129.796 315.881 129.974 316.368 129.977L507.902 130.001C507.92 130.002 507.938 130.002 507.956 130.001C508.498 129.991 509.022 129.808 509.451 129.478C509.88 129.147 510.191 128.688 510.338 128.167Z" fill="#F6821F"></path><path d="M544.899 56.4571C543.938 56.4571 542.98 56.4813 542.026 56.5295C541.872 56.5405 541.721 56.5736 541.577 56.6277C541.327 56.7131 541.101 56.8578 540.919 57.0494C540.737 57.241 540.604 57.4739 540.532 57.728L536.453 71.8078C534.699 77.8584 535.351 83.4464 538.295 87.5556C541 91.3448 545.51 93.5688 550.987 93.8281L573.104 95.155C573.415 95.1653 573.719 95.2479 573.993 95.3963C574.266 95.5448 574.501 95.7549 574.679 96.0101C574.863 96.2834 574.98 96.5959 575.02 96.9225C575.061 97.2492 575.024 97.5808 574.913 97.8906C574.735 98.3978 574.412 98.842 573.985 99.1686C573.558 99.4951 573.044 99.69 572.508 99.7292L549.528 101.056C537.051 101.631 523.606 111.697 518.902 123.978L517.242 128.314C517.173 128.495 517.147 128.69 517.168 128.883C517.189 129.076 517.255 129.262 517.362 129.424C517.469 129.586 517.612 129.721 517.781 129.817C517.95 129.912 518.14 129.967 518.334 129.975C518.355 129.975 518.374 129.975 518.395 129.975H597.467C597.927 129.979 598.375 129.833 598.744 129.558C599.112 129.283 599.381 128.896 599.508 128.454C600.909 123.459 601.617 118.296 601.612 113.108C601.603 81.8228 576.215 56.4571 544.899 56.4571Z" fill="#FBAD41"></path><path d="M66.9595 153.39H80.4491V190.214H104.022V202.024H66.9595V153.39Z" fill="#222222"></path><path d="M117.993 177.847V177.709C117.993 163.744 129.257 152.416 144.276 152.416C159.295 152.416 170.418 163.604 170.418 177.569V177.709C170.418 191.674 159.152 202.995 144.138 202.995C129.124 202.995 117.993 191.812 117.993 177.847ZM156.65 177.847V177.709C156.65 170.701 151.577 164.575 144.138 164.575C136.767 164.575 131.829 170.551 131.829 177.569V177.709C131.829 184.718 136.905 190.841 144.276 190.841C151.715 190.841 156.65 184.865 156.65 177.847Z" fill="#222222"></path><path d="M186.928 180.695V153.388H200.626V180.419C200.626 187.427 204.173 190.77 209.594 190.77C215.016 190.77 218.562 187.575 218.562 180.765V153.388H232.262V180.34C232.262 196.043 223.294 202.918 209.456 202.918C195.618 202.918 186.928 195.91 186.928 180.688" fill="#222222"></path><path d="M252.906 153.392H271.679C289.064 153.392 299.145 163.396 299.145 177.429V177.571C299.145 191.602 288.924 202.026 271.403 202.026H252.906V153.392ZM271.89 190.07C279.958 190.07 285.307 185.631 285.307 177.77V177.632C285.307 169.853 279.958 165.335 271.89 165.335H266.396V190.074L271.89 190.07Z" fill="#222222"></path><path d="M318.75 153.39H357.686V165.204H332.24V173.469H355.254V184.654H332.24V202.024H318.75V153.39Z" fill="#222222"></path><path d="M376.457 153.39H389.946V190.214H413.519V202.024H376.457V153.39Z" fill="#222222"></path><path d="M448.768 153.042H461.766L482.489 202.024H468.027L464.478 193.338H445.703L442.229 202.024H428.045L448.768 153.042ZM460.586 182.849L455.162 169.021L449.668 182.849H460.586Z" fill="#222222"></path><path d="M499.865 153.388H522.879C530.323 153.388 535.464 155.336 538.732 158.67C541.587 161.45 543.045 165.211 543.045 169.998V170.135C543.045 177.567 539.071 182.501 533.032 185.07L544.645 202.026H529.065L519.262 187.294H513.354V202.026H499.865V153.388ZM522.255 176.735C526.844 176.735 529.488 174.511 529.488 170.967V170.829C529.488 167.007 526.706 165.064 522.182 165.064H513.354V176.744L522.255 176.735Z" fill="#222222"></path><path d="M562.508 153.39H601.652V164.856H575.86V172.217H599.223V182.849H575.86V190.562H602V202.024H562.508V153.39Z" fill="#222222"></path><path d="M37.425 183.547C35.536 187.815 31.5615 190.838 26.2802 190.838C18.9065 190.838 13.8333 184.724 13.8333 177.707V177.567C13.8333 170.558 18.7686 164.573 26.14 164.573C31.6971 164.573 35.9287 167.989 37.7149 172.635H51.9339C49.6568 161.06 39.4776 152.418 26.2802 152.418C11.2593 152.418 0 163.753 0 177.707V177.845C0 191.81 11.1214 203 26.14 203C38.9867 203 49.0279 194.688 51.6768 183.549L37.425 183.547Z" fill="#222222"></path></svg>
                        </p>
                        <p class="col-span-full mt-2">
                            <b class="mr-2 indent-4">Cloudflare is a global network designed to make everything you connect to the Internet secure, private, fast, and it's reliable.</b>
                            - Secure your websites, APIs, and Internet applications, Protect corporate networks, employees, and devices, Write and deploy code that runs on the international network edge.
                            <a href="https://cloudflare.com" class="text-sky-500 transition-all" target="_blank">Detail-&gt;</a>
                        </p>
                    </div>
                </div>

            </div>
            <div id="content-over" class="displayd p-1 lg:p-3.5 hidden transition-all">
                <%@include file="/Components/assembly-overview.jsp" %>
            </div>
            <div id="content-doma" class="displayd p-1 lg:p-3.5 hidden  h-full transition-all w-full ">
                <h1 class="font-mono text-2xl font-bold p-1.5 clear-both">Your Domains_ <span
                        class="text-sm">(for now)</span> <span class="float-right font-normal text-sm"
                                                               title="YYYY mm.DD">Page Date: <span id="page-date">--</span>
                    <script>const UpdatePageDate = () => {
                        pageDate = new Date();
                        document.getElementById('page-date').innerHTML = (pageDate.getFullYear() + ' ' + (pageDate.getMonth() + 1) + '. ' + pageDate.getDate());
                    }</script>

                </span>
                    <br><span class="text-sm font-sans font-light"><span class="able">AutoRenew ON</span> |<span class="warn">AutoRenew OFF</span> |<span class="danger">About to EXPIRE</span></span></h1>
                <iframe class="w-full border-b-2 border-dashed lg:border-none  bg-transparent p-1.5 h-96 lg:h-2/3 overflow-hidden" src="${path}/query/own-domain/1">

                </iframe>
            </div>
            <div id="content-docs" class="displayd p-1 lg:p-3.5 hidden transition-all">
                <h1 class="font-mono text-3xl font-bold p-1.5">
                    Easy-up Documentation.
                </h1><br>
                <p>Remember, if there's nothing useful in the documentation, you should contact us!</p>
                <%@include file="/Components/content-helplinks.jsp"%>
            </div>

<%--            Administrator Functions Front-end Filter... --%>
            <c:if test="${USER_.status == 2}">
                <div id="content-ords" class="displayd h-full p-1 lg:p-3.5 hidden transition-all">
<%--                    <%@include file="/Components/frame-list-admin-trades.jsp"%>--%>
                    <iframe src="${path}/admin-cont/trade/page/1" class="w-full h-full bg-transparent p-1.5 min-h-full  h-96 lg:h-2/3 overflow-hidden">

                    </iframe>
                </div>
                <div id="content-usrs" class="displayd h-full p-1 lg:p-3.5 hidden transition-all">
                    <iframe src="${path}/admin-cont/user/page/1" class="w-full h-full bg-transparent p-1.5 min-h-full  h-96 lg:h-2/3 overflow-hidden">

                    </iframe>
                </div>
                <div id="content-arch" class="displayd h-full p-1 lg:p-3.5 hidden transition-all">
                    This is the Archwork Station. Here you may edit docs and reply/process the Helpdesk Requests.
                    <br>
                    <div style="height: 96%">
                        <%@include file="/Components/assembly-archwork.jsp"%>
                    </div>
<%--                    This one is different: it includes assembly-archwork.jsp, to include a tag-based multi-iframe including... --%>
                </div>
            </c:if>

            <div id="content-hlpd" class="displayd p-1 lg:p-3.5 hidden transition-all">
                <div class="shown transition-all " id="overn">
                    <div style="overflow-y: auto;" id="cload" height="100%" width="100%" class="transition-all dark:text-gray-100 ">
                        <div class="transition-all my-5"></div>
                        <div class="transition-all animate-spin my-3 mx-auto loader bg-gradient-to-r" viewbox="0 0 24 24"></div>
                        <h2 class="transition-all dark:text-gray-100 text-center font-semibold my-3" style="font-size: xx-large;">Loading...</h2>
                    </div>
                </div>
                <div class="hidden transition-all " id="latern">
                    <h1 class="font-mono text-3xl font-bold p-1.5 clearfix">
                        Sorry_ <span class="float-right">:&lpar;</span>
                    </h1>
                    <p class="text-lg font-sans ">The Helpdesk is not ready yet.</p>
                    <p class="text-lg font-sans ">For now, you can contact us for help by using <a  id="fake_email"
                                                                                                    class="text-sky-500 transition-all"
                                                                                                    href="javascript:erralert();"
                                                                                                    title="mailto:114@lilac.yun"
                    >Email</a></p>
                </div>

                <script>
                    var overlay = document.getElementById('overn'),
                        actualay = document.getElementById('latern'),
                        shownOnce = false;
                    document.getElementById('hlpd')
                        .addEventListener('click',
                            () => {
                                if (shownOnce) return;
                                else {
                                    shownOnce = true;
                                    setTimeout(() => {
                                        overlay.classList.replace('shown', 'hidden');
                                        actualay.classList.replace('hidden', 'shown');
                                    }, 1919);
                                }
                            });


                </script>

            </div>
        </div>

    </div>

</div>
<style>

    .show{
        display: block !important;
        animation: eai .3s ease-in ;
        z-index: 25;
    }
    .show::after{
        display: block !important;
    }
    @keyframes eai {
        0%{opacity: 0%}
        100%{opacity: 100%}
    }
    @keyframes eao {
        0%{opacity: 100%}
        100%{opacity: 0%}
    }

    .hid{
        animation: eao .3s ease-out;
        display: none;
    }

</style>
<div class=" z-30 top-0 hid " style="width: 100vw; height: 100vh; " id="pop">
    <div class="fixed bg-black opacity-40 w-full h-full top-0" id="drop-pop"></div>
    <div class=" mx-auto top-0 left-0 absolute right-0 w-2/3 transition-all z-30 mt-28 "  id="intension">
        <%@include file="/Components/dialog-container.jsp"%>
    </div>
<%--    <div class="" style="" id="pop"></div>--%>
</div>

<script>
    var pop_win = document.getElementById('pop'), drop_pop = document.getElementById('drop-pop');
    pop_win.addEventListener('click', (e) => {
        if(e.target.id != 'drop-pop' ) return;
        kill_pop();
    }, false);
    drop_pop.addEventListener('click', (e) => {
        kill_pop();
    }, false);
    const kill_pop = () => {
        pop_win.classList.add('hid');
        setTimeout(()=>{
            pop_win.classList.remove('show');
            window.location.href = JSP_PATH + '/panel';
            }, 300);
        //console.log(e.target);
    }

    const show_pop = () => {
        pop_win.classList.replace('hid', 'show');
    }

    if(POP_UP_TARGET.includes("#addfund")){
        show_pop();
        document.getElementById('addfund-').classList.replace('hidden', 'block');
        document.getElementById('pop-top-title').innerHTML = "Add Fund";
    }else if(POP_UP_TARGET.includes("#renew")){
        show_pop();
        document.getElementById('renew-').classList.replace('hidden', 'block');
        document.getElementById('pop-top-title').innerHTML = "Renew";
    }else if(POP_UP_TARGET.includes("#new")){
        show_pop();
        document.getElementById('new-').classList.replace('hidden', 'block');
        document.getElementById('pop-top-title').innerHTML = "Buy New";
    }

    function RenewHandler(domain) {
        window.location = window.location + "#renew" + "!" + domain.replace("#", "");
        window.location.reload();
    }

    //
    document.getElementById('owns').innerHTML = thisOwnCount;

</script>