

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
    <head>
        <!--        <link rel="stylesheet" href="css/bootstrap.min.css">
                <link rel="stylesheet" href="js/jquery/jquery-ui.css">
                <script src="js/bootstrap.min.js"></script>-->
        <!-- <script src="js/jquery/jquery-ui.js" ></script> -->
        <!--<script src="../../../js/jquery-3.0.0.js"></script>-->
        <!--        <script src="http://code.jquery.com/jquery-1.9.1.js"></script>-->
        <!--<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>-->
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    
    </head>
    <body>

        <a href="novaTarefa">Criar nova tarefa</a> 

        <br /> <br />        

        <table>
            <tr>
                <th>Id</th>
                <th>Descrição</th>
                <th>Finalizado?</th>
                <th>Data de finalização</th>
            </tr>
            <c:forEach items="${tarefas}" var="tarefa">
                <tr>
                    <td>${tarefa.id}</td>
                    <td>${tarefa.descricao}</td>
                    <c:if test="${tarefa.finalizado eq false}">
                        <td id="tarefa_${tarefa.id}"><a href="#" onClick="finalizarAgora(${tarefa.id})"> Finalizar Agora tarefa_${tarefa.id}</a></td>

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
                $.get("finalizarTarefa?id=" + id, function (){
                    alert("Tarefa Finalizada " );
                    $("tarefa_"+id).html("Finalizada Com Ajax");
                });
                
            }
        </script>
    </body>
</html>