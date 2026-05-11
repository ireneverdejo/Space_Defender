package model;

import java.util.ArrayList;
import java.util.List;

public abstract class Nau {
    protected String nom;
    protected int vides;
    protected int velocitat;
    protected int punts;
    protected int x, y;
    protected List<String> powerUps;

    public Nau(String nom, int vides, int velocitat) {
        this.nom = nom;
        this.vides = vides;
        this.velocitat = velocitat;
        this.punts = 0;
        this.x = 300;
        this.y = 500;
        this.powerUps = new ArrayList<>();
    }

    public void moureEsquerra() { x -= velocitat; }
    public void moureDreta() { x += velocitat; }

    public int getX() { return x; }
    public int getY() { return y; }
    public int getVides() { return vides; }
    public void setVides(int vides) { this.vides = vides; }
}
public class NauLleugera extends Nau {
    public NauLleugera(String nom) {
        super(nom, 3, 10);
    }
}
public class NauEquilibrada extends Nau {
    public NauEquilibrada(String nom) {
        super(nom, 4, 7);
    }
}
public class NauPesada extends Nau {
    public NauPesada(String nom) {
        super(nom, 6, 4);
    }
}