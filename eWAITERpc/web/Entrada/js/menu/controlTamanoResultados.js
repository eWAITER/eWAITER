$(document).ready(controlTamano)
function controlTamano() {
    if(window.innerHeight <= 900){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/menu/menuV900.css';
	head.appendChild(link);
    }
    if(window.innerHeight <= 1000 && window.innerHeight >= 901){
        alert("1000");
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/menu/menuV1000.css';
	head.appendChild(link);
    }
    if(window.innerHeight >= 1001){
        alert("1080");
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/menu/menuV1080.css';
	head.appendChild(link);
    }
    
}