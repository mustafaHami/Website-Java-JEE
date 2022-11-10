package fr.iut2.ProjetJPA.data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Entity implementation class for Entity: Module
 */
@Entity
public class Module implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(unique = true, nullable = false)
    private String libelle;


    @ManyToOne
    private Groupe groupe;

    @OneToMany(mappedBy = "module", fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.REMOVE})    // LAZY = fetch when needed, EAGER = fetch immediately
    private List<Note> note;


    private static final long serialVersionUID = 1L;

    public Module(){
       super();
    }

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public Groupe getGroupe() {
        return groupe;
    }

    public List<Note> getNote(){return note;}

    public void setGroupe(Groupe groupe) {
        this.groupe = groupe;
        if (!groupe.getModules().contains(this)) {
            groupe.getModules().add(this);
        }
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Module)) return false;
        return id != null && id.equals(((Module) o).id);
    }
}
