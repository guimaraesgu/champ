/**
 *	FUNÇÃO QUE TRATA DELEÇÕES À PARTIR DA TELA DE CONSULTA
 **/

function excluirMarcados(base_url, model){
    camposMarcados = new Array();
	$("input[type=checkbox][name='codigo[]']:checked").each(function(){
	    camposMarcados.push($(this).val());
	});
	if(camposMarcados.length != 0){
		$('#confirmModal')
		.modal({ backdrop: 'static', keyboard: false })
	    .one('click', '#excluir', function() {
	        $.ajax({
				url: base_url+'/'+model+'/delete',
				type: 'post',
				cache: false,
				data: {codigos : camposMarcados},
				success: function(valor) {
					if (valor) {
						$('#conteudo').append(valor);
						$('#confirmModal').modal('hide');
					} 
				}
			});
	    });
    }else{
    	$('#noCheckModal')
		.modal({ keyboard: true })
    }
}

/**
 * FUNÇÃO PARA REDICIONAR PARA TELA DE UPDATE, 
 * ENVIANDO POR GET O VALOR DO CÓDIGO QUE REFERENCIA NO DB
 **/
function redirectToUpdate(base_url,model,value){
	if( model == "aluno" ){
		dados = value.split('-');
		window.location.href=base_url+'/'+model+'/update?codpes='+dados[0]+'&codmat='+dados[1];
	}
	else{
		window.location.href=base_url+'/'+model+'/update?code='+value;
	}
}

/**
 *
 *
 **/
function updateExameGraduacao(base_url,value){
	$('#confirmModal')
	.modal({ backdrop: 'static', keyboard: false })
    .one('click', '#aprovar', function() {
        $.ajax({
			url: base_url+'/aluno/updateexamegraduacao',
			type: 'post',
			cache: false,
			data: {codigo : value,
				   nota : document.getElementById('nota').value},
			success: function(valor) {
				if (valor) {
					$('#conteudo').append(valor);
					$('#confirmModal').modal('hide');
				} 
			}
		});
    });	
}