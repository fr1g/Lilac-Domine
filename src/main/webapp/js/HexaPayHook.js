var sent_hexa = false;
var xaw = new XMLHttpRequest();

const HexaResult = () => {
    if(!sent_hexa) return;
    switch (xaw.responseText){
        default:
            if(xaw.responseText.includes("HTTP")) alertt("Unknown error. Perhaps 500.", "Problem", "warning");
            else alertt(xaw.responseText, "Done!", "success");
            break;
        case "useless_hexahook":
            alertt("please try again.", "Invalid Cert", "error");
            break;
        case "not_log_in":
            alertt("User Login Cert. Invalid...");
            break;
        case "failed":
            alertt("Unknown error.", "Fatal Error", "error");
            break;
    }
}

const HexaPay = (raw, stage) => {
    new Promise(resolve => {
        resolve(captcha("Confirming Order to HexaPay..."));
    }).then(()=>{
        setTimeout(()=>{
            xaw.onreadystatechange = HexaResult;
            xaw.open('post', JSP_PATH + '/user/updfund');
            xaw.send(Math.abs(parseFloat(raw)) + '@' + stage);
            sent_hexa = true;
        }, '3501');
    });
}

console.log('Hooked with HexaPay.');