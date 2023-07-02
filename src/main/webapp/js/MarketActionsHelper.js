const BuyHook = (target) => {// whatever. it's not important...
    if("${USER_ == null}" == "true")
        window.location.href = window.location.href.replace('market', 'login#new!' + target);
    else
        window.location.href = window.location.href.replace('market', 'panel#new!' + target);
}

const AskAnswer = () => {
    if(!qdsiSent) return;
    var _keepAnswer = qdsiReq.responseText;
    //qdsiSent = false;
    if(_keepAnswer.includes('ex')) return alertt("something that you cannot solve happened...", "Internal Error", "error");
    else if(_keepAnswer.includes(",")){
        if(_keepAnswer.includes("1,1")) return alertt("This one already registered...", "So żal...", "warning");
        else{
            var price = _keepAnswer.split(",");
            swal({
                title: 'Yay!',
                text: `This sweety not registered yet. If you want, you may take it in price #$${price} per month. \n You can retry if the pop-up window blocked by your browser... after you allowed our healthy and useful pop-ups of course! `,
                icon: 'success',
                buttons: {
                    cancel: {
                        text: 'Later...',
                        value: null,
                        visible: true,
                        closeModal: true,
                    },
                    confirm: {
                        text: 'Sure!',
                        value: true,
                        visible: true,
                        closeModal: true
                    }
                }
            }).then((value) => {
                if(value) if(!parseInt(userdat)){
                    localStorage.setItem("lilac-forward", "/panel#new!" + sdom.value);
                    window.location.href = JSP_PATH + "/lar"; //?
                } else window.location.href = JSP_PATH + "/panel#new!" + sdom.value; //?

            });
        }
    }
}

var queryDomainStatInput = document.getElementById('queryDomainStatInput'),
    sdom = document.getElementById('sdom'),
    qdsiSent = false, qdsiReq;
queryDomainStatInput.addEventListener('submit', (e) => {
    e.preventDefault();
    qdsiReq = new XMLHttpRequest();
    qdsiReq.open('post', JSP_PATH + '/domain/ask');
    qdsiReq.onreadystatechange = AskAnswer;
    qdsiReq.send(sdom.value);
    qdsiSent = true;
});

