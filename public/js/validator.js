function IsNum(v){
	var validChars = "0123456789";
	var isNumber   = true;
	var char;
	
	for (var i = 0; i < v.length && IsNumber == true; i++) 
	{ 
		char = v.charAt(i); 
		if (validChars.indexOf(char) == -1) 
		{
			isNumber = false;
		}
	}
	return isNumber;
}

/* Fun‹o para validar se campo est‡ preenchido */
function validar(){
	var formulario = document.getElementById("formulario");
	if(formulario.nompes.value == ""){
		alert("Campo Nome nao pode ser nulo!");
		formulario.nompes.style.backgroundColor = "grey";
		return false;
	}
	
	else if(formulario.date.value = ""){
		alert("Campo Data de Nascimento nao pode ser nulo!");
		formulario.date.style.backgroundColor = "grey";
		return false;
	}
	
	else if(formulario.psopes.value == ""){
		alert("Campo Peso nao pode ser nulo!");
		formulario.psopes.style.backgroundColor = "grey";
		return false;
	}
	
}

function formatarCEP(){
	var formulario = document.getElementById("formulario");
	var cep        = formulario.cep;
	var val_cep    = cep.value;

	var re_cep     = /^([\d]{5})([\d]{3})$/;
	document.getElementById("cep").maxLength = "9";
	cep.value = cep.value.replace(re_cep,"$1-$2");
}


function validarCpf(){
	var formulario = document.getElementById("formulario");
	var cpf        = formulario.cpf;
	var val_cpf    = cpf.value;
	var soma       = 0;
	
	var re_cpf     = /^([\d]{3})([\d]{3})([\d]{3})([\d]{2})$/;
	
	if(!re_cpf.test(val_cpf)){
		alert("CPF Invalido!");
		cpf.value.focus();
		return false;
	}
	else{
		var aux1 = val_cpf.length - 1;
		for(var i = 0;i < val_cpf.length - 2; i++ ){
			digito = parseInt(val_cpf.charAt(i), 10);
			soma = soma+(digito * aux1);
			
			aux1 -= 1;
		}
		
		resto = soma % 11;
		if(resto < 2){
			digito1 = 0;
		}
		else{
			digito1 = 11 - resto;
		}
		if(digito1 != parseInt(val_cpf.charAt(9), 10)){
			alert("CPF Invalido!");
			cpf.value.focus();
			return false;
		}
		else{
			soma = 0;
			//Testa digito2
			var aux2 = val_cpf.length;
			for(var i = 0;i < val_cpf.length - 1; i++ ){
				digito = parseInt(val_cpf.charAt(i), 10);
				soma = soma+(digito * aux2);
				
				aux2 -= 1;
			}
			
			resto = soma % 11;
			if(resto < 2){
				digito2 = 0;
			}
			else{
				digito2 = 11 - resto;
			}
			
			if(digito2 != parseInt(val_cpf.charAt(10), 10)){
				alert("CPF Invalido!");
				cpf.value.focus();
				return false;
			}
			else{
				document.getElementById("cpf").maxLength = "14";
				cpf.value = cpf.value.replace(re_cpf,"$1.$2.$3-$4");
				return true;
			}
			
		}
	}
}

function validarCpfMae(){
	var formulario = document.getElementById("formulario");
	var cpf        = formulario.cpfmae;
	var val_cpf    = cpf.value;
	var soma       = 0;
	
	var re_cpf     = /^([\d]{3})([\d]{3})([\d]{3})([\d]{2})$/;
	
	if(!re_cpf.test(val_cpf)){
		alert("CPF Invalido!");
		cpfmae.value.focus();
		return false;
	}
	else{
		var aux1 = val_cpf.length - 1;
		for(var i = 0;i < val_cpf.length - 2; i++ ){
			digito = parseInt(val_cpf.charAt(i), 10);
			soma = soma+(digito * aux1);
			
			aux1 -= 1;
		}
		
		resto = soma % 11;
		if(resto < 2){
			digito1 = 0;
		}
		else{
			digito1 = 11 - resto;
		}
		if(digito1 != parseInt(val_cpf.charAt(9), 10)){
			alert("CPF Invalido!");
			cpfmae.value.focus();
			return false;
		}
		else{
			soma = 0;
			//Testa digito2
			var aux2 = val_cpf.length;
			for(var i = 0;i < val_cpf.length - 1; i++ ){
				digito = parseInt(val_cpf.charAt(i), 10);
				soma = soma+(digito * aux2);
				
				aux2 -= 1;
			}
			
			resto = soma % 11;
			if(resto < 2){
				digito2 = 0;
			}
			else{
				digito2 = 11 - resto;
			}
			
			if(digito2 != parseInt(val_cpf.charAt(10), 10)){
				alert("CPF Invalido!");
				cpfmae.value.focus();
				return false;
			}
			else{
				document.getElementById("cpfmae").maxLength = "14";
				cpfmae.value = cpfmae.value.replace(re_cpf,"$1.$2.$3-$4");
				return true;
			}
			
		}
	}
}

function validarCNPJ(){
	var formulario = document.getElementById("formulario");
	var cnpj       = formulario.cnpj;
	var re_cnpj    = /^([\d]{2})([\d]{3})([\d]{3})([\d]{4})([\d]{2})$/;
	var val_cnpj   = cnpj.value;
	var soma       = 0;
	
	if(!isNum(val_cnpj)){
		alert("CNPJ deve conter somente digitos.");
		cnpj.value.focus();
		return false;
	}
	else{
		if(!re_cnpj.test(val_cnpj)){
			alert("CNPJ Invalido!");
			cnpj.value.focus();
			return false;
		}
		else{
			var aux1 = val_cnpj.length - 1;
			for(var i = 0;i < val_cnpj.length - 2; i++ ){
				digito = parseInt(val_cnpj.charAt(i), 10);
				soma += digito * aux1;
				
				aux1--;
			}
			
			resto = soma % 11;
			if(resto <= 2){
				digito1 = 0;
			}
			else{
				digito1 = 11 - resto;
			}
			
			if(digito1 != parseInt(val_cnpj.charAt(9), 10)){
				alert("CNPJ Invalido!");
				cnpj.value.focus();
				return false;
			}
			else{
				//Testa digito2
				var aux2 = val_cnpj.length;
				for(var i = 0;i < val_cnpj.length - 1; i++ ){
					digito = parseInt(val_cnpj.charAt(i), 10);
					soma += digito * aux2;
					
					aux2--;
				}
				
				resto = soma % 11;
				if(resto <= 2){
					digito2 = 0;
				}
				else{
					digito2 = 11 - resto;
				}
				
				if(digito2 != parseInt(val_cnpj.charAt(9), 10)){
					alert("CNPJ Invalido!");
					cnpj.value.focus();
					return false;
				}
				else{
					cnpj.value = cnpj.value.replace(re_cnpj,"$1.$2.$3-$4");
					alert("CNPJ Valido!");
					return true;
				}
				
			}
		}
	}
}

function validarRegFed(){
	var formulario = document.getElementById("formulario");
	var federacao  = new Array();
	federacao = formulario.CodFed;
	var registro   =  new Array();
	registro = formulario.regfed;

	
	if(federacao.length > registro.length){
		alert("Erro: Voce selecionou mais federacoes do que incluiu registros.");
	}
	else if(federacao.sizeOf() < registro.sizeOf()){
		alert("Erro: Voce incluiu mais registros do que federacoes selecionadas.");
	}
}