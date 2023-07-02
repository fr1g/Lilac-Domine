var _currPath = window.location.href;
var regform = document.getElementById('regf');
var logform = document.getElementById('loginf');
// var pwdRegex = new RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{7,16}');
// var pwdRegex = new RegExp(`^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-={}[\]|\\:;"'<>,.?/]).{6,16}$`);
var pwdRegex = new RegExp('.{6,16}'); //,
    // HostPathRegexStaging = new RegExp(`${(window.location.protocol)+'//'+(window.location.host)}/.*/`),
    // HostPathRegexRelease = new RegExp(`${(window.location.protocol)+'//'+(window.location.host)}/`);
// var pwdRegex = new RegExp('[0-9][a-z][A-Z]');

var titl = document.getElementById('titleLogin');
const swla = (ii) => {
    switch(ii){
        case 1:
            regform.classList.replace('arj', 'hidden');
            logform.classList.replace('hidden', 'arj');
            document.title = "Login - LilacCloud.Domine_";
            titl.innerHTML = "Login!_";
            window.location.href.replace('login', 'register');
            window.location.href.replace('lar', 'register');
            break;
        case 0:
            logform.classList.replace('arj', 'hidden');
            regform.classList.replace('hidden', 'arj');
            document.title = "Register - LilacCloud.Domine_";
            titl.innerHTML = "Regin!_";
            window.location.href.replace('register', 'login');
            break;
        default:
            return;
    }
}

var alert_line = document.getElementById('warnline'),
    pwd1 = document.getElementById('pwdr1'),
    pwd2 = document.getElementById('pwdr2'),
    agreeCheck = document.getElementById('agree'),
    keepCheck = document.getElementById('remember');

var regSubmit = document.getElementById('regb'),
    logSubmit = document.getElementById('linb');

var _illegal = "err: Your password must: at least contains Upper and lower case alphabets and number and chatacters (like dash, dot, slash, or comma) each for one, while length between 6 and 16.<br>",
    _notsame = "err: Your password twice not asame.<br>";

pwd1.addEventListener("blur", () => {tst_pwd();});
pwd2.addEventListener("blur", () => {tst_pwd();});

const tst_pwd = () => {
    var compare = pwd1.value;
    if (!pwdRegex.test(compare)){
        console.log('LEGALITY not passed: ' + pwdRegex.test(compare) + ` with ${compare}`);
        if(!alert_line.innerHTML.includes('must')) alert_line.innerHTML += _illegal;
    }else alert_line.innerHTML = alert_line.innerHTML.replace(_illegal, "");
     
//
    if (compare != pwd2.value){
        console.log('SAMECHECK not passed');
        if(!alert_line.innerHTML.includes('same')) alert_line.innerHTML += _notsame;
    }else alert_line.innerHTML = alert_line.innerHTML.replace(_notsame, "");

    if(!(alert_line.innerHTML.includes('same') || alert_line.innerHTML.includes('must'))) setNextButton(regSubmit, false);
    else setNextButton(regSubmit, true);
     
}

const setNextButton= (elem, swit) => {
    if(swit) elem.setAttribute('disabled', 'true');
    else elem.removeAttribute('disabled');
}

var regReq, logReq;
regform.addEventListener("submit", (e)=>{ // REG
    e.preventDefault();
    console.log(e.target);
    if(!agreeCheck.checked) alertt('You must agree, or exit from our bloody service!', 'Term Of Use', 'warning');
    else{
        new Promise(resolve => {resolve(captcha("Observing and checking your safety status..."));}).then(()=>{
            setTimeout(()=>{continueReg();}, '3501');
        });
    }
});

var sentReg = 0;
const continueReg = () => {
    console.log('starting...');
    regReq = new XMLHttpRequest();
    regReq.open('POST', `${JSP_PATH}/user/register/`);
    regReq.setRequestHeader("Content-Type", "application/json");
    regReq.onreadystatechange = regReturn;
    // get data
    var esqdata = `{ "username": "${document.getElementById('unameNew').value}", "email": "${document.getElementById('email').value}", "password": "${pwd2.value}" }`;
    regReq.send(esqdata);
    sentReg = 1;
    delete esqdata;
}

const regReturn = () => {
    if(sentReg)
        switch (regReq.responseText) {
            case '用户名已存在':
                alertt('This guy with this username already exist in our records...', 'Already...?', 'info');
                break;
            case '注册成功':
                alertt('Now you registered on!', 'Success', 'success');
                setTimeout(()=>{
                    if(window.location.href.includes('regi')) window.location.href = window.location.href.replace("register", "login");
                    else window.location.href = window.location.href.replace("lar", "login");
                }, 514)
                break;
            default:
                alertt('Unknown Error.', 'Failed', 'error');
                return;
        }
    regReq = null;
}

var sentLog = 0;
logform.addEventListener("submit", (e)=>{ // LOG
    e.preventDefault();
    console.log(e);
    logReq = new XMLHttpRequest();
    logReq.open('POST', `${JSP_PATH}/user/login/`);
    logReq.setRequestHeader("Content-Type", "application/json");
    logReq.onreadystatechange = logReturn;
    // get data
    var esqdata = `{ "username": "${document.getElementById('uname').value}", "password": "${document.getElementById('pwd').value}" }`;
    logReq.send(esqdata);
    sentLog = 1;
    delete esqdata;
});

const logReturn = () => {
    if(sentLog)
        switch (logReq.responseText) {
            case '用户名或密码错误':
                alertt('One of your password or username went error. Forgot password? Please contact us.', 'Password or Username error.', 'info');
                break;
            case '登录成功':
                alertt('Waiting for page reload...', 'Success', 'success');
                setTimeout(()=>{
                    if(window.location.href.includes('logi')) window.location.href = window.location.href.replace("login", "panel");
                    else window.location.href = window.location.href.replace("lar", "");
                }, 514)
                break;
            case '用户已被封禁':
                alertt('Your account maybe disabled. Perhaps banned by some reason. Contact us for more detail...', 'Disabled Account', 'error');
                // window.location.reload();
                break;
            default:
                alertt('Unknown Error.', 'Failed! XoX', 'error');
                return;
        }
    logReq = null;
}

// const logOffProcedure = () => {
//     var realPathRoot = '';
//     // if(_currPath.includes('/Lilac')) realPathRoot = _currPath.replace(HostPathRegexStaging[Symbol.replace](_currPath, ""), "");
//     // else realPathRoot = _currPath.replace(HostPathRegexRelease[Symbol.replace](_currPath, ""), "");
//     fetch(`${JSP_PATH}/user/logoff`)
//         .then((response) => {
//             window.location.href = JSP_PATH;
//         })
// } transmitted to generic helpers.


if(_currPath.includes('register')) swla(0)
else swla(1);

console.log('Loaded: LoginAndRegFormHelper.js');
