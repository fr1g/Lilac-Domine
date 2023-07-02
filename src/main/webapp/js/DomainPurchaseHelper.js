var _reqBuy, _reqRe,
    _sentReqBuy = false,
    _sentReqRe = false;

const PurchaseDom = (type, domain, year, month) => {
    switch (type){
        case "new":
            _reqBuy = new XMLHttpRequest();
            _reqBuy.onreadystatechange = BuyDomRecall;
            BuyDom(domain, (year == "" ? 0 : year), (month == "" ? 0 : month));
            break;
        case "re":
            _reqRe = new XMLHttpRequest();
            _reqRe.onreadystatechange = RenewRecall;
            RenewDom(domain, (year == "" ? 0 : year), (month == "" ? 0 : month));
            break;
    }
}

const RenewNow = (domain) => {
    // Show modal
    parent.RenewHandler(domain);
}

const RenewDom = (domain, year, month) => {
    // renew procedure
    _reqRe.open('post', JSP_PATH + '/domain/re');
    var _prepare = domain + "$" + year + "$" + month;
    console.log(_prepare);
    _sentReqRe = true;
    _reqRe.send(_prepare);
}

const RenewRecall = () => {
    if(!_sentReqRe) return;
    switch (_reqRe.responseText){
        case "done":
            alertt("You just successfully renew your domain.", "DONE!", "success");
            break;
        case "balance-not-enough":
            alertt("Seems your fund cannot afford your cost.", "Your wallet...", "warning");
            break;
        case "record-empty": // need to replace all banned chars in backend...
            alertt("Seems there's no such a record...", "So żal...", "warning");
            break;
        default:
            alertt("Unknown error has occur. Try again or contact us?", "Error", "error");
            break;
    }


}


const BuyDom = (domain, year, month) => {
    _reqBuy.open('post', JSP_PATH + '/domain/buy');
    var _prepare = domain + "," + year + "," + month;
    _sentReqBuy = true;
    _reqBuy.send(_prepare);
}

const BuyDomRecall = () => {
    if(!_sentReqBuy) return;
    switch (_reqBuy.responseText){
        case "done":
            alertt("You just successfully bought your domain.", "DONE!", "success");
            break;
        case "balance-not-enough":
            alertt("Seems your fund cannot afford your cost.", "Your wallet...", "warning");
            break;
        case "already": // need to replace all banned chars in backend...
            alertt("This one already registered...", "So żal...", "warning");
            break;
        default:
            alertt("Unknown error has occur. Try again or contact us?", "Error", "error");
            break;
    }

}



var swar_sent = false, swar;
const SwitchAutoRenew = (did) => {
    swar = new XMLHttpRequest();
    swar.open('post', JSP_PATH + '/domain/swar');
    swar.onreadystatechange = swarResp;
    swar.send(did);
    swar_sent = true;
}
const swarResp = () => {
    if(swar_sent)
        if(swar.responseText.includes("switched."))
            setTimeout(()=>{window.location.reload()}, 787);
}



const GetPrice = (domain, year, month, apply) => { // apply is a HTMLElement...
    var pricegetter = new XMLHttpRequest();
    pricegetter.open("post", JSP_PATH + "/domain/get-price");
    pricegetter.onreadystatechange = () => {
        apply.innerHTML = pricegetter.responseText;
    }
    pricegetter.send(domain + "$" + (year == "" ? 0 : year) + "$" + (month == "" ? 0 : month));
}