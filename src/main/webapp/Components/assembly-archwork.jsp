<h3>The functions for replying Helpdesk Tickets of Archwork is not ready yet in this Staging version.</h3>
<div class="flex gap-1 mx-auto w-full mt-1.5">
    <button class="btn btn-outline-info" onclick="swb_arch(0)" id="sub-btn-0">Man. Domains</button>
<%--    <button onclick="swb_arch(1)">Man. Users</button>--%>
    <button class="btn btn-outline-success" onclick="swb_arch(2)" id="sub-btn-2">Reply Helpdesk</button>
</div>
<script src="<c:url value="/js/AdminQueryHelpers.js"/>"></script>
<div style="height: 46.89vw">
    <iframe id="arch-window" src="${path}/admin-cont/domains/page/1" class="w-full h-full bg-transparent p-1.5 min-h-full  h-96 lg:h-2/3 overflow-hidden">

    </iframe>
</div>
<script>
    document.getElementById('sub-btn-0').classList.replace("btn-outline-info", "btn-info");
    const path_adomain_init = "${path}/admin-cont/domains/page/1",
          <%--path_auser_init = "${path}/admin-domain/page/1",--%>
          path_areply_init = "${path}/Components/assembly-reply.jsp";

    var awindow = document.getElementById('arch-window').contentWindow;
    const swb_arch = (target) => {
        switch (target){
            default:
                return;
            case 1:
                // awindow.location.href = path_auser_init;
                break;
            case 2:
                document.getElementById('sub-btn-2').classList.replace("btn-outline-success", "btn-success");
                document.getElementById('sub-btn-0').classList.replace("btn-info", "btn-outline-info");
                awindow.location.href = path_areply_init;
                break;
            case 0:
                document.getElementById('sub-btn-2').classList.replace("btn-success", "btn-outline-success");
                document.getElementById('sub-btn-0').classList.replace("btn-outline-info", "btn-info");
                awindow.location.href = path_adomain_init;
                break;
        }
    }

</script>