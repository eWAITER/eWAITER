$(document).ready(controlTamanoInfo)
function controlTamanoInfo() {
    if(window.innerHeight <= 900){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/menu/menuV900i.css';
	head.appendChild(link);
    }
    if(window.innerHeight <= 1000 && window.innerHeight >= 901){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/menu/menuV1000i.css';
	head.appendChild(link);
    }
    if(window.innerHeight >= 1001){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/menu/menuV1080i.css';
	head.appendChild(link);
    }
}