function parentExecDomainDisable (did, uid){ // cont.
    swal({
        title: 'Seriously?',
        text: `You're about to disable domain with id ` + did + ' which is currently owned by user ' + uid + " !!!",
        icon: 'warning',
        buttons: {
            cancel: {
                text: 'нет',
                value: null,
                visible: true,
                closeModal: true,
            },
            confirm: {
                text: 'да',
                value: true,
                visible: true,
                closeModal: true
            }
        }
    }).then((value)=>{ if(value) AdminRemoveDomainNext(did + "$" + uid); });
}

const AdminRemoveDomainNext = (phrase) => {

    var _cas = new XMLHttpRequest(), cassent = false;
    _cas.open('post', JSP_PATH + '/admin-cont/remove-domain');
    _cas.onreadystatechange = () => {
        if(!cassent) return;
        var _keepCass = _cas.responseText;
        console.log(_keepCass);
        document.getElementById('arch-window').contentWindow.location = JSP_PATH + "/admin-cont/domain/1";
    }
    _cas.send(phrase);
    cassent = true;
    // domain_id$purer_id

}