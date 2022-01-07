<?php
require_once("../application/modules/admin/models/AtividadeEsportiva.php");

class Admin_AtividadeesportivaController extends Zend_Controller_Action
{
    public function init(){}

    public function indexAction(){}

    public function createAction(){
        $this->view->title = "DojoSys Admin - Cadastro de Esporte";
        
        if(isset($_POST['submitted'])){
            $atvesp = new Admin_Model_AtividadeEsportiva;
            $atvesp->setNomAtv(ucwords(strtolower($_POST['nomatv'])));
            $result = $atvesp->createAtivEsp();
            if( !$result ){
                echo '<script>document.getElementById("painel").style.display="none";</script>
                    <div class="text-center">
                        <span class="btn-lg glyphicon glyphicon-exclamation-sign"></span>
                        <h4 class="text-danger text-center">Erro no Cadastro</h4>
                    </div>
                    <script>
                        setTimeout("location.href = baseUrl+\'/admin/atividadeesportiva/create\';",3500);
                    </script>';
            }else{
                echo '<script>document.getElementById("painel").style.display="none";</script>
                    <div class="text-center">
                        <span class="btn-lg glyphicon glyphicon-ok-sign"></span>
                        <h4 class="text-success text-center">Salvo com Sucesso</h4>
                    </div>
                    <script>
                        setTimeout("location.href = baseUrl+\'/admin/atividadeesportiva/create\';",3500);
                    </script>'; 
            }
        }
    }

    public function retrieveAction(){
        $this->view->title = "DojoSys Admin - Consulta Esportes";
        

        if (isset($_POST['retrieveatvesp']) && $_POST['retrieveatvesp'] == 'loaded'){
            $pesquisa = new Admin_Model_AtividadeEsportiva;
            $unid = new Admin_Model_Unidade;
            $result = $pesquisa->retrieveAtivEsp();

            while( $row = mysql_fetch_array($result)){
                echo    '<tr>
                            <td class="col-delete text-center">
                                <input type="checkbox" name="codigo[]" value="' . $row['CodAtvEsp'] . '" />
                            </td>
                            <td>
                                <input type="hidden" id="code" value="'.$row['CodAtvEsp'].'" />
                                <span id="spanclick" ondblclick="redirectToUpdate(baseUrl,\'admin/atividadeesportiva\',$(this).parent().find(\'#code\').attr(\'value\'));"><h6 class="table-content">'.$row['NomAtvEsp'].'</h6></span>
                            </td>
                            <td>';
            } 
            exit;
        }

    }

    /**
     * ACAO PARA ATUALIZAR UMA LINHA DE ATIV ESPORTIVA
     **/
    public function updateAction(){   
        $this->view->title = "DojoSys Admin - Atualiza Esportes";
        
        $atvesp = new Admin_Model_AtividadeEsportiva;
        if(!isset($_POST['submitted'])){
            $unidade = new Admin_Model_Unidade;
            $codatvesp = $_GET['code'];
            $this->view->codatvesp = $codatvesp;
            
            $atvesp->setCodAtvEsp($codatvesp);
            $result = $atvesp->getDataForUpdate();
            $row = mysql_fetch_array($result);

            //SETTA VARIAVES COM DADOS CADASTRADOS
            $this->view->nomatvesp = $row['NomAtvEsp'];

        }
        else{
            //FAZ ATUALIZAÇÃO
            $atvesp->setCodAtvEsp($_POST['codatvesp']);
            $atvesp->setNomAtv(ucwords(strtolower($_POST['nomatv'])));
            $atvesp->updateAtivEsp();
             echo '<script>document.getElementById("painel").style.display="none";</script>
                    <div class="text-center">
                        <span class="btn-lg glyphicon glyphicon-ok-sign"></span>
                        <h4 class="text-success text-center">Atualizado com Sucesso</h4>
                    </div>
                    <script>
                        setTimeout("location.href = baseUrl+\'/admin/atividadeesportiva/retrive\';",3500);
                    </script>'; 
        }
    }

    /**
     * ACAO DE DELEÇÃO DE ATIV. ESPORTIVA
     * EXCLUI GRADUACAO ON CASCADE
     **/
    public function deleteAction(){
        Zend_Layout::getMvcInstance()->disableLayout();
        
        $codatvesp = $_POST['codigos'];
        if(sizeof($codatvesp) != 0){
            $atvesp = new Admin_Model_AtividadeEsportiva;
            for($i = 0; $i < sizeof($codatvesp);$i++){
                $atvesp->setCodAtvEsp(intval($codatvesp[$i]));
                $atvesp->deleteAtivEsp();
            }
            echo '<script>
                    setTimeout("location.href = baseUrl+\'/admin/atividadeesportiva/create\';",3500);
                </script>';
        }else{

        }
    }
}