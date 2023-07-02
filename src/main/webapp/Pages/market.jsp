<div class="container m-0 w-full mx-auto px-8 py-10" style="min-height: 100vh;">
    <div class="grid grid-cols-6 gap-5">
        <h1 class="text-4xl font-mono font-extrabold mb-4 mt-12 block col-span-full">
            Buy <span class="border-b-4 border-b-blue-300 pb-0.5 text-5xl">Domains</span> With DNS!_ <span class="float-right">;&rpar;</span></h1>

        <div class="col-span-full">
            <h3 class="text-3xl font-mono font-semibold my-3 first-letter:text-4xl indent-6 ">
                Search Domain You Want:_
            </h3>
            <form id="queryDomainStatInput">
                <div class="input-group input-group-lg my-2 rounded-lg">
                    <input type="text" placeholder="Input your prefer here_"  pattern=".+\..*"
                           required class="form-control rounded-lg mr-1" name="srchDomain" id="sdom" />

                    <button class="btn btn-primary rounded-lg" type="submit">Search Status!</button>
                </div>
            </form>

        </div>

        <div class="col-span-full lg:col-span-3">
            <h3 class="text-xl font-sans font-semibold mt-2 first-letter:text-2xl indent-6 ">
                ON SALE:
            </h3>
            <table class="mt-2 table  table-striped
                            merch-table shadow rounded border-separate transition-all
                            bg-slate-100 dark:bg-slate-600 border-spacing-2
                            dark:text-zinc-100 text-zinc-900 hover:shadow-lg hover:bg-slate-200 hover:dark:bg-slate-700
                            " >
                <thead>
                <tr class="rounded bg-opacity-30">
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Domain Root</td>
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Price</td>
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Action</td>
                </tr>
                </thead>
                <tbody >
                <tr class="my-2.5"> </tr>
                <tr class="rounded"  id="cn">
                    <td class="rounded border-0 text-left"><code>.cn</code> China National</td>
                    <td class="rounded border-0 price">19.49</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-info " onclick="BuyHook('.cn')" >Buy! &rarr;</button>
                        <button class="btn-sm my-0.5 transition-all btn-warning " onclick="alertt('Sorry but there\'s No Customer Service Online right now... Please help yourself. ')">Query <span class="bi bi-question-circle"></span></button>
                        <button class="btn-sm my-0.5 transition-all btn-primary ">About <span class="bi bi-stack"> </span></button>
                    </td>
                </tr>
                <tr class="rounded" id="su">
                    <td class="rounded border-0 text-left"><code>.su</code> Soviet National</td>
                    <td class="rounded border-0 price">5.9</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-info " onclick="BuyHook('.su')" >Buy! &rarr;</button>
                        <button class="btn-sm my-0.5 transition-all btn-warning " onclick="alertt('Sorry but there\'s No Customer Service Online right now... Please help yourself. ')">Query <span class="bi bi-question-circle"></span></button>
                        <button class="btn-sm my-0.5 transition-all btn-primary ">About <span class="bi bi-stack"> </span></button>
                    </td>
                </tr>
                <tr class="rounded" id="us">
                    <td class="rounded border-0 text-left"><code>.us</code> USA National</td>
                    <td class="rounded border-0 price">17.64</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-info " onclick="BuyHook('.us')" >Buy! &rarr;</button>
                        <button class="btn-sm my-0.5 transition-all btn-warning " onclick="alertt('Sorry but there\'s No Customer Service Online right now... Please help yourself. ')">Query <span class="bi bi-question-circle"></span></button>
                        <button class="btn-sm my-0.5 transition-all btn-primary ">About <span class="bi bi-stack"> </span></button>
                    </td>
                </tr>
                <tr class="rounded" id="com">
                    <td class="rounded border-0 text-left"><code>.com</code> Normal COM</td>
                    <td class="rounded border-0 price">20.77</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-info " onclick="BuyHook('.com')" >Buy! &rarr;</button>
                        <button class="btn-sm my-0.5 transition-all btn-warning " onclick="alertt('Sorry but there\'s No Customer Service Online right now... Please help yourself. ')">Query <span class="bi bi-question-circle"></span></button>
                        <button class="btn-sm my-0.5 transition-all btn-primary ">About <span class="bi bi-stack"> </span></button>
                    </td>
                </tr>
                </tbody>

            </table>
            <p class="text-center font-bold text-lg">...</p>

        </div>

        <div class="col-span-full lg:col-span-3">
            <h3 class="text-xl font-sans font-semibold mt-3 first-letter:text-2xl indent-6 ">
                Check Servers:
            </h3>
            <table class="mt-2 table  table-striped transition-all
                stab-table shadow rounded border-separate
                bg-slate-100 dark:bg-slate-600 border-spacing-2
                dark:text-zinc-100 text-zinc-900 hover:shadow-lg hover:bg-slate-200 hover:dark:bg-slate-700
                " >
                <thead>
                <tr class="rounded bg-opacity-30">
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Name</td>
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Specs.</td>
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Type</td>
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Price</td>
                    <td class="rounded border-0 bg-slate-300 bg-opacity-30 dark:bg-slate-500">Act.</td>
                </tr>
                </thead>
                <tbody >
                <tr class="my-2.5"> </tr>
                <tr class="rounded">
                    <td class="rounded border-0 text-left"><code>mBGP </code>San Jose</td>
                    <td class="rounded border-0 text-left">EPYC7</td>
                    <td class="rounded border-0 text-left">BareMetal</td>
                    <td class="rounded border-0 price">128.50</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-warning w-full h-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span></button>
                    </td>
                </tr>
                <tr class="rounded">
                    <td class="rounded border-0 text-left"><code>fCDN </code>Yunnan</td>
                    <td class="rounded border-0 text-left">XEON Au</td>
                    <td class="rounded border-0 text-left">BareMetal</td>
                    <td class="rounded border-0 price">155.50</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-warning w-full h-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span></button>
                    </td>
                </tr>
                <tr class="rounded">
                    <td class="rounded border-0 text-left"><code>FUS </code>HongKong</td>
                    <td class="rounded border-0 text-left">Kunpeng+</td>
                    <td class="rounded border-0 text-left">BareMetal</td>
                    <td class="rounded border-0 price">99.50</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-warning w-full h-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span></button>
                    </td>
                </tr>
                <tr class="rounded">
                    <td class="rounded border-0 text-left"><code>- </code>Shibushi</td>
                    <td class="rounded border-0 text-left">XEON Cu</td>
                    <td class="rounded border-0 text-left">VPS</td>
                    <td class="rounded border-0 price">33.95</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-warning w-full h-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span></button>
                    </td>
                </tr>
                <tr class="rounded">
                    <td class="rounded border-0 text-left"><code>mBGP </code>Moscow</td>
                    <td class="rounded border-0 text-left">EPYC7</td>
                    <td class="rounded border-0 text-left">VPS</td>
                    <td class="rounded border-0 price">38.50</td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-warning w-full h-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span></button>
                    </td>
                </tr>
                <tr class="rounded">
                    <td class="rounded border-0 text-left"><code>Def </code>Kiev</td>
                    <td class="rounded border-0 text-left">EPYC7</td>
                    <td class="rounded border-0 text-left">SeFa</td>
                    <td class="rounded border-0 price"><i>NaN</i></td>
                    <td class="rounded border-0 text-center">
                        <button class="btn-sm my-0.5 transition-all btn-warning w-full h-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span></button>
                    </td>
                </tr>
                </tbody>
            </table>
            <p class="text-center font-bold text-lg">...</p>
        </div>
        <hr>
    </div>
</div>

<script src="<c:url value="/js/MarketActionsHelper.js"/>"></script>