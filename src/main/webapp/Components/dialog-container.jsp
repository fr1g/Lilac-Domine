<div class="float transition-all p-2 clear-both
    rounded-lg bg-zinc-100 dark:bg-zinc-700
    text-zinc-900 dark:text-zinc-50 shadow-xl hover:shadow-2xl  "
    style="" >
    <p id="pop-top-bar" class="clear-both p-1 text-xl" >
        <span id="pop-top-title" class=" ml-2"> -</span>
        <span id="pop-close" title="close" class="transition-all float-right text-xl font-semibold p-0 m-0 unselect px-2">&times;</span>
        <span class="clear-both block"></span>
    </p>
    <script>
        var POP_UP_TARGET = (window.location.href+'').replace(window.location.protocol + "//" + window.location.host + JSP_PATH, "");
        // pre-procc link. for #addfund, #renew; will reflect to certain pop-up.
    </script>
    <div class="p-1.5 container bg-transparent transition-all" id="dividing">
        <div class="hidden" id="addfund-"><%@include file="dialog-addfund.jsp"%></div>
        <div class="hidden" id="renew-"><%@include file="dialog-renew.jsp"%></div>
        <div class="hidden" id="new-"><%@include file="dialog-buy.jsp"%></div>
        <div class="hidden" id="confirm-"><%@include file="dialog-confirm.jsp"%></div>
    </div>
    <script>


    </script>

</div>

<style>
    #pop-close{
        rotate: 0deg;
        transform: rotate(0deg);
        opacity: 66%;
        cursor: pointer;
        user-select: none;
    }
    #pop-close:hover{
        rotate: 28deg;
        transform: rotate(28deg);
        opacity: 78%;
    }
    #pop-close:active{
        rotate: 38deg;
        transform: rotate(38deg);
        opacity: 99%;
    }
</style>

<script>
    var pop_title = document.getElementById('pop-top-title');
    document.getElementById('pop-close').addEventListener('click', () => {
        kill_pop();
    });
</script>