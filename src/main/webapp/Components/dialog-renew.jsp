<div class="bg-transparent py-2" id="renew-window">
    <h3 class="text-lg">After you confirm, we will directly pay from your <i class="italic font-semibold text-xl font-mono">LilacAccount Fund</i></h3>
    <p class="my-2">Confirm the domain you about to renew:</p>
    <form id="renewform">
        <div class="container">
            <div class=" grid grid-cols-2 gap-1">
                <div class="col-span-full">
                    <input class="form-control dark:bg-neutral-700 bg-neutral-100 text-zinc-900 dark:text-zinc-50"
                           id="target-domain-r" pattern=".+\..*" required type="text"
                           disabled />
                    <span class="isitvalid text-zinc-900 dark:text-zinc-50 mb-1.5"> - </span>
                    <style>
                        #target-domain-r:invalid + span.isitvalid::after{
                            content: 'may Not a domain';
                        }
                        #target-domain-r:valid + span.isitvalid::after{
                            content: 'Domain pattern may OK';
                        }

                    </style>
                    <p class="mt-3 text-lg font-semibold italic">How long you prefer?</p>
                </div>
                <div>
                    <p>For years</p>
                    <input class="form-control bg-zinc-50 dark:bg-zinc-700 text-zinc-900 dark:text-zinc-50" type="number" min="0" id="for-year-renew">
                </div>
                <div>
                    <p>For months</p>
                    <input class="form-control bg-zinc-50 dark:bg-zinc-700 text-zinc-900 dark:text-zinc-50" type="number" min="0" max="12" id="for-mo-renew">
                </div>
                <div class="col-span-full" >cost: <span id="query-Price-renew" class="price-f"></span> </div>
            </div>
        </div>

        <button type="submit" id="afund-pay" class="btn btn-outline-info block mx-auto mt-5"> Check and Buy </button>
    </form>
</div>
<script src="<c:url value="/js/DomainPurchaseHelper.js"/>"></script>
<script>
    var linknow = window.location.href, incame = "";
    if(linknow.includes("!")) {
        incame = linknow.split("!")[1];
        document.getElementById('target-domain-r').value = incame;
    }
    document.getElementById('renewform').addEventListener('submit', (e) => {
        e.preventDefault();
        if(document.getElementById('for-mo-renew').value == 0
            && document.getElementById('for-year-renew').value == 0){
            alertt('You must renew it at least 1 month, or leave.');
            return;
        }
        PurchaseDom( //type, domain, year, month
            're',
            document.getElementById('target-domain-r').value,
            document.getElementById('for-year-renew').value,
            document.getElementById('for-mo-renew').value
        );
    });


    const pgr = () => {
        GetPrice(
            document.getElementById('target-domain-r').value,
            document.getElementById('for-year-renew').value,
            document.getElementById('for-mo-renew').value,
            document.getElementById('query-Price-renew')
        );
    }

    document.getElementById('for-year-renew').addEventListener('blur', ()=> {
        pgr();
    });
    document.getElementById('for-mo-renew').addEventListener('blur', ()=> {
        pgr();
    });

</script>