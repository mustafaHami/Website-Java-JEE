package fr.iut2.ProjetJPA.data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Entity implementation class for Entity: Note
 */
@Entity
public class Note implements Serializable {
    @Id
    @GeneratedValue
    private Integer id;
    private float valeur;

    @ManyToOne
    private Etudiant etudiant;

    @ManyToOne
    private Module module;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public float getValeur() {
        return valeur;
    }

    public Etudiant getEtudiant(){return etudiant;}

    public Module getModule(){return module;}

    public void setValeur(float valeur) {
        this.valeur = valeur;
    }

    public void setModule(Module module) {
        this.module = module;
    }
    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }


}
