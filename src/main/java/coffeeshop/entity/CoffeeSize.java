/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffeeshop.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ugleethyn
 */
@Entity
@Table(name = "coffee_size")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CoffeeSize.findAll", query = "SELECT c FROM CoffeeSize c")
    , @NamedQuery(name = "CoffeeSize.findById", query = "SELECT c FROM CoffeeSize c WHERE c.id = :id")
    , @NamedQuery(name = "CoffeeSize.findBySname", query = "SELECT c FROM CoffeeSize c WHERE c.sname = :sname")
    , @NamedQuery(name = "CoffeeSize.findByPricefactor", query = "SELECT c FROM CoffeeSize c WHERE c.pricefactor = :pricefactor")})
public class CoffeeSize implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "sname")
    private String sname;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "pricefactor")
    private BigDecimal pricefactor;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sizeId", fetch = FetchType.LAZY)
    private List<Coffee> coffeeList;

    public CoffeeSize() {
    }

    public CoffeeSize(Integer id) {
        this.id = id;
    }

    public CoffeeSize(Integer id, String sname, BigDecimal pricefactor) {
        this.id = id;
        this.sname = sname;
        this.pricefactor = pricefactor;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public BigDecimal getPricefactor() {
        return pricefactor;
    }

    public void setPricefactor(BigDecimal pricefactor) {
        this.pricefactor = pricefactor;
    }

    @XmlTransient
    public List<Coffee> getCoffeeList() {
        return coffeeList;
    }

    public void setCoffeeList(List<Coffee> coffeeList) {
        this.coffeeList = coffeeList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CoffeeSize)) {
            return false;
        }
        CoffeeSize other = (CoffeeSize) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "coffeeshop.entity.CoffeeSize[ id=" + id + " ]";
    }
    
}
