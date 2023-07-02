<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .orak-list{
        user-select: none;
    }
    .orak-list:hover{
        color: gray !important;
    }
</style>
<div class="fixed bg-amber-300 dark:bg-orange-500 z-20 shadow top-0 clear-both clearfix px-3 w-full grid grid-cols-2 gap-1" >
    <%  // TODO : this is an example for swal-confirm  %>
    <span class=" w-auto" onclick="
                swal({
                  title: 'Warning',
                  text: 'Since the path is not sure: They will be different between Production-Env, Staging-Env and Dev-Env. So this maybe not work.',
                  icon: 'warning',
                  buttons: {
                      cancel: {
                        text: 'Cancel',
                        value: null,
                        visible: true,
                        closeModal: true,
                        },
                      confirm: {
                        text: 'OK',
                        value: true,
                        visible: true,
                        closeModal: true
                        }
                  }
                }).then((value)=>{if(value) window.location.href = '${path}/';});
            ">
            <img class="unselect m-0 inline-block" src="./src/img/logo.png" width="8%" style="transform: translateY(-5px)" />
            <h5 class="inline-block pt-2 font-bold font-mono text-lg ">LilacYun.Domine_
                <i class="font-light text-sm"> from spiderCC</i>
            </h5>
        </span>

    <span class=" text-right pt-1 py-auto h-full " >
            <ul class="list-none inline align-middle vela " >
                <li class="inline-block align-baseline border-0 relative rounded border-transparent
                 shadow ml-1 z-30
                 bg-green-300 bg-opacity-0
                hover:bg-sky-100 hover:bg-opacity-50
                dark:hover:bg-sky-200 dark:hover:bg-opacity-50
                active:bg-sky-300 active:bg-opacity-50
                dark:active:bg-sky-400 dark:active:bg-opacity-50
                transition-all"
                    id="darksw"
                >
                    <div class=" p-1 px-2">
                        <span id="swb_h" class="bi bi-sun"> </span>
                    </div>

                </li>

                <a href="${path}/market"
                   class="border-0 px-2 py-1 rounded border-transparent shadow ml-1
                bg-green-300 bg-opacity-0
                hover:bg-sky-100 hover:bg-opacity-50
                dark:hover:bg-sky-200 dark:hover:bg-opacity-50
                active:bg-sky-300 active:bg-opacity-50 orak-list
                dark:active:bg-sky-400 dark:active:bg-opacity-50
                transition-all
                "><li class="inline-block align-baseline pb-1">Market</li></a>

                <c:choose>
                    <c:when test="${USER_ != null}">
                        <a href="${path}/panel"
                           class="border-0 px-2 py-1 rounded border-transparent shadow ml-1
                            bg-green-300 bg-opacity-0
                            hover:bg-sky-100 hover:bg-opacity-50
                            dark:hover:bg-sky-200 dark:hover:bg-opacity-50 orak-list
                            active:bg-sky-300 active:bg-opacity-50
                            dark:active:bg-sky-400 dark:active:bg-opacity-50
                            transition-all
                            "><li class="inline-block align-baseline pb-1">Control</li></a>

                    </c:when>
                    <c:otherwise>
                        <a href="${path}/login"
                           class="border-0 px-2 py-1 rounded border-transparent shadow ml-1
                            bg-green-300 bg-opacity-0
                            hover:bg-sky-100 hover:bg-opacity-50
                            dark:hover:bg-sky-200 dark:hover:bg-opacity-50 orak-list
                            active:bg-sky-300 active:bg-opacity-50
                            dark:active:bg-sky-400 dark:active:bg-opacity-50
                            transition-all
                            "><li class="inline-block align-baseline pb-1">Control</li></a>
                    </c:otherwise>
                </c:choose>
<%! %>
                <c:choose>
                    <c:when test="${USER_ != null}">
                        <a id="logoff-btn" href="javascript:logOffProcedure();"
                           class="border-0 px-2 py-1 rounded border-transparent shadow ml-1
                            bg-green-300 bg-opacity-0
                            hover:bg-sky-100 hover:bg-opacity-50
                            dark:hover:bg-sky-200 dark:hover:bg-opacity-50 orak-list
                            active:bg-sky-300 active:bg-opacity-50
                            dark:active:bg-sky-400 dark:active:bg-opacity-50
                            transition-all
                       "><li class="inline-block align-baseline pb-1">Logoff</li></a>
                    </c:when>
                    <c:otherwise>
                        <a href="${path}/lar" id="login-btn"
                           class="border-0 px-2 py-1 rounded border-transparent shadow ml-1
                            bg-green-300 bg-opacity-0
                            hover:bg-sky-100 hover:bg-opacity-50
                            dark:hover:bg-sky-200 dark:hover:bg-opacity-50 orak-list
                            active:bg-sky-300 active:bg-opacity-50
                            dark:active:bg-sky-400 dark:active:bg-opacity-50
                            transition-all
                       "><li class="inline-block align-baseline pb-1">Login</li></a>
                    </c:otherwise>
                </c:choose>

               <a href="javascript:wshut()" id="help-btn" title="Need help?"
                  class="border-0 px-2 py-1 rounded-full border-transparent shadow ml-1
                bg-green-300 bg-opacity-0
                hover:bg-sky-100 hover:bg-opacity-50
                dark:hover:bg-sky-200 dark:hover:bg-opacity-50
                active:bg-sky-300 active:bg-opacity-50
                dark:active:bg-sky-400 dark:active:bg-opacity-50
                transition-all orak-list

              "><li class="inline-block align-baseline pb-1"><span class="bi bi-question-circle-fill"></span></li></a>

            </ul>
        </span>


</div>

