document.getElementById('tbar').addEventListener("click", (e)=>{
    if(e.target.classList.contains('lmn')){ 
        for(var sib of document.getElementsByClassName('inners')){
            sib.classList.remove('texttoright');
        }
        e.target.firstElementChild.classList.add('texttoright');
        // console.log(e.target.id);
        // on select, let all add hidden, and then remove the target ones' hidden
        for(var disp of document.getElementsByClassName('displayd')){
            disp.classList.replace('sh', 'hidden');
        }
        eval(`document.getElementById('content-${e.target.id}').classList.replace('hidden', 'sh');`);
    } else return;
});

if(document.getElementById('group').innerHTML.includes('dmin')) {
    document.getElementById('ords').classList.remove('hidden');
    document.getElementById('usrs').classList.remove('hidden');
    document.getElementById('arch').classList.remove('hidden');
}

document.getElementById('fund-tag').addEventListener('click', ()=>{LaunchModal('fund')});



const LaunchModal = (target) => {
    switch (target){
        case "fund":
            window.location.href = window.location.href + "#addfund";
            break;
        case "renew":
            window.location.href = window.location.href + "#renew";
            break;
    }
    window.location.reload();
}

// PAGINATION HELPERS

const GetTotalPages = (Fors) => {
    var _pagecount = 0;
    var data={
        username: ``,
        target: `${Fors}`
    }
    // fetch('/user/getTotalPages',{
    //     method:'POST', //?
    //     body: data
    // })
    // .then(response => { _pagecount = parseInt(response); });
    // return _pagecount;
}



const GetPageResult_Domain = (page) => {
    var actualQuery;
    if(page > parseInt(QueryTotalPages_Domain)) {
        PaginationInput_Domain.setAttribute('placeholder', `${QueryTotalPages_Domain} / ${QueryTotalPages_Domain}`);
        actualQuery = QueryTotalPages_Domain;
    }
    else if(page <= 0) {
        PaginationInput_Domain.setAttribute('placeholder', `1 / ${QueryTotalPages_Domain}`);
        actualQuery = 1    
    }
    else actualQuery = page;

    var data={
        username: ``,
        reqPage: actualQuery
    }
    // fetch('/user/getDomainsPage',{
    //     method:'POST', //?
    //     body: data
    // })
    // .then(response => { DeployResult_Domain(response); })
    // .then(data => console.log(data)); //?
    
}
// var 
const DeployResult_Domain = (domainResult) => {
    // clear page
    // result jsonize.
    var results = [];
    for(var result of results)
    PagiTable_Domain.appendChild(`
        <tr class="rounded">
            <td class="rounded border-0 text-left">example.com</td>
            <td class="rounded border-0 text-left">2023.05.20</td>
            <td class="rounded border-0 price">128.50</td>
            <td class="rounded border-0 text-center w-min">
                <button class="btn-sm my-0.5 transition-all btn-primary h-full" onclick="SwitchAutoRenew()"><span class="bi bi-question-circle"></span> Sw.AutoRenew</button>
                <button class="btn-sm my-0.5 transition-all btn-success h-full" onclick="RenewNow()"><span class="bi bi-question-circle"></span> Renew Now</button>
                <button class="btn-sm my-0.5 transition-all btn-warning h-full" onclick="alertt(9)"><span class="bi bi-question-circle"></span> Ask</button>
            </td>
        </tr>
    `); // append single result.
}
// QDP END ======
console.log('Loaded: PanelHelper.js');
