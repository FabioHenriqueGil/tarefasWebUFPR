<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Adiona Contato</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>

    </head>
    <body>

        <form role="form" action="alteraTarefa" method="GET">
            <input type="hidden" name="id" value="${tarefa.id}">
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading" align="center">Alterar</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="nome"></label> <input type="text" placeholder="Descriçao" value="${tarefa.descricao}"
                                                              class="form-control" name="descricao" id="nome">
                            <form:errors path="tarefa.descricao" cssStyle="color:red" /><br> 
                        </div>
                        <label for="check">finalizado?</label> 
                        <input type="checkbox" id="check" name="finalizado" value="true" ${tarefa.finalizado? 'checked' : '' }/><br />
                        <label >Data de Finalizaçao:</label><c:if test="${tarefa.finalizado eq true}">
                            <fmt:formatDate value="${tarefa.dataFinalizacao.time}"
                                            pattern="dd/MM/yyyy"/>


                        </c:if>

                        <br>
                        <button type="submit" class="btn btn-primary">Alterar</button>

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
