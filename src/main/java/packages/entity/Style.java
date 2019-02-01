package packages.entity;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.AssertFalse;

@Entity
public class Style {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty
    @Column ( unique = true)
    private String beerStyle;

    private boolean styleProposition = false;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getBeerStyle() {
        return beerStyle;
    }

    public void setBeerStyle(String beerStyle) {
        this.beerStyle = beerStyle;
    }

    public Style() {
    }

    public boolean isStyleProposition() {
        return styleProposition;
    }

    public void setStyleProposition(boolean styleProposition) {
        this.styleProposition = styleProposition;
    }

    @Override
    public String toString() {
        return id+" "+beerStyle;
    }

}
