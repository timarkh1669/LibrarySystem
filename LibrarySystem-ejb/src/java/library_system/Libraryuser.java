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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "LIBRARYUSER")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Libraryuser.findAll", query = "SELECT l FROM Libraryuser l"),
    @NamedQuery(name = "Libraryuser.findByUserid", query = "SELECT l FROM Libraryuser l WHERE l.userid = :userid"),
    @NamedQuery(name = "Libraryuser.findByUsername", query = "SELECT l FROM Libraryuser l WHERE l.username = :username"),
    @NamedQuery(name = "Libraryuser.findByPassword", query = "SELECT l FROM Libraryuser l WHERE l.password = :password"),
    @NamedQuery(name = "Libraryuser.deleteById", query = "DELETE FROM Libraryuser l WHERE l.userid = :userid")
})
public class Libraryuser implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "USERID")
    @GeneratedValue
    private Integer userid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "USERNAME")
    private String username;
    @Size(max = 30)
    @Column(name = "PASSWORD")
    private String password;

    public Libraryuser() {
    }

    public Libraryuser(Integer userid) {
        this.userid = userid;
    }

    public Libraryuser(Integer userid, String username) {
        this.userid = userid;
        this.username = username;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userid != null ? userid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Libraryuser)) {
            return false;
        }
        Libraryuser other = (Libraryuser) object;
        if ((this.userid == null && other.userid != null) || (this.userid != null && !this.userid.equals(other.userid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "library_system.Libraryuser[ userid=" + userid + " ]";
    }
    
}
