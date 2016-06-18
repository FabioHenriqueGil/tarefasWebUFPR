<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Adiona Contato</title>
        <!--        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
                <link rel="stylesheet" href="../../../js/jquery/jquery-ui.css">-->
        <!--<script src="../../../js/bootstrap.min.js"></script>-->
        <!-- <script src="js/jquery/jquery-ui.js" ></script> -->
        <!-- <script src="js/jquery/jquery-1.9.1.js"></script> -->
        <!--        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
                <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>-->

    </head>
    <body>

        <form role="form" action="alteraTarefa" method="GET">
            <input type="hidden" name="id" value="${tarefa.id}">
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading" align="center">Alterar</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="nome">Descrição</label> <input type="text" value="${tarefa.descricao}"
                                                                       class="form-control" name="descricao" id="nome">
                        </div>
                        finalizado? <input type="checkbox" name="finalizado" value="true" ${tarefa.finalizado? 'checked' : '' }/><br />
                        Data de finalizaçao:<c:if test="${tarefa.finalizado eq true}">
                             <fmt:formatDate  value="${tarefa.dataFinalizacao.time}" 
                                             pattern="dd/MM/yyyy"/>


                        </c:if>



                        <form:errors path="tarefa.descricao" cssStyle="color:red" /><br>    
                        <button type="submit" class="btn btn-primary">Alterar</button>

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
