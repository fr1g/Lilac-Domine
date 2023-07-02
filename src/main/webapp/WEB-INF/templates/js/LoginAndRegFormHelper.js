var regform = document.getElementById('regf');
var logform = document.getElementById('loginf');
// var pwdRegex = new RegExp('^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{7,16}');
// var pwdRegex = new RegExp(`^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+\-={}[\]|\\:;"'<>,.?/]).{6,16}$`);
var pwdRegex = new RegExp('.{6,16}');
// var pwdRegex = new RegExp('[0-9][a-z][A-Z]');
var titl = document.getElementById('titleLogin');
const swla = (ii) => {
    switch (ii) {
        case 1:
            regform.classList.replace('arj', 'hidden');
            logform.classList.replace('hidden', 'arj');
            document.title = "Login - LilacCloud.Domine_";
            titl.innerHTML = "Login!_";
            break;
        case 0:
            logform.classList.replace('arj', 'hidden');
            regform.classList.replace('hidden', 'arj');
            document.title = "Register - LilacCloud.Domine_";
            titl.innerHTML = "Regin!_";
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

pwd1.addEventListener("blur", () => {
    tst_pwd();
});
pwd2.addEventListener("blur", () => {
    tst_pwd();
});

const tst_pwd = () => {
    var compare = pwd1.value;
    if (!pwdRegex.test(compare)) {
        console.log('LEGALITY not passed: ' + pwdRegex.test(compare) + ` with ${compare}`);
        if (!alert_line.innerHTML.includes('must')) alert_line.innerHTML += _illegal;
    } else alert_line.innerHTML = alert_line.innerHTML.replace(_illegal, "");

//
    if (compare != pwd2.value) {
        console.log('SAMECHECK not passed');
        if (!alert_line.innerHTML.includes('same')) alert_line.innerHTML += _notsame;
    } else alert_line.innerHTML = alert_line.innerHTML.replace(_notsame, "");

    if (!(alert_line.innerHTML.includes('same') || alert_line.innerHTML.includes('must'))) setNextButton(regSubmit, false);
    else setNextButton(regSubmit, true);

}

const setNextButton = (elem, swit) => {
    if (swit) elem.setAttribute('disabled', 'true');
    else elem.removeAttribute('disabled');
}

regform.addEventListener("submit", (e) => { // REG
    e.preventDefault();
    console.log(e);
    if (!agreeCheck.checked) alertt('You must agree, or exit from our bloody service!');
});
logform.addEventListener("submit", (e) => { // LOG
    e.preventDefault();
    console.log(e);
});
console.log('Loaded: LoginAndRegFormHelper.js');
