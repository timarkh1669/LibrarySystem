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
@Table(name = "LIBRARIES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Libraries.findAll", query = "SELECT l FROM Libraries l"),
    @NamedQuery(name = "Libraries.findByLibraryid", query = "SELECT l FROM Libraries l WHERE l.libraryid = :libraryid"),
    @NamedQuery(name = "Libraries.findByAddress", query = "SELECT l FROM Libraries l WHERE l.address = :address"),
    @NamedQuery(name = "Libraries.deleteById", query = "DELETE FROM Libraries l WHERE l.libraryid = :libraryid")
})
public class Libraries implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "LIBRARYID")
    @GeneratedValue
    private Integer libraryid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "ADDRESS")
    private String address;

    public Libraries() {
    }

    public Libraries(Integer libraryid) {
        this.libraryid = libraryid;
    }

    public Libraries(Integer libraryid, String address) {
        this.libraryid = libraryid;
        this.address = address;
    }

    public Integer getLibraryid() {
        return libraryid;
    }

    public void setLibraryid(Integer libraryid) {
        this.libraryid = libraryid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (libraryid != null ? libraryid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Libraries)) {
            return false;
        }
        Libraries other = (Libraries) object;
        if ((this.libraryid == null && other.libraryid != null) || (this.libraryid != null && !this.libraryid.equals(other.libraryid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "library_system.Libraries[ libraryid=" + libraryid + " ]";
    }
    
}
