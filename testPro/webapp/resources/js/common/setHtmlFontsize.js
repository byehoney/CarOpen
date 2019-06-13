/**
 * Created by zr on 2018/1/6.
 */
function adapt(designWidth, rem2px){
    var d = window.document.createElement('div');
    d.style.width = '1rem';
    d.style.display = "none";
    var head = window.document.getElementsByTagName('head')[0];
    head.appendChild(d);
//            var defaultFontSize = parseFloat(window.getComputedStyle(d, null).getPropertyValue('width'));
    var defaultFontSize =16;
    var htmlFontSize=(window.innerWidth/(designWidth/rem2px)/defaultFontSize)*100+'%';
    var st = document.createElement('style');
    var portrait = "@media screen and (min-width: "+window.innerWidth+"px) {html{font-size:"+ htmlFontSize +";}}";
    var landscape = "@media screen and (min-width: "+window.innerHeight+"px) {html{font-size:"+ ((window.innerHeight/(designWidth/rem2px)/defaultFontSize)*100) +"%;}}"
    st.innerHTML = portrait + landscape;
    head.appendChild(st);
    return htmlFontSize;
};