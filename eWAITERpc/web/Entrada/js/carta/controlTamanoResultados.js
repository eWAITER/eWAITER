$(document).ready(controlTamano)
function controlTamano() {
    if(window.innerHeight <= 900){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/carta/cartaV900.css';
	head.appendChild(link);
    }
    if(window.innerHeight <= 1000 && window.innerHeight >= 901){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/carta/cartaV1000.css';
	head.appendChild(link);
    }
    if(window.innerHeight >= 1001){
        var head  = document.getElementsByTagName('head')[0];
        var link  = document.createElement('link');
	link.rel  = 'Stylesheet';
	link.type = 'text/css';
	link.href = '../../css/carta/cartaV1080.css';
	head.appendChild(link);
    }
    
}