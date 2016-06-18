

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <title> Lista de Tarefas</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>

<!--        <script src="js/bootstrap.min.js"/>-->

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js">
        </script>
        <!--    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>-->
    </head>
    <body>

        <div class="container">
            <div class="panel panel-primary">
                <div class="panel-heading" align="center">Lista de Contatos</div>

                <div class="panel panel-primary">
                    <div class="table-responsive">
                        <table class="table">
                            <tr>


                                <td><b>ID</b></td>
                                <td><b>Descrição</b></td>
                                <td><b>Finalizado?</b></td>
                                <td><b>Data de finalização</b></td>
                                <td><b>Alterar</b></td>
                                <td><b>Deletar</b></td>
                            </tr>


                            <c:forEach items="${tarefas}" var="tarefa">
                                <tr>
                                    <td>${tarefa.id}</td>
                                    <td>${tarefa.descricao}</td>
                                    <c:if test="${tarefa.finalizado eq false}">
                                        <td id="tarefa_${tarefa.id}"><a href="#" onClick="finalizarAgora(${tarefa.id})"> Finalizar Agora</a></td>

                                        <td id="data_"${tarefa.id}>

                                        </td>
                                    </c:if>
                                    <c:if test="${tarefa.finalizado eq true}">
                                        <td>Finalizado</td>

                                        <td>
                                            <fmt:formatDate 
                                                value="${tarefa.dataFinalizacao.time}" 
                                                pattern="dd/MM/yyyy"/>
                                        </td>
                                    </c:if>
                                    <td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
                                    <td><a href="mostraTarefa?id=${tarefa.id}">Alterar</td>

                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
                <div align="center">
                    <button class="btn btn-primary"
                            onclick="window.location.href = 'novaTarefa';">ADD
                    </button>
                </div>
            </div>
        </div>






        <!--        <script type="text/javascript">
                    function finalizaAgora(id) {
                        $.get("finalizarTarefa?id=" + id,
                                function (resposta) {
                                    $("#tarefa_" + id).html(resposta);
                                });
                    }
                </script>-->


        <script type="text/javascript" >
            function finalizarAgora(id) {
                $.get("finalizarTarefa?id=" + id, function () {
                    alert("Tarefa Finalizada ");
                    $("tarefa_" + id).html("Finalizada Com Ajax");
                });

            }
        </script>
    </body>
</html>