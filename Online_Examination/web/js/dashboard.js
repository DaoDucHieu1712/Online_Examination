/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function show_dropdown() {
    document.querySelector('.header__dropdown').classList.toggle('droppdown-ishow');
}


function generate(div, pageIndex, maxPage, gap) {
    var container = document.getElementById(div);
    console.log(container);
    if (pageIndex - gap > 1)
        container.innerHTML += '<a href="#">First</a>';
    for (var i = pageIndex - gap; i < pageIndex; i++) {
        if (i > 0)
            container.innerHTML += '<a href="#">' + i + '</a>';
    }
    container.innerHTML += '<span>' + pageIndex + '</span>';
    for (var i = pageIndex + 1; i <= pageIndex + gap; i++) {
        if (i <= maxPage)
            container.innerHTML += '<a href="#">' + i + '</a>';
    }
    if (maxPage + gap < maxPage)
        container.innerHTML += '<a href="#">Last</a>';
}