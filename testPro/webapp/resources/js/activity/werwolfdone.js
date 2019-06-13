window.onload = function () {	
	var count = document.getElementsByClassName("count")[0];
	var btn = document.getElementsByClassName("btn")[0];
	var url = document.getElementsByClassName("btn")[0].href;
	btn.onclick = function () {
		clearInterval(timer);
	}
	var num = 10;
	var timer = setInterval(function () {
		num--;
		count.innerHTML = num;
		if (num===0) {
			clearInterval(timer);
			window.location.href =url;	
		};

	}, 1000);
}