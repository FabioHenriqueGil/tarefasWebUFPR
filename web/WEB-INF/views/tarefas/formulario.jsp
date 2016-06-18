<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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

        <form role="form" action="adicionaTarefa" method="POST">
            <div class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading" align="center">Cadastro</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="nome">Descrição</label> <input type="text"
                                                                       class="form-control" name="descricao" id="nome">
                        </div>
                        <form:errors path="tarefa.descricao" cssStyle="color:red" />
                        <button type="submit" class="btn btn-primary">Adicionar</button>

                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
