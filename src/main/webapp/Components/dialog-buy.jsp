<div class="bg-transparent py-2" id="add-fund-window">
    <h3 class="text-lg">After you confirm, we will directly pay from your <i class="italic font-semibold text-xl font-mono">LilacAccount Fund</i></h3>
    <p class="my-2">Entre the domain name that you prefer:</p>
    <form id="buyform">
        <div class="container">
            <div class=" grid grid-cols-2 gap-1">
                <div class="col-span-full">
                    <input class="form-control dark:bg-neutral-700 bg-neutral-100 text-zinc-900 dark:text-zinc-50"
                           id="target-domain" pattern=".+\..*" required type="text"
                           placeholder="enter the domain you prefer to buy" />
                    <span class="isitvalid text-zinc-900 dark:text-zinc-50 mb-1.5"> - </span>
                    <style>
                        #target-domain:invalid + span.isitvalid::after{
                            content: 'may Not a domain';
                        }
                        #target-domain:valid + span.isitvalid::after{
                            content: 'Domain pattern may OK';
                        }

                    </style>
                    <p class="mt-3 text-lg font-semibold italic">How long you prefer?</p>
                </div>
                <div>
                    <p>For years</p>
                    <input class="form-control bg-zinc-50 dark:bg-zinc-700 text-zinc-900 dark:text-zinc-50" type="number" min="0" id="for-year">
                </div>
                <div>
                    <p>For months</p>
                    <input class="form-control bg-zinc-50 dark:bg-zinc-700 text-zinc-900 dark:text-zinc-50" type="number" min="0" max="12" id="for-month">
                </div>
                <div class="col-span-full" >cost: <span id="query-Price-buy" class="price-f"></span> </div>
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
        document.getElementById('target-domain').value = incame;
    }
    document.getElementById('buyform').addEventListener('submit', (e) => {
        e.preventDefault();
        if(document.getElementById('for-month').value == 0
            && document.getElementById('for-year').value == 0){
            alertt('You must buy it at least 1 month, or leave.');
            return;
        }
        PurchaseDom( //type, domain, year, month
            'new',
            document.getElementById('target-domain').value,
            document.getElementById('for-year').value,
            document.getElementById('for-month').value
        );
    });


    const pg = () => {
        GetPrice(
            document.getElementById('target-domain').value,
            document.getElementById('for-year').value,
            document.getElementById('for-month').value,
            document.getElementById('query-Price-buy')
        );
    }

    document.getElementById('for-year').addEventListener('blur', ()=> {
        pg();
    });
    document.getElementById('for-month').addEventListener('blur', ()=> {
        pg();
    });

</script>