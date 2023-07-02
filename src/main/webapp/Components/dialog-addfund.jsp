<div class="bg-transparent py-2" id="add-fund-window">
    <h3 class="text-lg">We now support <i class="italic font-semibold text-xl font-mono">HexaPay</i></h3>
    <p class="my-2">Entre the amount of #$ you wanna add into your fund:</p>
    <form id="payform">
        <input type="number" required class="form-control dark:bg-neutral-700 mb-3 bg-neutral-100 text-zinc-900 dark:text-zinc-50" id="afund-in"
               placeholder="Even if you input a negative, we will make it positive." />
        <button type="submit" id="afund-pay" class="btn btn-outline-info block mx-auto "> Add to Fund </button>
    </form>
</div>
<script src="<c:url value="/js/HexaPayHook.js"/>"></script>
<script>
    document.getElementById('payform').addEventListener('submit', (e) => {
        e.preventDefault();
        if(parseFloat(document.getElementById('afund-in').value) == NaN) alertt('Input the value!');
        HexaPay(document.getElementById('afund-in').value, Math.random() + 'asc');
    })
</script>