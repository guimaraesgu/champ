<?php
require_once("../application/modules/admin/models/Graduacao.php");
require_once("../application/modules/admin/models/AtividadeEsportiva.php");

class Admin_GraduacaoController extends Zend_Controller_Action
{

    public function init(){}

    public function indexAction(){}
    
    public function populateselectAction(){
        if (isset($_POST['atvespgra']) && $_POST['atvespgra'] == 'loaded'){
            $atvesp = new Admin_Model_AtividadeEsportiva;
            $result = $atvesp->getAllAtvEsps();

            echo '<option>' . 'Selecione Ativ. Esportiva' . '</option>';
            while( $row = mysql_fetch_array($result)){
                echo '<option value="' . $row['CodAtvEsp'] . '">' . $row['NomAtvEsp'] . '</option>';
            } 
            exit;
        }
    }

    public function createAction()
    {
        $this->view->title = "DojoSys Admin - Cadastro de Graduação";
        
        
        if(isset($_POST['submitted'])){
        	$graduacao = new Admin_Model_Graduacao;
        	$nomgra    = $_POST['nomgra'];
        	$atvespgra = $_POST['atvespgra'];

        	for($i = 0; $i < sizeof($nomgra); $i++){
        		$graduacao->setNomGra(ucwords(strtolower($nomgra[$i])));
                $graduacao->setAtvEspGra($atvespgra[$i]);
        		$result = $graduacao->createGraduacao();
                if(!result){
                    $i = sizeof($nomgra);
                }
        	}
            if( !$result ){
                echo '<script>document.getElementById("painel").style.display="none";</script>
                    <div class="text-center">
                    <span class="btn-lg glyphicon glyphicon-exclamation-sign"></span>
                    <h4 class="text-danger text-center">Erro no Cadastro</h4>
                    </div>
                    <script>
                        setTimeout("location.href = baseUrl+\'/admin/graduacao/create\';",3500);
                    </script>';
            }else{
                echo '<script>document.getElementById("painel").style.display="none";</script>
                    <div class="text-center">
                    <span class="btn-lg glyphicon glyphicon-ok-sign"></span>
                    <h4 class="text-success text-center">Salvo com Sucesso</h4>
                    </div>
                    <script>
                        setTimeout("location.href = baseUrl+\'/admin/graduacao/create\';",3500);
                    </script>'; 
            }
        }
    }

    public function retrieveAction()
    {
        $this->view->title = "DojoSys Admin - Consulta Graduações";
        
        $graduacao = new Admin_Model_Graduacao;
        $atvesp    = new Admin_Model_AtividadeEsportiva;
        $this->view->filtro_grad   = $graduacao->retrieveFiltroGraduacao();
        $this->view->filtro_atvesp = $atvesp->retrieveFiltroAtvEsp();

        if (isset($_POST['retrievegrad']) && $_POST['retrievegrad'] == 'loaded'){
            
            if(isset($_POST['filtro']) && $_POST['filtro'] != 'Tudo' && $_POST['tipo_filtro'] == 'grad'){
                $graduacao->setNomGra($_POST['filtro']);
            }
            elseif(isset($_POST['filtro']) && $_POST['filtro'] != 'Tudo' && $_POST['tipo_filtro'] == 'atvesp'){
                $graduacao->setAtvEspGra($_POST['filtro']);
            }

            $result = $graduacao->retrieveGraduacao();
            
            while( $row = mysql_fetch_array($result)){
                echo '<tr>
                        <td class="col-delete text-center">
                        <input type="checkbox" name="codigo[]" value="' . $row['CodGra'] . '" />
                        </td>
                        <td>
                        <input type="hidden" id="code" value="'.$row['CodGra'].'" />
                        <span id="spanclick" ondblclick="redirectToUpdate(baseUrl,\'admin/graduacao\',$(this).parent().find(\'#code\').attr(\'value\'));"><h6 class="table-content">'.$row['NomGra'].'</h6></span>
                        </td>
                        <td><h6 class="table-content">'.$row['NomAtvEsp'].'</h6></td>
                    </tr>';
            } 
            mysql_free_result($result);

            exit;
        }
    }

    /**
     * ACAO PARA ATUALIZAR UMA LINHA DE GRADUACAO
     **/
    public function updateAction(){   
        $this->view->title = "DojoSys Admin - Atualiza Graduação";
        
        $grad = new Admin_Model_Graduacao;
        if(!isset($_POST['submitted'])){
            $codgra = $_GET['code'];
            $this->view->codgra = $codgra;
            
            $grad->setCodGra($codgra);
            $result = $grad->getDataForUpdate();
            $row = mysql_fetch_array($result);

            //SETTA VARIAVES COM DADOS CADASTRADOS
            $this->view->nomgra = $row['NomGra'];
            $this->view->nomatvesp = $row['NomAtvEsp'];
            $this->view->codatvesp = $row['CodAtvEsp'];

            //BUSCA E SETTA VARIAVEL COM OPÇÕES PARA O SELECT
            $atvesp = new Admin_Model_AtividadeEsportiva;
            $this->view->atvespsResult = $atvesp->getAllAtvEsps();
        }
        else{
            //FAZ ATUALIZAÇÃO
            $grad->setCodGra($_POST['codgra']);
            $grad->setNomGra(ucwords(strtolower($_POST['nomgra'])));
            $grad->setAtvEspGra($_POST['atvespgra']);
            $grad->updateGraduacao();
             echo '<script>document.getElementById("painel").style.display="none";</script>
                    <div class="text-center">
                        <span class="btn-lg glyphicon glyphicon-ok-sign"></span>
                        <h4 class="text-success text-center">Atualizado com Sucesso</h4>
                    </div>
                    <script>
                        setTimeout("location.href = baseUrl+\'/admin/graduacao/retrieve\';",3500);
                    </script>'; 
        }
    }

    /**
     * ACAO DE DELEÇÃO DE GRADUACAO
     * EXCLUI HISTORICOGRADUACAO ON CASCADE
     **/
    public function deleteAction()
    {
        Zend_Layout::getMvcInstance()->disableLayout();
        
        $codgra = $_POST['codigos'];
        if(sizeof($codgra) != 0){
            $grad = new Admin_Model_Graduacao;
            for($i = 0; $i < sizeof($codgra);$i++){
                $grad->setCodGra(intval($codgra[$i]));
                $grad->deleteGraduacao();
            }
            echo '<script>
                        setTimeout("location.href = baseUrl+\'/admin/graduacao/retrieve\';",3500);
                    </script>';
        }else{

        }
    }
}