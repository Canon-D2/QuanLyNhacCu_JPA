package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "category")
public class Category implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @Column(name = "name")
    private String name;
    
    @OneToMany(mappedBy = "category")
    private List<Product> listProducts;
    
    

    public Category() {
    }

    public Category(int cid, String cname) {
        this.id = cid;
        this.name = cname;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Product> getListProducts() {
        return listProducts;
    }

    public void setListProducts(List<Product> listProducts) {
        this.listProducts = listProducts;
    }
    
    

    public int getCid() {
        return id;
    }

    public void setCid(int cid) {
        this.id = cid;
    }

    public String getCname() {
        return name;
    }

    public void setCname(String cname) {
        this.name = cname;
    }

    @Override
    public String toString() {
        return "Category{" + "cid=" + id + ", cname=" + name + '}';
    }
}