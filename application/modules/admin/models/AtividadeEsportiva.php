<?php
require_once('../db/conn.php');

class Admin_Model_AtividadeEsportiva
{
	//**** ATTRIB ****\\
	/**
	 * 
	 */
	private $codatvesp;
	
	/**
	 * 
	 */
	private $nomatv;
	
	//**** GETTERS LOCAL ****\\
	/**
	 * @return the $codfed
	 */
	public function getCodAtvEsp() {
		return $this->codatvesp;
	}
	
	/**
	 * @return the $nomatv
	 */
	public function getNomAtv() {
		return $this->nomatv;
	}

	//***** GETTERS DB *****\\
	public function getAtvEspDB(){
		$result = mysql_query("SELECT CodAtvEsp FROM AtividadeEsportiva WHERE NomAtvEsp = '$this->nomatv'");
		$row    = mysql_fetch_array($result);
		return $row['CodAtvEsp'];
		mysql_free_result($result);
        mysql_close();
	}

	public function getNomAtvEsp($codatvesp){
		$result = mysql_query("SELECT NomAtvEsp FROM AtividadeEsportiva WHERE CodAtvEsp = '$codatvesp'");
		$row    = mysql_fetch_array($result);
		return $row['NomAtvEsp'];
		mysql_free_result($result);
        mysql_close();
	}

	public function getAllAtvEsps(){
		return mysql_query("SELECT CodAtvEsp, NomAtvEsp FROM AtividadeEsportiva");
	}

	public function getDataForUpdate(){
		return mysql_query("SELECT NomAtvEsp FROM AtividadeEsportiva WHERE CodAtvEsp = $this->codatvesp");
	}

	//**** SETTERS LOCAL ****\\
	/**
	 * @param field_type $codfed
	 */
	public function setCodAtvEsp($codatvesp) {
		$this->codatvesp = $codatvesp;
	}
	
	/**
	 * @param field_type $nomatv
	 */
	public function setNomAtv($nomatv) {
		$this->nomatv = $nomatv;
	}
	
	//***** CREATE ATIV. ESPORTIVA *****\\
	public function createAtivEsp(){
		$result = mysql_query ("INSERT INTO AtividadeEsportiva VALUES ( DEFAULT, '$this->nomatv')");
		return $result;
	}
	
	//***** RETRIEVE ATIV. ESPORTIVA *****\\
	public function retrieveAtivEsp(){
		return mysql_query("SELECT CodAtvEsp, NomAtvEsp FROM AtividadeEsportiva"); 
	}

	public function retrieveFiltroAtvEsp(){
		return mysql_query("SELECT NomAtvEsp FROM AtividadeEsportiva"); 
	}

	//***** UPDATE ATIV. ESPORTIVA *****\\
	public function updateAtivEsp(){
		mysql_query("UPDATE AtividadeEsportiva SET NomAtvEsp = '$this->nomatv' WHERE CodAtvEsp = '$this->codatvesp'");
	}
	
	//***** DELETE ATIV. ESPORTIVA *****\\
	public function deleteAtivEsp(){
		return mysql_query("DELETE FROM AtividadeEsportiva WHERE CodAtvEsp = '$this->codatvesp'");
	}
}

