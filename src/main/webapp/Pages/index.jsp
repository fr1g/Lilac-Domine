<div class="container m-0 w-full mx-auto px-8 " style="min-height: 100vh;">
<%--<div class="hidden" id="picsGetter">--%>
<%--    <img src="${path}/src/img/carousel/0.png">--%>
<%--    <img src="${path}/src/img/carousel/1.png">--%>
<%--    <img src="${path}/src/img/carousel/2.png">--%>
<%--</div>--%>
    <div class="grid grid-cols-10 gap-1 justify-center justify-items-center ">

        <div class="border w-full col-span-10">
            <div id="HomeCarousel" class="carousel slide w-full" style="height: 70vh !important;  overflow: hidden;"
                 data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#HomeCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#HomeCarousel" data-slide-to="1"></li>
                    <li data-target="#HomeCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" id="cain" style="max-height: 70vh; min-height: 70vh !important; overflow: hidden ">
                    <div class="carousel-item active" style="max-height: 70vh; overflow: hidden ">
                        <div class="divized-carousel-item w-full h-full" style="background-image: url('${path}/src/img/carousel/0.png'); "></div>
                        <div class="carousel-caption mb-2 border-0 shadow bg-black bg-opacity-50 w-1/2 mx-auto rounded-lg" style="bottom: 5px !important">
                            <h5 class="font-mono text-2xl font-semibold ">New Domain Now On Sale</h5>
                            <p>st. $3.99/mo. Get your Internet Show Start Here.</p>
                        </div>
                    </div>
                    <div class="carousel-item" style="max-height: 70vh; overflow: hidden ">
                        <div class="divized-carousel-item w-full h-full" style="background-image: url('${path}/src/img/carousel/2.png'); "></div>
                        <div class="carousel-caption mb-2 border-0 shadow bg-black bg-opacity-50 w-1/2 mx-auto rounded-lg" style="bottom: 5px !important">
                            <h5 class="font-mono text-2xl font-semibold ">Free DNS and Forwarding...</h5>
                            <p>...if you Buy New Domain Right Here Right Now!</p>
                        </div>
                    </div>
                    <div class="carousel-item" style="max-height: 70vh; overflow: hidden ">
                        <div class="divized-carousel-item w-full h-full" style="background-image: url('${path}/src/img/carousel/1.png'); "></div>
                        <div class="carousel-caption mb-2 border-0 shadow bg-black bg-opacity-50 w-1/2 mx-auto rounded-lg" style="bottom: 5px !important">
                            <h5 class="font-mono text-2xl font-semibold ">Across Gender Top Level</h5>
                            <p><i><b>.mom</b></i> and <i><b>.dad</b></i> domains now AVALIABLE</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#HomeCarousel" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#HomeCarousel" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="m-12 hidden text-blue-500 dark:text-black">hidden twcss getter</div>

        <div class="col-span-10 w-full mt-5">
            <div class="passage mb-3">
                <h1 class="text-left font-bold text-3xl">Join our membership!</h1>
                <p class="font-serif indent-6 mt-2 text-lg">
                    Must know, we always provide you the best service ever to us.
                    We have such grand holy shiny pretty gorgeous glories of our
                    extremely excellent professional services.
                    <i>(You really should try it on!)</i><br>
                </p><br>
                <h1 class="text-left font-bold text-3xl">New Domain On-Sale!</h1>
                <p class="font-serif indent-6 mt-2 text-lg">
                    Here we provide BRAND NEW domain services included our new DNS resolvation!
                    Now you can just keep your domain under ours SAFETY CONTROL and NEVER NEED TO
                    SEND IT to the others <i>(especially the Cloudflare!)</i><br>
                </p>
                <div class=" border rounded-lg shadow-lg hover:shadow-xl p-9 px-11 m-6 transition-all
                                 bg-slate-100 bg-opacity-30 dark:bg-opacity-40 hover:bg-opacity-50 hover:dark:bg-opacity-60
                                 text-stone-800 dark:text-zinc-100
                                 "
                     id="ad-dioxide-1">
                        <span class="badge bg-zinc-300 border px-2 py-1 absolute float-left bg-opacity-50"
                              style="transform: translate(-36px, -29px);">AD</span>
                    <div class=" grid grid-cols-2 gap-2 ">
                        <h4 class="text-4xl font-sans col-span-full md:col-span-1">
                            A global network built for the cloud
                        </h4>
                        <p class="text-right col-span-full md:col-span-1" >
                            <svg class="inline-block m-0 " width="602" height="203" viewBox="0 0 602 203" fill="none" xmlns="http://www.w3.org/2000/svg" style="width: auto; height: 40px; clip-path: 3px;"><path d="M510.338 128.167L511.809 123.081C513.562 117.031 512.91 111.438 509.969 107.329C507.262 103.544 502.752 101.315 497.274 101.056L393.528 99.7432C393.206 99.7369 392.89 99.655 392.606 99.504C392.321 99.353 392.077 99.1373 391.891 98.8742C391.71 98.6023 391.594 98.2918 391.553 97.9674C391.513 97.6429 391.549 97.3135 391.658 97.0053C391.836 96.4971 392.159 96.0521 392.587 95.7254C393.016 95.3987 393.53 95.2045 394.068 95.1668L498.775 93.8398C511.196 93.2698 524.644 83.1988 529.352 70.9178L535.323 55.3265C535.568 54.6672 535.624 53.9529 535.485 53.2637C528.705 22.7889 501.487 0 468.944 0C438.96 0 413.501 19.3385 404.369 46.2179C398.198 41.5895 390.504 39.4618 382.83 40.2608C368.445 41.6882 356.879 53.2613 355.455 67.6379C355.09 71.2277 355.357 74.8538 356.246 78.3513C332.747 79.0358 313.902 98.2738 313.902 121.922C313.905 124.033 314.061 126.141 314.369 128.23C314.437 128.712 314.676 129.154 315.043 129.475C315.41 129.796 315.881 129.974 316.368 129.977L507.902 130.001C507.92 130.002 507.938 130.002 507.956 130.001C508.498 129.991 509.022 129.808 509.451 129.478C509.88 129.147 510.191 128.688 510.338 128.167Z" fill="#F6821F"></path><path d="M544.899 56.4571C543.938 56.4571 542.98 56.4813 542.026 56.5295C541.872 56.5405 541.721 56.5736 541.577 56.6277C541.327 56.7131 541.101 56.8578 540.919 57.0494C540.737 57.241 540.604 57.4739 540.532 57.728L536.453 71.8078C534.699 77.8584 535.351 83.4464 538.295 87.5556C541 91.3448 545.51 93.5688 550.987 93.8281L573.104 95.155C573.415 95.1653 573.719 95.2479 573.993 95.3963C574.266 95.5448 574.501 95.7549 574.679 96.0101C574.863 96.2834 574.98 96.5959 575.02 96.9225C575.061 97.2492 575.024 97.5808 574.913 97.8906C574.735 98.3978 574.412 98.842 573.985 99.1686C573.558 99.4951 573.044 99.69 572.508 99.7292L549.528 101.056C537.051 101.631 523.606 111.697 518.902 123.978L517.242 128.314C517.173 128.495 517.147 128.69 517.168 128.883C517.189 129.076 517.255 129.262 517.362 129.424C517.469 129.586 517.612 129.721 517.781 129.817C517.95 129.912 518.14 129.967 518.334 129.975C518.355 129.975 518.374 129.975 518.395 129.975H597.467C597.927 129.979 598.375 129.833 598.744 129.558C599.112 129.283 599.381 128.896 599.508 128.454C600.909 123.459 601.617 118.296 601.612 113.108C601.603 81.8228 576.215 56.4571 544.899 56.4571Z" fill="#FBAD41"></path><path d="M66.9595 153.39H80.4491V190.214H104.022V202.024H66.9595V153.39Z" fill="#222222"></path><path d="M117.993 177.847V177.709C117.993 163.744 129.257 152.416 144.276 152.416C159.295 152.416 170.418 163.604 170.418 177.569V177.709C170.418 191.674 159.152 202.995 144.138 202.995C129.124 202.995 117.993 191.812 117.993 177.847ZM156.65 177.847V177.709C156.65 170.701 151.577 164.575 144.138 164.575C136.767 164.575 131.829 170.551 131.829 177.569V177.709C131.829 184.718 136.905 190.841 144.276 190.841C151.715 190.841 156.65 184.865 156.65 177.847Z" fill="#222222"></path><path d="M186.928 180.695V153.388H200.626V180.419C200.626 187.427 204.173 190.77 209.594 190.77C215.016 190.77 218.562 187.575 218.562 180.765V153.388H232.262V180.34C232.262 196.043 223.294 202.918 209.456 202.918C195.618 202.918 186.928 195.91 186.928 180.688" fill="#222222"></path><path d="M252.906 153.392H271.679C289.064 153.392 299.145 163.396 299.145 177.429V177.571C299.145 191.602 288.924 202.026 271.403 202.026H252.906V153.392ZM271.89 190.07C279.958 190.07 285.307 185.631 285.307 177.77V177.632C285.307 169.853 279.958 165.335 271.89 165.335H266.396V190.074L271.89 190.07Z" fill="#222222"></path><path d="M318.75 153.39H357.686V165.204H332.24V173.469H355.254V184.654H332.24V202.024H318.75V153.39Z" fill="#222222"></path><path d="M376.457 153.39H389.946V190.214H413.519V202.024H376.457V153.39Z" fill="#222222"></path><path d="M448.768 153.042H461.766L482.489 202.024H468.027L464.478 193.338H445.703L442.229 202.024H428.045L448.768 153.042ZM460.586 182.849L455.162 169.021L449.668 182.849H460.586Z" fill="#222222"></path><path d="M499.865 153.388H522.879C530.323 153.388 535.464 155.336 538.732 158.67C541.587 161.45 543.045 165.211 543.045 169.998V170.135C543.045 177.567 539.071 182.501 533.032 185.07L544.645 202.026H529.065L519.262 187.294H513.354V202.026H499.865V153.388ZM522.255 176.735C526.844 176.735 529.488 174.511 529.488 170.967V170.829C529.488 167.007 526.706 165.064 522.182 165.064H513.354V176.744L522.255 176.735Z" fill="#222222"></path><path d="M562.508 153.39H601.652V164.856H575.86V172.217H599.223V182.849H575.86V190.562H602V202.024H562.508V153.39Z" fill="#222222"></path><path d="M37.425 183.547C35.536 187.815 31.5615 190.838 26.2802 190.838C18.9065 190.838 13.8333 184.724 13.8333 177.707V177.567C13.8333 170.558 18.7686 164.573 26.14 164.573C31.6971 164.573 35.9287 167.989 37.7149 172.635H51.9339C49.6568 161.06 39.4776 152.418 26.2802 152.418C11.2593 152.418 0 163.753 0 177.707V177.845C0 191.81 11.1214 203 26.14 203C38.9867 203 49.0279 194.688 51.6768 183.549L37.425 183.547Z" fill="#222222"></path></svg>
                        </p>
                        <p class="col-span-2 mt-2 break-all">
                            <b class="mr-2 indent-4">Cloudflare is a global network designed to make everything you connect to the Internet secure, private, fast, and it's reliable.</b>
                            - Secure your websites, APIs, and Internet applications, Protect corporate networks, employees, and devices, Write and deploy code that runs on the international network edge.
                            <a href="https://cloudflare.com" class="text-sky-500 transition-all" target="_blank">Detail-&gt;</a>
                        </p>
                    </div>
                </div>

                <p class="font-serif indent-6 mt-2 text-lg">
                    Beside, we do enabled ALL-CDN access to all your domains! With the AutoForwarding! Now we don't care about
                    how the actually overdose. <i>(so let's play with CDN, without concering the actually
                    cost, <b title="Enjoy it while it lasts, because it never does.">Carpe Diem! </b>)</i><br>
                </p>
            </div>
        </div>

    </div>

</div>
