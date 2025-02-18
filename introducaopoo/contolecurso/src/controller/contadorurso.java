package controller;

import java.util.ArrayList;
import java.util.List;

import model.Aluno;
import model.Professor;

public class contadorurso {
 // atributos

private String Nomecurso;
private Professor Professor;
private List<Aluno> Alunos;

//conrtrutor

public Curso(String Nomecurso, Professor Professor) {
    this.Nomecurso = Nomecurso;
    this.Professor = Professor;

    Alunos = new ArrayList<>();
}

 // métodos

// adicionar Aluno

public void AdicionarAluno(Aluno Aluno){
    Alunos.add(Alunos);
}

//exibir Informacoes curso

public void exibir Informacoes curso(){
    system.out.println("Nome Curso "+Nomecurso);

    system.out.println("Nome Professor:"+Professor.getNome());

    // foreach

    int contador = 0;
    for (Aluno Aluno : Alunos) {
        contador++;
        System.out.println(contador+". "+Aluno.getNome());
    }
    System.out.println
}


}
