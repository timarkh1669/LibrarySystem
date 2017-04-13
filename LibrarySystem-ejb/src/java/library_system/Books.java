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
@Table(name = "BOOKS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Books.findAll", query = "SELECT b FROM Books b"),
    @NamedQuery(name = "Books.findByBookid", query = "SELECT b FROM Books b WHERE b.bookid = :bookid"),
    @NamedQuery(name = "Books.findByAuthor", query = "SELECT b FROM Books b WHERE b.author = :author"),
    @NamedQuery(name = "Books.findByTitle", query = "SELECT b FROM Books b WHERE b.title = :title"),
    @NamedQuery(name = "Books.findByLibraryid", query = "SELECT b FROM Books b WHERE b.libraryid = :libraryid"),
    @NamedQuery(name = "Books.findByCountfree", query = "SELECT b FROM Books b WHERE b.countfree = :countfree"),
    @NamedQuery(name = "Books.findBook", query = "SELECT b FROM Books b WHERE b.author LIKE :author AND b.title LIKE :title"),
    @NamedQuery(name = "Books.findBookFullMatch", query = "SELECT b FROM Books b WHERE b.author = :author AND b.title = :title"),
    @NamedQuery(name = "Books.findBookFullMatchInLib", query = "SELECT b FROM Books b WHERE b.author = :author AND b.title = :title AND b.libraryid = :libraryid"),
    @NamedQuery(name = "Books.updateCountfree", query = "UPDATE Books b SET b.countfree = :countfree WHERE b.bookid = :bookid"),
    @NamedQuery(name = "Books.deleteById", query = "DELETE FROM Books b WHERE b.bookid = :bookid")
})
public class Books implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "BOOKID")
    @GeneratedValue
    private Integer bookid;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "AUTHOR")
    private String author;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "TITLE")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Column(name = "LIBRARYID")
    private int libraryid;
    @Basic(optional = false)
    @NotNull
    @Column(name = "COUNTFREE")
    private int countfree;

    public Books() {
    }

    public Books(Integer bookid) {
        this.bookid = bookid;
    }

    public Books(Integer bookid, String author, String title, int libraryid, int countfree) {
        this.bookid = bookid;
        this.author = author;
        this.title = title;
        this.libraryid = libraryid;
        this.countfree = countfree;
    }

    public Integer getBookid() {
        return bookid;
    }

    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getLibraryid() {
        return libraryid;
    }

    public void setLibraryid(int libraryid) {
        this.libraryid = libraryid;
    }

    public int getCountfree() {
        return countfree;
    }

    public void setCountfree(int countfree) {
        this.countfree = countfree;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (bookid != null ? bookid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Books)) {
            return false;
        }
        Books other = (Books) object;
        if ((this.bookid == null && other.bookid != null) || (this.bookid != null && !this.bookid.equals(other.bookid))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "library_system.Books[ bookid=" + bookid + " ]";
    }
    
}
