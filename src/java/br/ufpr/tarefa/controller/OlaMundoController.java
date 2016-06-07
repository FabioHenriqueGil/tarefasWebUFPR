/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufpr.tarefa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author fabio
 */
@Controller
public class OlaMundoController {
    
    @RequestMapping("/olaMundoSpring")
    public String digaOla() {
        System.out.println("Executando a logica com spring mvc");
        return "ok";
    }
}
