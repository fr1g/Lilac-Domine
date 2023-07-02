var swb_h = document.getElementById('swb_h'),
swb = document.getElementById('darksw'),
fn = 0,
iframes,
darkBool;
swb.addEventListener('click', ()=>{DarkSwitch()})

window.onload = () => {
    
    cdop();
    darkBool = false;
    // if ( localStorage.getItem('theme').includes('dark') || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) darkBool = true;
    // else darkBool = false;
    DarkSwitch((localStorage.getItem('theme').includes('dark') || (!/*('theme' in localStorage) && */window.matchMedia('(prefers-color-scheme: dark)').matches)));

    iframes = document.getElementsByTagName('iframe');

    var currUA = navigator.userAgent;
    console.log(currUA);
    if (currUA.includes('AppleWebKit') && !currUA.includes('hrome')) alertt('Error may occur on your browser: \nPlease try to use any browser with chromium core(blink, like the latest ms-edge), or with Gecko (like firefox) as core.', 'Warning of Compability', 'warning');
    else if (currUA.includes('Safari') && !currUA.includes('hrome')) alertt('Error may occur on your browser: \nPlease try to use any browser with chromium core(blink, like the latest ms-edge), or with Gecko (like firefox) as core.', 'Warning of Compability', 'warning');
    if (window.innerWidth < 625)
        alertt(`Your device's screen is too small. Perhaps you need to rotate your screen to use this? Current width: ${window.innerWidth} is way lower than recommended: 625px. \n\n Your UA:\n${currUA}. \nRecommend Blink(Edge, Chrome) or Gecko(Firefox) to avoid Compability Issues.`, "Screen too Small", "warning");

}

//  bi-moon bi-sun

const DarkSwitch = (n = false) => {
    if(!(n || darkBool)){
        // if(darkBool){
        document.documentElement.classList.add('dark');
        localStorage.setItem('theme', 'dark');
        darkBool = true;
        swb_h.classList.replace('bi-sun', 'bi-moon');

    }else{
        document.documentElement.classList.remove('dark');
        localStorage.setItem('theme', 'light');
        darkBool = false;
        swb_h.classList.replace('bi-moon', 'bi-sun');

    }
    console.log('Root switch dmode to: ' + n + ', while darkbool is: ' + darkBool);
    for(var ifr of document.getElementsByTagName('iframe')){
        ifr.contentWindow.DarkSwitch(darkBool);
    }

}
// Whenever the user explicitly chooses to respect the OS preference, use: 
const cdop = () => {localStorage.setItem('theme', '');}

const jslink = (linkto, method = "_blank") => {
    var al = document.createElement('a');
        al.setAttribute('class', 'hidden');
        al.setAttribute('target', method);
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



function alertt (txt, ant = null, type = null) {
    if(txt == 9){
        swal("Code ⑨", "Something unknown wrong happend...", "error");
        return;
    }
    //alert(txt);
    // whether wanna use sweetalert can change here.
    if(ant === null) swal(txt);
    else {
        if(type === null) swal(ant, txt);
        else swal(ant, txt, type);
    }

}

const logOffProcedure = () => {
    // tried fetchapi but not work.
    var logOffReq = new XMLHttpRequest();
    logOffReq.open('get', `${JSP_PATH}/user/logoff`);
    logOffReq.send();
    setTimeout(()=>{
        window.location.href = JSP_PATH;
    }, 114);
}

const captcha = (info) => {
    swal(info, {
        buttons: false,
        timer: 3000,
    }).then(()=>{
        swal("Done", {
            buttons: false,
            timer: 500,})
    })
};


const compareTimeNow = (target) => {//                                  .replace(/-/g, '/')
    return (new Date().setTime(new Date().getTime() - (new Date(target).getTime()) / (6*600*1000)));
}


// const jvavDateTime2Js = (target) => {}

const compareDateNow = (target) => { // target is the date of some datetime's millisec.
    var targetDate = new Date(target);


}

const calcRemainDay = (target) => {

}

const wshut = () => {
    document.body.style.background = "white";
    document.body.innerHTML = '<div class="m-12 font-bold text-3xl text-black dark:text-black font-mono">bye!... or you maybe want to take a look ours <a class="text-blue-500" href="/about">About Page</a>...... click <a href="javascript:location.reload();"  class="text-blue-500">HERE</a> to refresh this page.</div>';
}

const alertConfirm = (type, title, description, trueBtn, falsBtn, next = 'console.log', nextparam = 'confirm: ') => {
    // type of modal, title of alert, desc of alert, trueButton text, falseButton text,
    // next-step function, next-step function parameters.
    swal(title, description, (type == 'none' ? null : type), {buttons: [falsBtn, trueBtn]})
        .then((value) => {
            if(value == null) value = false;
            eval('next(' + value + ', ' + nextparam + ');');
            return value;
        });

    return false; //default final one...
}

console.log('Loaded: GeneralHelpers.js');
