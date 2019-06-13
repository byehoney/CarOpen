window.onload = function () {
    var slide = document.getElementById("imgbox");
    var ul = slide.children[0];
    var lis = ul.children;
    var arrLeft = document.getElementById("arrLeft");
    var arrRight = document.getElementById("arrRight");
    var mutimer=null;

    var config = [
            {width:286, height:178, top:46, left:44, zIndex:1},
            {width:312, height:218, top:32, left:64, zIndex:2},
            {width:404, height:274, top:0, left:84, zIndex:3},
            {width:312, height:218, top:32, left:188, zIndex:2},
            {width:286, height:178, top:46, left:240, zIndex:1},
    ];

    assign();
    doNext();

    function assign() {
        for (var i = 0; i < lis.length; i++) {
            mumaPic(lis[i], config[i], function () {
                flag = true;
            });
        }
    }
    function doNext () {
        mutimer = setInterval(function () {
                arrLeft.onclick();
            }, 2000)
    }
    
    arrRight.onclick = function () {
        if (flag) {
            clearInterval(mutimer);
            flag = false;
            config.push(config.shift());
            assign();
            doNext ();
        }
    }
    arrLeft.onclick = function () {
        if (flag) {
            clearInterval(mutimer);
            flag = false;
            config.unshift(config.pop());
            assign();
            doNext ();
        }
    }
    var flag = true;   
}
function mumaPic(obj, json, fn) {
    clearInterval(obj.timer);
    obj.timer = setInterval(function () {
        var flag = true;
        for (var k in json) {
            if (k === "opacity") {
                var leader = getStyle(obj, k) * 100;
                var target = json[k] * 100;
                var step = (target - leader) / 10;
                step = step > 0 ? Math.ceil(step) : Math.floor(step);
                leader = leader + step;
                obj.style[k] = leader / 100;
            } else if (k === "zIndex") {
                obj.style.zIndex = json[k];
            } else {
                var leader = parseInt(getStyle(obj, k)) || 0;
                var target = json[k];
                var step = (target - leader) / 10;
                step = step > 0 ? Math.ceil(step) : Math.floor(step);
                leader = leader + step;
                obj.style[k] = leader/100 + "rem";
            }
            if (leader != target) {
                flag = false;
            }
        }
        if (flag) {
            clearInterval(obj.timer);
            if (fn) {
                fn();
            }
        }
    }, 15);
}

function getStyle(obj, attr) {
    if (obj.currentStyle) {
        return obj.currentStyle[attr];
    } else {
        return window.getComputedStyle(obj, null)[attr];
    }
}

