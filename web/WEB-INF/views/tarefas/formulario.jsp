<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Adiona Tarefas</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>

    </head>
    <body>

        <form role="form" action="adicionaTarefa" method="POST">
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading" align="center">Cadastro de Tarefas</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="nome"></label> <input type="text" placeholder="Descriçao"
                                                              class="form-control" name="descricao" id="nome">

                            <form:errors path="tarefa.descricao" cssStyle="color:red" /><br> 
                        </div> 
                        <button type="submit" class="btn btn-primary">Adicionar</button>

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
