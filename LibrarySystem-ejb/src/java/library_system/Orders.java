package library_system;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "ORDERS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orders.findAll", query = "SELECT o FROM Orders o"),
    @NamedQuery(name = "Orders.findByOrderid", query = "SELECT o FROM Orders o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Orders.findByBookid", query = "SELECT o FROM Orders o WHERE o.bookid = :bookid"),
    @NamedQuery(name = "Orders.findByUserid", query = "SELECT o FROM Orders o WHERE o.userid = :userid"),
    @NamedQuery(name = "Orders.deleteByOrderId", query = "DELETE FROM Orders o WHERE o.orderid = :orderid"),
    @NamedQuery(name = "Orders.deleteByUserId", query = "DELETE FROM Orders o WHERE o.userid = :userid"),
    @NamedQuery(name = "Orders.deleteByBookId", query = "DELETE FROM Orders o WHERE o.bookid = :bookid")
})
public class Orders implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDERID")
    @GeneratedValue
    private Integer orderid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "BOOKID")
    private int bookid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "USERID")
    private int userid;

    public Orders() {
    }

    public Orders(Integer orderid) {
        this.orderid = orderid;
    }

    public Orders(Integer orderid, int bookid, int userid) {
        this.orderid = orderid;
        this.bookid = bookid;
        this.userid = userid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderid != null ? orderid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orders)) {
            return false;
        }
        Orders other = (Orders) object;
        if ((this.orderid == null && other.orderid != null) || (this.orderid != null && !this.orderid.equals(other.orderid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "library_system.Orders[ orderid=" + orderid + " ]";
    }
    
}
