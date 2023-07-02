document.getElementById('tbar').addEventListener("click", (e) => {
    if (e.target.classList.contains('lmn')) {
        for (var sib of document.getElementsByClassName('inners')) {
            sib.classList.remove('texttoright');
        }
        e.target.firstElementChild.classList.add('texttoright');
        // console.log(e.target.id);
        // on select, let all add hidden, and then remove the target ones' hidden
        for (var disp of document.getElementsByClassName('displayd')) {
            disp.classList.replace('sh', 'hidden');
        }
        eval(`document.getElementById('content-${e.target.id}').classList.replace('hidden', 'sh');`);
    } else return;
});


if (document.getElementById('group').innerHTML.includes('dmin')) {
    document.getElementById('ords').classList.remove('hidden');
    document.getElementById('usrs').classList.remove('hidden');
    document.getElementById('arch').classList.remove('hidden');
}

console.log('Loaded: PanelHelper.js');
