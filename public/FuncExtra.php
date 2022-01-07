<?php
class FuncExtra {
	/**
	 * calcCateg
	 * @return categoria do aluno
	 */
	public function calcCateg($ano){
		date_default_timezone_set('America/Sao_Paulo');
		$ano_atual = date("Y");
		
		$sub13 = $ano_atual - 12;
		$sub15 = $ano_atual - 14;
		$sub17 = $ano_atual - 16;
		$sub20 = $ano_atual - 19;
		
		if( $ano >= $sub13 ){ //CONSIDERA Sub 13
			$categ = "Sub 13";
		}
		elseif($ano < $sub13 && $ano >= $sub15){ //CONSIDERA Sub 15
			$categ = "Sub 15";
		}
		elseif($ano < $sub15 && $ano >= $sub17){ //CONSIDERA Sub 17
			$categ = "Sub 17";
		}
		elseif($ano < $sub17 && $ano >= $sub20){ //CONSIDERA Sub 20
			$categ = "Sub 20";
		}
		else{	//CONSIDERA SENIOR
			$categ = "Senior";
		}
	
		return $categ;
	}
	
	/**
	 * Funcao Calcula Classe da Pessoa
	 * @param unknown_type $peso
	 * @param unknown_type $sexo
	 * @param unknown_type $categ
	 * @return string
	 */
	public function calcClasse($peso, $sexo, $categ){
		
		if ( $sexo == 'M'){
			if( $categ == "Sub 13" ){  //CONSIDERA Sub 13
				if($peso <= 28){
					return "Super Ligeiro";
				}
				elseif( $peso > 28 && $peso <= 31){
					return "Ligeiro";
				}
				elseif( $peso > 31 && $peso <= 34){
					return "Meio Leve";
				}
				elseif( $peso > 34 && $peso <= 38){
					return "Leve";
				}
				elseif( $peso > 38 && $peso <= 42 ){
					return "Meio Medio";
				}
				elseif( $peso > 42 && $peso <= 47){
					return "Medio";
				}
				elseif( $peso > 47 && $peso <= 52){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
			elseif($categ == "Sub 15"){	//CONSIDERA Sub 15
				if($peso <= 36){
					return "Super Ligeiro";
				}
				elseif( $peso > 36 && $peso <= 40){
					return "Ligeiro";
				}
				elseif( $peso > 40 && $peso <= 44){
					return "Meio Leve";
				}
				elseif( $peso > 44 && $peso <= 48){
					return "Leve";
				}
				elseif( $peso > 48 && $peso <= 53){
					return "Meio Medio";
				}
				elseif( $peso > 53 && $peso <= 58){
					return "Medio";
				}
				elseif( $peso > 58 && $peso <= 64){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
			elseif($categ == "Sub 17"){ //CONSIDERA Sub 17
				if($peso <= 50){
					return "Super Ligeiro";
				}
				elseif( $peso > 50 && $peso <= 55){
					return "Ligeiro";
				}
				elseif( $peso > 55 && $peso <= 60){
					return "Meio Leve";
				}
				elseif( $peso > 60 && $peso <= 66){
					return "Leve";
				}
				elseif( $peso > 66 && $peso <= 73){
					return "Meio Medio";
				}
				elseif( $peso > 73 && $peso <= 81){
					return "Medio";
				}
				elseif( $peso > 81 && $peso <= 90){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
			elseif($categ == "Sub 20"){
				if($peso <= 55){
					return "Super Ligeiro";
				}
				elseif( $peso > 55 && $peso <= 60){
					return "Ligeiro";
				}
				elseif( $peso > 60 && $peso <= 66){
					return "Meio Leve";
				}
				elseif( $peso > 66 && $peso <= 73){
					return "Leve";
				}
				elseif( $peso > 73 && $peso <= 81){
					return "Meio Medio";
				}
				elseif( $peso > 81 && $peso <= 90){
					return "Medio";
				}
				elseif( $peso > 90 && $peso <= 100){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
			elseif($categ == "Senior"){
				if($peso <= 55){
					return "Super Ligeiro";
				}
				elseif( $peso > 55 && $peso <= 60){
					return "Ligeiro";
				}
				elseif( $peso > 60 && $peso <= 66){
					return "Meio Leve";
				}
				elseif( $peso > 66 && $peso <= 73){
					return "Leve";
				}
				elseif( $peso > 73 && $peso <= 81){
					return "Meio Medio";
				}
				elseif( $peso > 81 && $peso <= 90){
					return "Medio";
				}
				elseif( $peso > 90 && $peso <= 100){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
		}
		else{
			if($categ == "Sub 13"){
				if($peso <= 36){
					return "Super Ligeiro";
				}
				elseif( $peso > 36 && $peso <= 40){
					return "Ligeiro";
				}
				elseif( $peso > 40 && $peso <= 44){
					return "Meio Leve";
				}
				elseif( $peso > 44 && $peso <= 48){
					return "Leve";
				}
				elseif( $peso > 48 && $peso <= 53){
					return "Meio Medio";
				}
				elseif( $peso > 53 && $peso <= 58){
					return "Medio";
				}
				elseif( $peso > 58 && $peso <= 64){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
			elseif($categ == "Sub 15"){
				if($peso <= 36){
					return "Super Ligeiro";
				}
				elseif( $peso > 36 && $peso <= 40){
					return "Ligeiro";
				}
				elseif( $peso > 40 && $peso <= 44){
					return "Meio Leve";
				}
				elseif( $peso > 44 && $peso <= 48){
					return "Leve";
				}
				elseif( $peso > 48 && $peso <= 53){
					return "Meio Medio";
				}
				elseif( $peso > 53 && $peso <= 58){
					return "Medio";
				}
				elseif( $peso > 58 && $peso <= 64){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
			elseif($categ == "Sub 17"){
				if($peso <= 40){
					return "Super Ligeiro";
				}
				elseif( $peso > 40 && $peso <= 44){
					return "Ligeiro";
				}
				elseif( $peso > 44 && $peso <= 48){
					return "Meio Leve";
				}
				elseif( $peso > 48 && $peso <= 52){
					return "Leve";
				}
				elseif( $peso > 52 && $peso <= 57){
					return "Meio Medio";
				}
				elseif( $peso > 57 && $peso <= 63){
					return "Medio";
				}
				elseif( $peso > 63 && $peso <= 70){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
			elseif($categ == "Sub 20"){
				if($peso <= 44){
					return "Super Ligeiro";
				}
				elseif( $peso > 44 && $peso <= 48){
					return "Ligeiro";
				}
				elseif( $peso > 48 && $peso <= 52){
					return "Meio Leve";
				}
				elseif( $peso > 52 && $peso <= 57){
					return "Leve";
				}
				elseif( $peso > 57 && $peso <= 63){
					return "Meio Medio";
				}
				elseif( $peso > 63 && $peso <= 70){
					return "Medio";
				}
				elseif( $peso > 70 && $peso <= 78){
					return "Meio Pesado";
				}
				else{
					return"Pesado";
				}
			}
			elseif($categ == "Senior"){
				if($peso <= 44){
					return "Super Ligeiro";
				}
				elseif( $peso > 44 && $peso <= 48){
					return "Ligeiro";
				}
				elseif( $peso > 48 && $peso <= 52){
					return "Meio Leve";
				}
				elseif( $peso > 52 && $peso <= 57){
					return "Leve";
				}
				elseif( $peso > 57 && $peso <= 63){
					return "Meio Medio";
				}
				elseif( $peso > 63 && $peso <= 70){
					return "Medio";
				}
				elseif( $peso > 70 && $peso <= 78){
					return "Meio Pesado";
				}
				else{
					return "Pesado";
				}
			}
		}
	}
	
	/**
	 * Funcao Calcula Idade da Pessoa
	 * @param unknown_type $dNasc
	 * @return unknown
	 */
	public function calcIdade($dNasc){
		$dN = $dNasc;
		$data_nasc = split("-",$dN);
		$anob = $data_nasc[0];
		$mesb = $data_nasc[1];
		$diab = $data_nasc[2];
		list ($dia,$mes,$ano) = explode("/",date("d/m/Y"));
		$idade = $ano-$anob;
		$idade = (($mes<$mesb) OR (($mes==$mesb) AND ($dia<$diab))) ? --$idade : $idade;
	
		return $idade;
	}
	
	/**
	 * Funcao Separa Ano de Nascimento da Data de Nascimento.
	 * @param unknown_type $dNasc
	 * @return unknown
	 */
	public function calcAno($dNasc){
		$dN = $dNasc;
		$data_nasc = split("-",$dN);
		$ano = $data_nasc[0];
		return $ano;
	}

	/**
	 * Funcao Retorna se Aluno Pode Trocar de Faixa.
	 * @param unknown_type $ano
	 * @param unknown_type $grad
	 * @param unknown_type $ponto
	 * @param unknown_type $pontoE
	 * @return boolean
	 */
	public function trocaFaixa($ano, $grad, $ponto, $pontoE){
		date_default_timezone_set('America/Sao_Paulo');
		list ($dia,$mes,$ano_atual) = explode("/",date("d/m/Y"));

		$ano_lim = $ano_atual - 12;
		if($ano < $ano_lim){
			if($grad == "Branca" AND $ponto >= "70" AND $pontoE >= "1"){
				return true;
			}
			elseif($grad == "Azul Claro" AND $ponto >= "70" AND $pontoE >= "1"){
				return true;
			}
			elseif($grad == "Azul Escuro" AND $ponto >= "70" AND $pontoE >= "1"){
				return true;
			}
			elseif($grad == "Azul" AND $ponto >= "70" AND $pontoE >= "1"){
				return true;
			}
			elseif($grad == "Amarela" AND $ponto >= "120" AND $pontoE >= "2"){
				return true;
			}
			elseif($grad == "Laranja" AND $ponto >= "250" AND $pontoE >= "3"){
				return true;
			}
			elseif($grad == "Verde" AND $ponto >= "300" AND $pontoE >= "4"){
				return true;
			}
			elseif($grad == "Roxa" AND $ponto >= "400" AND $pontoE >= "5"){
				return true;
			}
			elseif($grad == "Marrom" AND $ponto >= "500" AND $pontoE >= "6"){
				return true;
			}
		}
		else{
			return false;
		}
	}

	public function pontosGrad($grad){
		if($grad == "Branca"){
			return 70;
		}
		elseif($grad == "Azul"){
			return 70;
		}
		elseif($grad == "Azul Claro"){
			return 70;
		}
		elseif($grad == "Azul Escuro"){
			return 70;
		}
		elseif($grad == "Amarela"){
			return 120;
		}
		elseif($grad == "Laranja"){
			return 250;
		}
		elseif($grad == "Verde"){
			return 300;
		}
		elseif($grad == "Roxa"){	// DE ROXA PARA MARROM
			return 400;
		}
		elseif($grad == "Marrom"){
			return 500;
		}
	}

	public function pontosEspGrad($grad){
		if($grad == "Branca"){
			return 1;
		}
		elseif($grad == "Azul"){
			return 1;
		}
		elseif($grad == "Azul Claro"){
			return 1;
		}
		elseif($grad == "Azul Escuro"){
			return 1;
		}
		elseif($grad == "Amarela"){
			return 2;
		}
		elseif($grad == "Laranja"){
			return 3;
		}
		elseif($grad == "Verde"){
			return 4;
		}
		elseif($grad == "Roxa"){
			return 5;
		}
		elseif($grad == "Marrom"){
			return 6;
		}
	}
	
	/**
	 * Funcao Retorna Pontuacao do Evento
	 * @param string $fed
	 * @param string $tipo_eve
	 * @param string $func
	 * @param string $coloc
	 * @return Ambigous <NULL, number>
	 */
	public function calcPontEvento( $fed, $tipo_eve, $func, $coloc ){
		$var = null;

		if($fed == "FMJ" OR $fed == "LMJ"){
			if($tipo_eve == "Competicao"){
				if($func == "Competidor" ){ //COMPETIDOR
					if($coloc == "1"){
						$var = 15;
					}
					elseif($coloc == "2"){
						$var = 13;
					}
					elseif($coloc == "3"){
						$var = 11;
					}
					else{
						$var = 8;
					}
				}
				elseif($func == "Arbitro"){ //ARBITRO
					$var = 15;
				}
				elseif($func == "Oficial"){ //OFICIAL
					$var = 10;
				}
				elseif($func == "Assistiu"){ //ASSISTIU
						$var = 3;
				}
			}
			elseif($tipo_eve == "Curso"){
				if($func == "1" ){ //ARBITRO
					$var = 15;
				}
				elseif($func == "2"){ //OFICIAL TECNICO
					$var = 10;
				}
			}
			else{
				if($func == "1" ){ //EM DIA
					$var = 5;
				}
				elseif($func == "2"){ //ATRASADO
					$var = 1;
				}
			}
		}elseif($fed == "Holistico"){
				if($func == "Competidor" ){ //COMPETIDOR
					if($coloc == "1"){
						$var = 20;
					}
					elseif($coloc == "2"){
						$var = 17;
					}
					elseif($coloc == "3"){
						$var = 15;
					}
					else{
						$var = 10;
					}
				}
				elseif($func == "Arbitro"){ //ARBITRO
					$var = 20;
				}
				elseif($func == "Oficial"){ //OFICIAL
					$var = 15;
				}
				elseif($func == "Assistiu"){ //ASSISTIU
					$var = 3;
				}
		}	
		return $var;
	}

	/**
	 * 
	 * 
	 */
	public function calcProxGrad($grad, $ano){
		date_default_timezone_set('America/Sao_Paulo');
		$ano_atual = date('Y');
		$ano_lim = $ano_atual - 12;
		if($ano < $ano_lim){
			if($grad == "Branca" || $grad == "Cinza" || $grad == "Azul Claro" || $grad == "Azul Escuro" || $grad == "Azul"){
				return "Amarela";
			}
			elseif($grad == "Amarela"){
				return "Laranja";
			}
			elseif($grad == "Laranja"){
				return "Verde";
			}
			elseif($grad == "Verde"){
				return "Roxa";
			}
			elseif($grad == "Roxa"){
				return "Marrom";
			}
			elseif($grad == "Marrom"){
				return "Preta";
			}
		}
		else{
			if($grad == "Branca"){
				return "Cinza";
			}
			elseif($grad == "Cinza"){
				return "Azul Claro";
			}
			elseif($grad == "Azul Claro"){
				return "Azul Escuro";
			}
			elseif($grad == "Azul Escuro"){
				return "Amarela";
			}
			elseif($grad == "Amarela"){
				return "Laranja";
			}
			elseif($grad == "Laranja"){
				return "Verde";
			}
			elseif($grad == "Verde"){
				return "Roxa";
			}
			elseif($grad == "Roxa"){
				return "Marrom";
			}
			elseif($grad == "Marrom"){
				return "Preta";
			}
		}	
	}
}