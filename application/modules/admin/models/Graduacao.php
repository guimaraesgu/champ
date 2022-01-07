<?php
require_once('../db/conn.php');

class Admin_Model_Graduacao
{
	//Atributos
	/**
	 * Codidgo da Graduacao
	 *@integer
	 */
	private $CodGra;

	/**
	 * Nome da Graduacao
	 *@string
	 */
	protected $NomGra;
	  
	/**
	 * Nome da Ativ Esportiva 
	 *@string
	 */
	protected $AtvEspGra;
	  

	 //***** GETTERS LOCAL *****\\
	/**
	 * @return the $CodGra
	 */
	public function getCodGra() {
		return $this->CodGra;
	}

	/**
	 * @return the $NomGra
	 */
	public function getNomGra() {
		return $this->NomGra;
	}

	/**
	 * @return the $AtvEspGra
	 */
	public function getAtvEspGra() {
		return $this->AtvEspGra;
	}

	//***** GETTERS DB *****\\
	public function getCodGraDB(){
		$result = mysql_query("SELECT CodGra FROM Graduacao WHERE NomGra = '$this->NomGra' AND CodAtvEsp = '$this->AtvEspGra'");
	 	$row    = mysql_fetch_array($result);
	 	return $row['CodGra'];
	 	mysql_free_result($result);
	}
	
	public function getGradAtvEsp($codatvesp){
		return mysql_query("SELECT CodGra, NomGra FROM Graduacao WHERE CodAtvEsp = $codatvesp");
	}
	
	public function getDataForUpdate(){
		return mysql_query("SELECT NomGra, CodAtvEsp, NomAtvEsp FROM Graduacao NATURAL JOIN 
																	 AtividadeEsportiva 
																WHERE CodGra = $this->CodGra");
	}

	public function countGraduacao(){
		$result = mysql_query("SELECT COUNT(CodGra) FROM Graduacao WHERE CodAtvEsp = 1");
		return mysql_result($result,0);
	}
	
	//***** SETTERS LOCAL *****\\
	/**
	 * @param field_type $CodGra
	 */
	public function setCodGra($CodGra) {
		$this->CodGra = $CodGra;
	}

	/**
	 * @param field_type $NomGra
	 */
	public function setNomGra($NomGra) {
		$this->NomGra = $NomGra;
	}

	/**
	 * @param field_type $AtvEspGra
	 */
	public function setAtvEspGra($AtvEspGra) {
		$this->AtvEspGra = $AtvEspGra;
	}
	  
	//***** CREATE GRADUACAO *****\\
	public function createGraduacao(){  
		$result = mysql_query("INSERT INTO Graduacao VALUES(DEFAULT, '$this->NomGra', '$this->AtvEspGra')");
		return $result;
	}
	
	//**** RETRIEVE GRADUACAO ****\\
	public function retrieveGraduacao(){
		if(isset($this->NomGra)){
			return mysql_query("SELECT CodGra, NomGra, NomAtvEsp FROM Graduacao NATURAL JOIN
																      AtividadeEsportiva
																 WHERE NomGra = '$this->NomGra'");
		}
		elseif(isset($this->AtvEspGra)){
			return mysql_query("SELECT CodGra, NomGra, NomAtvEsp FROM Graduacao NATURAL JOIN
																      AtividadeEsportiva
																 WHERE NomAtvEsp = '$this->AtvEspGra'");
		}
		else{
			return mysql_query("SELECT CodGra, NomGra, NomAtvEsp FROM Graduacao NATURAL JOIN
																      AtividadeEsportiva");
		}
	}

	public function retrieveFiltroGraduacao(){
		return mysql_query("SELECT DISTINCT NomGra FROM Graduacao");
	}

	//***** UPDATE GRADUACAO *****\\
	public function updateGraduacao(){
		mysql_query("UPDATE Graduacao SET NomGra = '$this->NomGra', CodAtvEsp = '$this->AtvEspGra' WHERE CodGra = '$this->CodGra'");
	}
	
	//***** DELETE GRADUACAO *****\\
	public function deleteGraduacao(){
		mysql_query("DELETE FROM Graduacao WHERE CodGra = '$this->CodGra'");
	}
}

