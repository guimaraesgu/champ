function submitForm(){
		//Atributo da Classe
		var soma      = 0;
		var notafinal = 0;
		var campos    = 0;
		//Pegar Valores da HTML
		var nivtec  = document.getElementById('nivtec').value;

		//Soma notas parte Teórica - É Geral Para Todos
		var notateo = document.getElementsByName('notateo');
		for( i = 0;i < notateo.length;i++){
			if(notateo[i].value != ''){
				soma += parseInt(notateo[i].value);
				campos++;
			}
		}

		//Soma notas parte Técnica - É diferente para cada graduacao

		//Cinza e Preta
		if(nivtec == 1){
			var nota 	= document.getElementsByName('nota');

			for( i = 0;i < nota.length;i++){
				if(nota[i].value != ''){
					soma += parseInt(nota[i].value);
					campos++;
				}
			}
		}

		//Azul
		else if(nivtec == 2){
			var notanage  = document.getElementsByName('notanage');
			var notaossae = document.getElementsByName('notaossae');

			for( i = 0;i < notanage.length;i++){
				if(notanage[i].value != ''){
					if(i < document.getElementById('randnage').value){
						soma += parseInt(notanage[i].value);
						campos++;
					}else{
						soma += parseInt(notanage[i].value)*2;
						campos += 2;
					}
				}
			}
			for( i = 0;i < notaossae.length;i++){
				if(notaossae[i].value != ''){
					if(i < document.getElementById('randossae').value){
						soma += parseInt(notaossae[i].value);
						campos++
					}else{
						soma += parseInt(notaossae[i].value)*2;
						campos += 2;
					}
				}
			}
		}

		//Amarela
		else if(nivtec == 3){
			var notanage  = document.getElementsByName('notanage');
			var notaossae = document.getElementsByName('notaossae');
			var notarenraku = document.getElementsByName('notarenraku');
			var notarenzoku = document.getElementsByName('notarenzoku');
			var notakaeshi  = document.getElementsByName('notakaeshi');

			for(i = 0;i < notanage.length;i++){
				if(notanage[i].value != ''){
					if(i < document.getElementById('randnage').value){
						soma += parseInt(notanage[i].value);
						campos++;
					}else{
						soma += parseInt(notanage[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notaossae.length;i++){
				if(notaossae[i].value != ''){
					if(i < document.getElementById('randossae').value){
						soma += parseInt(notaossae[i].value);
						campos++
					}else{
						soma += parseInt(notaossae[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notarenzoku.length;i++){
				if(notarenzoku[i].value != ''){
					soma += parseInt(notarenzoku[i].value);
					campos++;
				}
			}
			for(i = 0;i < notarenraku.length;i++){
				if(notarenraku[i].value != ''){
					soma += parseInt(notarenraku[i].value);
					campos++;
				}
			}
			for(i = 0;i < notakaeshi.length;i++){
				if(notakaeshi[i].value != ''){
					soma += parseInt(notakaeshi[i].value);
					campos++;
				}
			}
		}

		//Laranja
		else if(nivtec == 4){
			var notanage  = document.getElementsByName('notanage');
			var notaossae = document.getElementsByName('notaossae');
			var notarenraku = document.getElementsByName('notarenraku');
			var notarenzoku = document.getElementsByName('notarenzoku');
			var notakaeshi  = document.getElementsByName('notakaeshi');
			var notashime = document.getElementsByName('notashime');
			var notakansetsu = document.getElementsByName('notakansetsu');

			for(i = 0;i < notanage.length;i++){
				if(notanage[i].value != ''){
					if(i < document.getElementById('randnage').value){
						soma += parseInt(notanage[i].value);
						campos++;
					}else{
						soma += parseInt(notanage[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notaossae.length;i++){
				if(notaossae[i].value != ''){
					if(i < document.getElementById('randossae').value){
						soma += parseInt(notaossae[i].value);
						campos++
					}else{
						soma += parseInt(notaossae[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notarenzoku.length;i++){
				if(notarenzoku[i].value != ''){
					if(i < document.getElementById('randrenzoku').value){
						soma += parseInt(notarenzoku[i].value);
						campos++;
					}else{
						soma += parseInt(notarenzoku[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notarenraku.length;i++){
				if(notarenraku[i].value != ''){
					if(i < document.getElementById('randrenraku').value){
						soma += parseInt(notarenraku[i].value);
						campos++;
					}else{
						soma += parseInt(notarenraku[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notakaeshi.length;i++){
				if(notakaeshi[i].value != ''){
					if(i < document.getElementById('randkaeshi').value){
						soma += parseInt(notakaeshi[i].value);
						campos++;
					}else{
						soma += parseInt(notakaeshi[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notashime.length;i++){
				if(notashime[i].value != ''){
					soma += parseInt(notashime[i].value);
					campos++;
				}
			}
			for(i = 0;i < notakansetsu.length;i++){
				if(notakansetsu[i].value != ''){
					soma += parseInt(notakansetsu[i].value);
					campos++;
				}
			}
			
		}

		//Verde
		else if(nivtec == 5 || nivtec == 6 || nivtec == 7){
			var notanage     = document.getElementsByName('notanage');
			var notaossae    = document.getElementsByName('notaossae');
			var notarenraku  = document.getElementsByName('notarenraku');
			var notarenzoku  = document.getElementsByName('notarenzoku');
			var notakaeshi   = document.getElementsByName('notakaeshi');
			var notashime    = document.getElementsByName('notashime');
			var notakansetsu = document.getElementsByName('notakansetsu');

			for(i = 0;i < notanage.length;i++){
				if(notanage[i].value != ''){
					if(i < document.getElementById('randnage').value){
						soma += parseInt(notanage[i].value);
						campos++;
					}else{
						soma += parseInt(notanage[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notaossae.length;i++){
				if(notaossae[i].value != ''){
					soma += parseInt(notaossae[i].value);
					campos++
				}
			}
			for(i = 0;i < notarenzoku.length;i++){
				if(notarenzoku[i].value != ''){
					if(i < document.getElementById('randrenzoku').value){
						soma += parseInt(notarenzoku[i].value);
						campos++;
					}else{
						soma += parseInt(notarenzoku[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notarenraku.length;i++){
				if(notarenraku[i].value != ''){
					if(i < document.getElementById('randrenraku').value){
						soma += parseInt(notarenraku[i].value);
						campos++;
					}else{
						soma += parseInt(notarenraku[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notakaeshi.length;i++){
				if(notakaeshi[i].value != ''){
					if(i < document.getElementById('randkaeshi').value){
						soma += parseInt(notakaeshi[i].value);
						campos++;
					}else{
						soma += parseInt(notakaeshi[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notashime.length;i++){
				if(notashime[i].value != ''){
					if(i < document.getElementById('randshime').value){
						soma += parseInt(notashime[i].value);
						campos++;
					}else{
						soma += parseInt(notashime[i].value)*2;
						campos += 2;
					}
				}
			}
			for(i = 0;i < notakansetsu.length;i++){
				if(notakansetsu[i].value != ''){
					if(i < document.getElementById('randkansetsu').value){
						soma += parseInt(notakansetsu[i].value);
						campos++;
					}else{
						soma += parseInt(notakansetsu[i].value)*2;
						campos += 2;
					}
				}
			}
		}

		//MEDIA PONDERADA PARA DAR RESULTADO
		notafinal = soma/campos;
		form.notafinal.value = notafinal.toFixed(2);
	}