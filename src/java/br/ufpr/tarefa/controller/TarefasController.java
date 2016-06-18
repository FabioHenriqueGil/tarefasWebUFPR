/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tarefa.controller;

import br.ufpr.tarefa.dao.JdbcTarefaDao;
import br.ufpr.tarefa.modelo.Tarefa;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author fabio
 */
@Controller
public class TarefasController {
    
    @RequestMapping("novaTarefa")
    public String form() {
        return "tarefas/formulario";
    }
    
    @RequestMapping("adicionaTarefa")
    public String adiciona(@Valid Tarefa tarefa, BindingResult result) {
        if (result.hasFieldErrors("descricao")) {
            return "tarefas/formulario";
        }
        JdbcTarefaDao dao = new JdbcTarefaDao();
        dao.adiciona(tarefa);
        return "redirect:listaTarefas";
    }
    
    @RequestMapping("listaTarefas")
    public String listarTarefas(Model model) {
        JdbcTarefaDao dao = new JdbcTarefaDao();
        List<Tarefa> tarefas = dao.lista();
        
        model.addAttribute("tarefas", tarefas);        
        return "tarefas/lista";
    }
    
    @RequestMapping("removeTarefa")
    public String removeTarefas(Tarefa tarefa) {
        JdbcTarefaDao dao = new JdbcTarefaDao();
        dao.remover(tarefa);
        
        return "redirect:listaTarefas";
    }
    
    @RequestMapping("mostraTarefa")
    public String mostra(Long id, Model model) {
        JdbcTarefaDao dao = new JdbcTarefaDao();
        model.addAttribute("tarefa", dao.buscaTarefa(id));
        
        return "tarefas/mostra";
        
    }
    
    @RequestMapping("alteraTarefa")
    public String altera(@Valid Tarefa tarefa, BindingResult result) {
        
        if (result.hasFieldErrors("descricao")) {
            return "tarefas/mostra";
        }
        
        JdbcTarefaDao dao = new JdbcTarefaDao();
        if (dao.buscaTarefa(tarefa.getId()).getFinalizado() == false && 
                tarefa.getFinalizado() == true) {
            tarefa.setDataFinalizacao(Calendar.getInstance());
        }
        dao.altera(tarefa);
        
        return "redirect:listaTarefas";
    }
    
    @RequestMapping("finalizarTarefa")
    public void finalizaTarefa(Long id, HttpServletResponse response) {
        JdbcTarefaDao dao = new JdbcTarefaDao();
        Tarefa tarefa = dao.buscaTarefa(id);
        tarefa.setFinalizado(true);
        tarefa.setDataFinalizacao(Calendar.getInstance());
        dao.altera(tarefa);
        System.out.println("finalizou");
        response.setStatus(200);        
    }
    
}
