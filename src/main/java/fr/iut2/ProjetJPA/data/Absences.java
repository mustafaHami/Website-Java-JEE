package fr.iut2.ProjetJPA.data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
public class Absences implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(nullable = false)
    private String description;

    @ManyToOne
    private Etudiant etudiant;

    public Integer getId() {
        return id;
    }

    public Date dateAbsence;

    public void setId(Integer id) {
        this.id = id;
    }

    public Etudiant getEtudiant() {
        return etudiant;
    }

    public void setEtudiant(Etudiant etudiant) {
        this.etudiant = etudiant;
    }

    public void setDateAbsence(Date dateAbsence) {
        this.dateAbsence = dateAbsence;
    }

    public Date getDateAbsence() {
        return dateAbsence;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
