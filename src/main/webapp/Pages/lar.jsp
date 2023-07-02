<div class="container m-0 w-full mx-auto px-8 py-10" style="min-height: 100vh;">
    <h1 class="text-4xl font-mono font-bold mb-10  mt-12 block "><b id="titleLogin">Login!_</b> <span class="float-right">;&rpar;</span></h1>

    <div class="grid grid-cols-3 md:grid-cols-5 xl:grid-cols-7 ">
        <div class="w-full p-5 px-6 m-1 md:col-start-2 xl:col-start-3 col-start-1 col-span-3 border-0 bg-emerald-300 bg-opacity-30 rounded-lg hover:bg-opacity-40 transition-all shadow-lg hover:shadow-xl">
            <form class="form arj" action="" method="post" id="loginf">
                <div class="form-group">
                    <label for="uname">Username</label>
                    <input type="text" class="form-control" id="uname"  required>
                </div>
                <div class="form-group">
                    <label for="pwd">Password</label>
                    <input type="password" class="form-control" id="pwd" required>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="remember">
                    <label class="form-check-label" for="remember">Stay me online!_</label>
                </div>
                <div class="clear-both">
                        <span class="float-left">
                            <button type="button" onclick="swla(0)" class="transition-all shadow  btn btn-info bg-blue-400 hover:bg-500 active:bg-blue-600">Register! </button>
                            <b class="mr-1 text-sm md:text-lg ">&larr;Have no account?</b>
                        </span>
                    <button type="submit" class="shadow-lg hover:shadow-2xl float-right transition-all btn  btn-primary bg-teal-500 hover:bg-teal-600 active:bg-teal-700 font-bold font-mono" id="linb">Login</button>

                </div>
            </form>
            <!-- ... -->
            <form class="form hidden" action="" method="post" id="regf">
                <div class="form-group">
                    <label for="unameNew">Username(for login)</label>
                    <input type="text" class="form-control" id="unameNew" required >

                    <label for="email" class="mt-2">Email(optional)</label>
                    <input type="email" class="form-control" id="email" aria-describedby="emailHelp">
                </div>
                <div class="form-group" class="mt-2">
                    <label for="pwdr1">Password</label>
                    <input type="password" class="form-control" id="pwdr1" required>

                    <label for="pwdr2" class="mt-2">Password Again</label>
                    <input type="password" class="form-control" id="pwdr2" required>
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="agree">
                    <label class="form-check-label" for="agree">Agree  with the </label><a class="pl-1 underline">Privacy Policy</a>
                </div>
                <p id="warnline" class="text-danger"></p>
                <div class="clear-both mt-3">
                        <span class="float-left">
                            <button type="button" onclick="swla(1)" class="transition-all shadow  btn btn-info bg-blue-400 hover:bg-500 active:bg-blue-600">Login! </button>
                            <b class="mr-1 text-sm md:text-lg ">&larr;Already have account?</b>
                        </span>
                    <button disabled type="submit" class="transition-all  btn-primary btn shadow-lg hover:shadow-2xl bg-teal-500 hover:bg-teal-600 active:bg-teal-700 float-right font-bold font-mono" id="regb">Register</button>

                </div>
            </form>
        </div>

    </div>

</div>

