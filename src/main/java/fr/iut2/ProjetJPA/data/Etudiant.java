package fr.iut2.ProjetJPA.data;


import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Entity implementation class for Entity: Etudiant
 */
@Entity
public class Etudiant implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String prenom;

    @Column(nullable = false)
    private String nom;


    @ManyToOne
    private Groupe groupe;

    @OneToMany(mappedBy = "etudiant", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.REMOVE})    // LAZY = fetch when needed, EAGER = fetch immediately
    private List<Note> note;

    @OneToMany(mappedBy = "etudiant", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.REMOVE})    // LAZY = fetch when needed, EAGER = fetch immediately
    private List<Absences> absences;

    private static final long serialVersionUID = 1L;

    public Etudiant() {
        super();
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrenom() {
        return this.prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public Groupe getGroupe() {
        return this.groupe;
    }

    public List<Note> getNote(){return note;}

    public List<Absences> getAbsences() {
        return absences;
    }

    public void setGroupe(Groupe groupe) {
        this.groupe = groupe;
        if (!groupe.getEtudiants().contains(this)) {
            groupe.getEtudiants().add(this);
        }
    }


    @Override
    public String toString() {
        return "[" + this.getId() + "] " + this.getPrenom() + " " + this.getNom();
    }
}
