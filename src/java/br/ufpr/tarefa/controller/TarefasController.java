/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tarefa.controller;

import br.ufpr.tarefa.dao.JdbcTarefaDao;
import br.ufpr.tarefa.modelo.Tarefa;
import java.util.List;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
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
        return "tarefas/adicionada";
    }

    public ModelAndView listarTarefas() {

        JdbcTarefaDao dao = new JdbcTarefaDao();
        List<Tarefa> tarefas = dao.getLista();

        ModelAndView mv = new ModelAndView("tarefas/lista");
        mv.addObject(tarefas);
        return mv;

    }

}
