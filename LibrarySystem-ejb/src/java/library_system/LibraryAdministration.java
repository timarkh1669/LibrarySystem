package library_system;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class LibraryAdministration implements LibraryAdministrationRemote, LibraryAdministrationLocal {
    @PersistenceContext
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }
    public void createNewBooks(String author, String title, int count, int libraryId) {
        Query queryFind = em.createNamedQuery("Books.findBookFullMatchInLib");
        queryFind.setParameter("author", author);
        queryFind.setParameter("title", title);
        queryFind.setParameter("libraryid", libraryId);
        List books = queryFind.getResultList();
        if (books.size() > 0) {
            Books book = (Books)books.get(0);
            Query queryUpdate = em.createNamedQuery("Books.updateCountfree");
            queryUpdate.setParameter("countfree", book.getCountfree()+count);
            queryUpdate.setParameter("bookid", book.getBookid());
            queryUpdate.executeUpdate();
        } else {
            Books newbook = new Books();
            newbook.setAuthor(author);
            newbook.setTitle(title);
            newbook.setCountfree(count);
            newbook.setLibraryid(libraryId);
            em.persist(newbook);
        }
    }
    
    public void deleteBooks(int bookID) {
        Query bookQuery = em.createNamedQuery("Books.deleteById");
        bookQuery.setParameter("bookid", bookID);
        bookQuery.executeUpdate();
        
        Query orderQuery = em.createNamedQuery("Orders.deleteByBookId");
        orderQuery.setParameter("bookid", bookID);
        orderQuery.executeUpdate();
    }

    public List<Libraryuser> findAllUsers() {
        Query query = em.createNamedQuery("Libraryuser.findAll");
        return query.getResultList();
    }

    public List<Orders> findAllOrders() {
        Query query = em.createNamedQuery("Orders.findAll");
        return query.getResultList();
    }

    public void deleteUser(int userID) {
        Query userQuery = em.createNamedQuery("Libraryuser.deleteById");
        userQuery.setParameter("userid", userID);
        userQuery.executeUpdate();
        
        Query orderQuery = em.createNamedQuery("Orders.deleteByUserId");
        orderQuery.setParameter("userid", userID);
        orderQuery.executeUpdate();
    }
    public boolean checkAuthorSyntax(String author) {
        Pattern p = Pattern.compile("[^a-zA-Z\\s\\.\\,\\-]");
        Matcher m = p.matcher(author);
        return m.find() || author.length() == 0 || author.length() > 50;
    }
    public boolean checkTitleSyntax(String title) {
        Pattern p = Pattern.compile("[^0-9a-zA-Z\\s\\.\\,\\-]");
        Matcher m = p.matcher(title);
        return m.find() || title.length() == 0 || title.length() > 50;
    }

    @Override
    public int createNewLibrary(String address) {
        if (findIdByAddress(address) != 0) {
            return 0;//if there exist library with same address
        } else {
            Libraries newlibrary = new Libraries();
            newlibrary.setAddress(address);
            em.persist(newlibrary);
            return findIdByAddress(address);
        }
    }

    @Override
    public int findIdByAddress(String address) {
        Query queryFind = em.createNamedQuery("Libraries.findByAddress");
        queryFind.setParameter("address", address);
        List libraries = queryFind.getResultList();
        if (libraries.size() > 0) {
            return ((Libraries)libraries.get(0)).getLibraryid();
        } else {
            return 0;
        }
    }

    @Override
    public List<Libraries> findAllLibraries() {
        Query query = em.createNamedQuery("Libraries.findAll");
        return query.getResultList();
    }

    @Override
    public void deleteLibrary(int libraryID) {
        Query userQuery = em.createNamedQuery("Libraries.deleteById");
        userQuery.setParameter("libraryid", libraryID);
        userQuery.executeUpdate();
    }

    @Override
    public boolean checkLibrarySyntax(String address) {
        Pattern p = Pattern.compile("[^0-9a-zA-Z\\s\\.\\,\\-]");
        Matcher m = p.matcher(address);
        return m.find() || address.length() == 0 || address.length() > 50;
    }
}
