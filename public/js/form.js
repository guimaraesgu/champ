/**
 * FUNÇÃO PARA HABILITAR E DESABILITAR CAMPOS EM FORMULARIOS
 */
function disableFields(){
	var element = document.getElementById("tippes");
	var tippes  = element.value;
	if( tippes == 'A'){
		document.getElementById("parentesco").style.display = "block";
		document.getElementById("judo").style.display = "block";
		document.getElementById("filiacao").style.display = "block";
		document.getElementById("peso").style.display = "block";
		document.getElementById("label_peso").style.display = "block";
	}
	else if( tippes == 'P'){
		document.getElementById("tabhistorico").style.display = "block";
		document.getElementById("peso").style.display = "block";
		document.getElementById("label_peso").style.display = "block";
		document.getElementById("unidadefunc").style.display = "none";
	}
	else if( tippes == 'F'){
		document.getElementById("tabhistorico").style.display = "none";
		document.getElementById("peso").style.display = "none";
		document.getElementById("label_peso").style.display = "none";
		document.getElementById("unidadefunc").style.display = "block";
	}
}

/**
 * FUNÇÃO PARA ADICIONAR CAMPO DE DIAS DE AULA DE UMA TURMA
 */
var clonado = 0;
function newAdd(){
	if( clonado < 2){
		if(clonado == 0){
			document.getElementById("clonable").className = "col-md-5";
			var clone = document.getElementById("clonable").cloneNode(true);
			clone.className += " clone1"
			var dest  = document.getElementById("destclone");
			dest.appendChild (clone);
		}else if(clonado == 1){
			var clon = document.getElementsByName("clon");
			for( i = 0 ; i < clon.length; i++){
				clon[i].className = "col-md-4";
				if(i == 1){
					clon[i].className = "col-md-4 clone1";
				}
			}
			var clone = document.getElementById("clonable").cloneNode(true);
			clone.className += " clone2"
			var dest  = document.getElementById("destclone");
			dest.appendChild (clone);
		}
		clonado++;
	}else{
		return false;
	}
}

/**
 * FUNÇÃO PARA REMOVER CAMPO DE DIAS DE AULA DE UMA TURMA
 */
function removeDiaAula(){
	$('.clone'+clonado).remove();
	if ( clonado == 2 ){
		var clon = document.getElementsByName("clon");
		for( i = 0 ; i < clon.length; i++){
			clon[i].className = "col-md-5";
			if(i == 1){
				clon[i].className = "col-md-5 clone1";
			}
		}
		clonado--;
	}
	else if( clonado == 1){
		document.getElementById("clonable").className = "col-md-9";
		clonado--;
	}
}

function incClonado(){
	clonado++;
}

/**
 * FUNÇÃO PARA ADICIONAR CAMPO DE GRADUACAO 
 */
function newAdd2(){
	var clone = document.getElementById('grad').cloneNode(true);
	var dest  = document.getElementById('grad_dest');

	dest.appendChild (clone);

	var camposClonados = clone.getElementsByTagName('label','input');
	for( i = 0; i<camposClonados.length;i++){  
        camposClonados[i].value = '';  
    }  
}
