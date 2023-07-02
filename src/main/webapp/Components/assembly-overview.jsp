<h1 class="ml-1 pl-1 font-mono text-xl first-letter:text-2xl font-semibold mb-1.5">Overview_</h1>

<div class="grid grid-cols-5 gap-1 p-3.5 mb-1 text-lg lg:text-xl transition-all shadow-md hover:shadow-lg border-0 rounded-xl bg-zinc-300 dark:bg-stone-800 bg-opacity-30 hover:bg-opacity-20 dark:hover:bg-opacity-30 dark:bg-opacity-20" id="overviews-easy">
    <div class="onsc-title m-2 text-center bg-neutral-100 dark:bg-neutral-700 rounded-xl text-md lg:text-lg">Registered</div>
    <div class="onsc-title m-2 text-center bg-neutral-100 dark:bg-neutral-700 rounded-xl text-md lg:text-lg">UnderDate</div>
    <div class="onsc-title m-2 text-center bg-neutral-100 dark:bg-neutral-700 rounded-xl text-md lg:text-lg">Balance</div>
    <div class="onsc-title m-2 text-center bg-neutral-100 dark:bg-neutral-700 rounded-xl text-md lg:text-lg">AutoRenew</div>
    <div class="onsc-title m-2 text-center bg-neutral-100 dark:bg-neutral-700 rounded-xl text-md lg:text-lg">Tickets</div>
    <!--  -->
    <div class="pcs onsc-title p-2 text-center" id="regist-">Registered</div>
    <div class="pcs onsc-title p-2 text-center" id="underda-">UnderDate</div>
    <div class="balance onsc-title p-2 text-center" id="balance-">Balance</div>
    <div class="pcs onsc-title p-2 text-center" id="autore-">AutoRenew</div>
    <div class="tickets onsc-title p-2 text-center"> -- </div>

    <div class="col-span-full">
        <div class="progress h-7">
            <div id="auto-p" class="progress-bar progress-bar-animated  progress-bar-striped bg-info"></div>
            <div id="unauto-p" class="progress-bar progress-bar-animated progress-bar-striped bg-warning"></div>
            <div id="under-expire" class="progress-bar progress-bar-animated  progress-bar-striped bg-danger"></div>
            <%--                            <div class="progress-bar w-14 bg-transparent">...</div>--%>
        </div>
    </div>

    <script>
        const updateOverview = () => {
            document.getElementById('regist-').innerHTML = thisOwnCount;
            document.getElementById('balance-').innerHTML = thisBalance;
            document.getElementById('underda-').innerHTML = thisCountAboutExpire;
            document.getElementById('autore-').innerHTML = thisCountAutoRenew;

            document.getElementById('auto-p').style.width = (thisCountAutoRenew / thisOwnCount) * 100 + "%";
            document.getElementById('unauto-p').style.width = ((thisOwnCount - thisCountAutoRenew - thisCountAboutExpire) / thisOwnCount) * 100 + "%";
            document.getElementById('under-expire').style.width = (thisCountAboutExpire / thisOwnCount) * 100 + "%";

            //
            document.getElementById('owns').innerHTML = thisOwnCount;

        }
    </script>
</div>
<div class="m-1 p-1 mt-1.5">
    <h1 class="font-mono text-xl first-letter:text-2xl font-semibold mb-1">Getting Started_</h1>
    <ul>
        <li class="text-lg indent-6">Press button <code class="indent-0">Market</code> on the nav bar, and go buy your new domains.</li>
        <li class="text-lg indent-6">Press button <code class="indent-0">Logoff</code> on the nav bar, safely exit from this session.</li>
        <li class="text-lg indent-6">Press button <code class="indent-0"><i class="bi bi-moon indent-0"></i>/<i class="bi bi-sun indent-0"></i></code> on the nav bar, switch Light/Dark mode manually.</li>
        <li class="text-lg indent-6">Press button <code class="indent-0">Control</code> on the nav bar, back to this place anytime.</li>
        <li class="text-lg indent-6">Press button <code class="indent-0"><i class="bi bi-question-circle indent-0"></i></code> on the nav bar, request a help online!.</li>
        <li class="text-lg indent-6">Press button <code class="indent-0">Helpdesk</code> on the side bar, send us a ticket if you find something unsolvable!</li>
        <li class="text-lg indent-6">Try <code class="indent-0">Refresh</code> anytime if you think some content is not correct!</li>
    </ul>
</div>

