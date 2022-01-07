// autocomplet : this function will be executed every time we change the text
function autocompleta(base_url,controller,strg) {
	baseURL = base_url;
	var aluno = '#aluno'+strg;
	var url = base_url+'/campeonato/'+controller+strg;
	var id  = '#autoaluno'+strg;

	var keyword = $(aluno).val();
	$.ajax({
		url: url,
		type: 'POST',
		cache: false,
		data: {keyword:keyword},
		success:function(data){
			$(id).show();
			$(id).html(data);
		}
	});
}
 
// set_item : this function will be executed when we select an item
function set_item(nompes,codmat,strg) {
	var id  = '#aluno'+strg;
	var codmatid  = '#codmat'+strg;
	var auto  = '#autoaluno'+strg;
	// change input value
	$(id).val(nompes);
	$(codmatid).val(codmat);
	// hide proposition list
	$(auto).hide();

	if(strg == 'edit' || strg == 'campeonato'){
		alunoChange(strg);
	}
} 

function alunoChange(strg){
	var codmatid = '#codmat'+strg;
	var eventoid = '#evento_'+strg;
	$.ajax({
		url: baseURL+'/campeonato/analise/populateselect',
		type: 'post',
		cache: false,
		data: { codmat : $(codmatid).val()},
		success: function(valor) {
			if (valor) {
				$(eventoid).empty().append(valor);
			} 
		}
	});
}