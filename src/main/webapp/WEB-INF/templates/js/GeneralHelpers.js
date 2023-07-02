var swb_h = document.getElementById('swb_h'),
    swb = document.getElementById('darksw'),
    fn = 0,
    darkBool = false;
swb.addEventListener('click', () => {
    DarkSwitch()
})

window.onload = () => {

    cdop();
    // if ( localStorage.getItem('theme').includes('dark') || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) darkBool = true;
    // else darkBool = false;
    DarkSwitch((localStorage.getItem('theme').includes('dark') || (!/*('theme' in localStorage) && */window.matchMedia('(prefers-color-scheme: dark)').matches)));

    var currUA = navigator.userAgent;
    console.log(currUA);
    if (currUA.includes('AppleWebKit') && !currUA.includes('hrome')) alertt('Error may occur on your browser: \nPlease try to use any browser with chromium core(blink, like the latest ms-edge), or with Gecko (like firefox) as core.', 'Warning of Compability', 'warning');
    if (window.innerWidth < 625)
        alertt(`Your device's screen is too small. Perhaps you need to rotate your screen to use this? Current width: ${window.innerWidth} is way lower than recommended: 625px. \n\n Your UA:\n${currUA}. \nRecommend Blink(Edge, Chrome) or Gecko(Firefox) to avoid Compability Issues.`, "Screen too Small", "warning");


}

//  bi-moon bi-sun

const DarkSwitch = (n = false) => {
    if (!(n || darkBool)) {
        // if(darkBool){
        document.documentElement.classList.add('dark');
        localStorage.setItem('theme', 'dark');
        darkBool = !darkBool;
        swb_h.classList.replace('bi-sun', 'bi-moon');

    } else {
        document.documentElement.classList.remove('dark');
        localStorage.setItem('theme', 'light');
        darkBool = !darkBool;
        swb_h.classList.replace('bi-moon', 'bi-sun');

    }
    console.log('Root switch dmode to: ' + n + ', while darkbool is: ' + darkBool);

}
// Whenever the user explicitly chooses to respect the OS preference, use: 
const cdop = () => {
    localStorage.setItem('theme', '');
}

const jslink = (linkto) => {
    var al = document.createElement('a');
    al.setAttribute('class', 'hidden');
    al.setAttribute('target', '_');
    al.setAttribute('href', `${linkto}`);
    document.body.appendChild(al);
    al.click();
    al.remove();
    delete al;
}

const errmsg =
    `crit: NullReferenceException
object reference must to be set to an instant of the object,
    at: wasm.Lilac.BlazorWasm
        Normal.razor, line 114, col 514: cannot handle element.
    at: Startup
        Program.cs, line 191, col 98: '10' is not smelly.`;
const erralert = () => {
    prompt('Press OK to launch default Mail app, or entre your message here...');
    setTimeout(() => {
        console.error(errmsg);
        alert(errmsg);
    }, 514);
}


const alertt = (txt, ant = null, type = null) => {
    if (txt == 9) {
        swal("Code ⑨", "Something unknown wrong happend...", "error");
        return;
    }
    //alert(txt);
    // whether wanna use sweetalert can change here.
    if (ant === null) swal(txt);
    else {
        if (type === null) swal(ant, txt);
        else swal(ant, txt, type);
    }

}

const wshut = () => {
    document.body.style.background = "white";
    document.body.innerHTML = '<div class="m-12 font-bold text-3xl text-black dark:text-black font-mono">bye!... or you maybe want to take a look ours <a class="text-blue-500" href="/about.html">About Page</a>...... click <a href="javascript:location.reload();"  class="text-blue-500">HERE</a> to refresh this page.</div>';
}
console.log('Loaded: GeneralHelpers.js');
