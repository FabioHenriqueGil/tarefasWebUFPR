/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tarefa.dao;

import br.ufpr.tarefa.modelo.Tarefa;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import br.ufpr.tarefa.jdbc.MysqlConectionFactory;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author danielkarling
 */
public class JdbcTarefaDao {

    private Connection connection;

    public JdbcTarefaDao(Connection connection) {

        this.connection = connection;
    }

    public JdbcTarefaDao() {
        connection = new MysqlConectionFactory().getConnection();
    }

    public void adiciona(Tarefa tarefa) {

        String sql = "insert into tarefas " + "(descricao,finalizado)" + "values (?,?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, tarefa.getDescricao());
            stmt.setBoolean(2, tarefa.getFinalizado());
            //stmt.setDate(3, new java.sql.Date(tarefa.getDataFinalizacao().getTimeInMillis()));

            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    public Tarefa buscaTarefa(Long id) {
        Tarefa tarefa = new Tarefa();
        String sql = "select * from tarefas where id =" + id;

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet select = stmt.executeQuery();
            while (select.next()) {
                tarefa.setId(select.getLong("id"));
                tarefa.setDescricao(select.getString("descricao"));
                tarefa.setFinalizado(select.getBoolean("finalizado"));

                Date dataFinalizado = select.getDate("dataFinalizacao");
                if (dataFinalizado != null) {
                    Calendar dataFinalizacao = Calendar.getInstance();

                    dataFinalizacao.setTime(dataFinalizado);
                    tarefa.setDataFinalizacao(dataFinalizacao);
                }
            }

            select.close();
            // stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RuntimeException();
        }
        return tarefa;

    }

    public List<Tarefa> lista() {
        String sql = "select * from tarefas";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            List<Tarefa> tarefas = new ArrayList<Tarefa>();
            while (rs.next()) {
                Tarefa tarefa = new Tarefa();
                tarefa.setId(rs.getLong("id"));
                tarefa.setDescricao(rs.getString("descricao"));
                tarefa.setFinalizado(rs.getBoolean("finalizado"));
                if (rs.getDate("dataFinalizacao") != null) {
                    Calendar dataFinalizacao = Calendar.getInstance();
                    dataFinalizacao.setTimeInMillis(rs.getDate("dataFinalizacao").getTime());
                    tarefa.setDataFinalizacao(dataFinalizacao);
                }

                tarefas.add(tarefa);
            }
            stmt.close();
            return tarefas;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public void remover(Tarefa tarefa) {
        String sql = "delete from tarefas where id = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setLong(1, tarefa.getId());

            stmt.execute();
            stmt.close();
        } catch (Exception e) {
        }

    }

    public void altera(Tarefa tarefa) {
        String sql = "update tarefas set descricao =? , finalizado = ? , dataFinalizacao = ? where id=" + tarefa.getId();
        System.out.println(sql);
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);

            stmt.setString(1, tarefa.getDescricao());
            stmt.setBoolean(2, tarefa.getFinalizado());
            if (tarefa.getDataFinalizacao() != null) {
                stmt.setDate(3, new java.sql.Date(tarefa.getDataFinalizacao().getTimeInMillis()));
            }else{
                stmt.setDate(3,null);
            }
            stmt.execute();
            stmt.close();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            throw new RuntimeException();
        }

    }

}
