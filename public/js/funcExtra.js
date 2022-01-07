function calcAnoIdade(){
	var formulario = document.getElementById("formulario");
	var dtnasc     = formulario.date;
	var ano        = formulario.ano;
	var idade      = formulario.idade;
	var data       = new Date();
	
	dN = dtnasc.value;
	data_nasc = dN.split("-");
	ano_nasc  = data_nasc[0];
	mes_nasc  = data_nasc[1];
	dia_nasc  = data_nasc[2];
	ano_atual = data.getFullYear();
	mes_atual = data.getMonth() + 1;
	dia_atual = data.getDate();
	
	
	idade_parcial = ano_atual - ano_nasc;
	
	if(mes_atual < mes_nasc){
		idade.value = idade_parcial - 1;
	}
	else if((mes_atual == mes_nasc) && (dia_atual < dia_nasc)){
			idade.value = idade_parcial - 1;
	}
	else{
		idade.value = idade_parcial;
	}
	
	ano.value = data_nasc[0];
}

function calcCategClasse(){
	var formulario = document.getElementById("formulario");
	var ano        = formulario.ano.value;
	var peso       = formulario.peso.value;
	var sexo       = formulario.sexo.value;
	var categ      = formulario.categ;
	var classe     = formulario.classe;
	
	var data       = new Date();
	var ano_atual  = data.getFullYear();
	
	
	//Calcular Categoria
	sub13 = ano_atual - 12;
	sub15 = ano_atual - 14;
	sub17 = ano_atual - 16;
	sub20 = ano_atual - 19;
	
	if( ano >= sub13 ){ //CONSIDERA Sub 13
		categ.value = "Sub 13";
	}
	else if(ano < sub13 && ano >= sub15){ //CONSIDERA Sub 15
		categ.value = "Sub 15";
	}
	else if(ano < sub15 && ano >= sub17){ //CONSIDERA Sub 17
		categ.value = "Sub 17";
	}
	else if(ano < sub17 && ano >= sub20){ //CONSIDERA Sub 20
		categ.value = "Sub 20";
	}
	else{	//CONSIDERA SENIOR
		categ.value = "Senior";
	}
	
	//Calcular Classe de Peso
	if ( sexo == 'M'){
		if( categ.value == "Sub 13" ){  //CONSIDERA Sub 13
			if(peso <= 28){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 28 && peso <= 31){
				classe.value =  "Ligeiro";
			}
			else if( peso > 31 && peso <= 34){
				classe.value =  "Meio Leve";
			}
			else if( peso > 34 && peso <= 38){
				classe.value =  "Leve";
			}
			else if( peso > 38 && peso <= 42 ){
				classe.value =  "Meio Medio";
			}
			else if( peso > 42 && peso <= 47){
				classe.value =  "Medio";
			}
			else if( peso > 47 && peso <= 52){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
		else if(categ.value == "Sub 15"){	//CONSIDERA Sub 15
			if(peso <= 36){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 36 && peso <= 40){
				classe.value =  "Ligeiro";
			}
			else if( peso > 40 && peso <= 44){
				classe.value =  "Meio Leve";
			}
			else if( peso > 44 && peso <= 48){
				classe.value =  "Leve";
			}
			else if( peso > 48 && peso <= 53){
				classe.value =  "Meio Medio";
			}
			else if( peso > 53 && peso <= 58){
				classe.value =  "Medio";
			}
			else if( peso > 58 && peso <= 64){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
		else if(categ.value == "Sub 17"){ //CONSIDERA Sub 17
			if(peso <= 50){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 50 && peso <= 55){
				classe.value =  "Ligeiro";
			}
			else if( peso > 55 && peso <= 60){
				classe.value =  "Meio Leve";
			}
			else if( peso > 60 && peso <= 66){
				classe.value =  "Leve";
			}
			else if( peso > 66 && peso <= 73){
				classe.value =  "Meio Medio";
			}
			else if( peso > 73 && peso <= 81){
				classe.value =  "Medio";
			}
			else if( peso > 81 && peso <= 90){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
		else if(categ.value == "Sub 20"){
			if(peso <= 55){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 55 && peso <= 60){
				classe.value =  "Ligeiro";
			}
			else if( peso > 60 && peso <= 66){
				classe.value =  "Meio Leve";
			}
			else if( peso > 66 && peso <= 73){
				classe.value =  "Leve";
			}
			else if( peso > 73 && peso <= 81){
				classe.value =  "Meio Medio";
			}
			else if( peso > 81 && peso <= 90){
				classe.value =  "Medio";
			}
			else if( peso > 90 && peso <= 100){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
		else if(categ.value == "Senior"){
			if(peso <= 55){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 55 && peso <= 60){
				classe.value =  "Ligeiro";
			}
			else if( peso > 60 && peso <= 66){
				classe.value =  "Meio Leve";
			}
			else if( peso > 66 && peso <= 73){
				classe.value =  "Leve";
			}
			else if( peso > 73 && peso <= 81){
				classe.value =  "Meio Medio";
			}
			else if( peso > 81 && peso <= 90){
				classe.value =  "Medio";
			}
			else if( peso > 90 && peso <= 100){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
	}
	else{
		if(categ.value == "Sub 13"){
			if(peso <= 36){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 36 && peso <= 40){
				classe.value =  "Ligeiro";
			}
			else if( peso > 40 && peso <= 44){
				classe.value =  "Meio Leve";
			}
			else if( peso > 44 && peso <= 48){
				classe.value =  "Leve";
			}
			else if( peso > 48 && peso <= 53){
				classe.value =  "Meio Medio";
			}
			else if( peso > 53 && peso <= 58){
				classe.value =  "Medio";
			}
			else if( peso > 58 && peso <= 64){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
		else if(categ.value == "Sub 15"){
			if(peso <= 36){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 36 && peso <= 40){
				classe.value =  "Ligeiro";
			}
			else if( peso > 40 && peso <= 44){
				classe.value =  "Meio Leve";
			}
			else if( peso > 44 && peso <= 48){
				classe.value =  "Leve";
			}
			else if( peso > 48 && peso <= 53){
				classe.value =  "Meio Medio";
			}
			else if( peso > 53 && peso <= 58){
				classe.value =  "Medio";
			}
			else if( peso > 58 && peso <= 64){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
		else if(categ.value == "Sub 17"){
			if(peso <= 40){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 40 && peso <= 44){
				classe.value =  "Ligeiro";
			}
			else if( peso > 44 && peso <= 48){
				classe.value =  "Meio Leve";
			}
			else if( peso > 48 && peso <= 52){
				classe.value =  "Leve";
			}
			else if( peso > 52 && peso <= 57){
				classe.value =  "Meio Medio";
			}
			else if( peso > 57 && peso <= 63){
				classe.value =  "Medio";
			}
			else if( peso > 63 && peso <= 70){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
		else if(categ.value == "Sub 20"){
			if(peso <= 44){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 44 && peso <= 48){
				classe.value =  "Ligeiro";
			}
			else if( peso > 48 && peso <= 52){
				classe.value =  "Meio Leve";
			}
			else if( peso > 52 && peso <= 57){
				classe.value =  "Leve";
			}
			else if( peso > 57 && peso <= 63){
				classe.value =  "Meio Medio";
			}
			else if( peso > 63 && peso <= 70){
				classe.value =  "Medio";
			}
			else if( peso > 70 && peso <= 78){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value = "Pesado";
			}
		}
		else if(categ.value == "Senior"){
			if(peso <= 44){
				classe.value =  "Super Ligeiro";
			}
			else if( peso > 44 && peso <= 48){
				classe.value =  "Ligeiro";
			}
			else if( peso > 48 && peso <= 52){
				classe.value =  "Meio Leve";
			}
			else if( peso > 52 && peso <= 57){
				classe.value =  "Leve";
			}
			else if( peso > 57 && peso <= 63){
				classe.value =  "Meio Medio";
			}
			else if( peso > 63 && peso <= 70){
				classe.value =  "Medio";
			}
			else if( peso > 70 && peso <= 78){
				classe.value =  "Meio Pesado";
			}
			else{
				classe.value =  "Pesado";
			}
		}
	}
}