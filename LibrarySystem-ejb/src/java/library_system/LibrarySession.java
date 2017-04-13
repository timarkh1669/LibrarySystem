package library_system;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
public class LibrarySession implements LibrarySessionRemote, LibrarySessionLocal {
    @PersistenceContext
    private EntityManager em;

    public void persist(Object object) {
        em.persist(object);
    }

    public LibrarySession() {
    }
    //====================================================
    //          Libraryuser methods
    //====================================================
    private boolean checkNameSyntax(String name) {
        Pattern p = Pattern.compile("[^0-9a-zA-Z]");
        Matcher m = p.matcher(name);
        return m.find();
    }
    
    public Libraryuser findUserByID(int id) {
        Query query = em.createNamedQuery("Libraryuser.findByUserid");
        query.setParameter("userid", id);
        List users = query.getResultList();
        if (users.size() > 0) {
            return (Libraryuser)users.get(0);
        } else {
            return null;
        }
    }

    public Libraryuser findUserByName(String name) {
        Query query = em.createNamedQuery("Libraryuser.findByUsername");
        query.setParameter("username", name);
        List users = query.getResultList();
        if (users.size() > 0) {
            return (Libraryuser)users.get(0);
        } else {
            return null;
        }
    }

    public int getUserID(String username) {
        Libraryuser user = findUserByName(username);
        if (user != null) {
            return user.getUserid();
        } else {
            return 0;
        }
    }
    
    public int registerReader(String name, String password) {
        //1st: check username syntax correctness
        if (checkNameSyntax(name) || name.equals("")) return -1;
        //2st: check if there exist the same user
        if (findUserByName(name) != null) return -2;
        //3rd: check password syntax correctness
        //if (checkSyntax(password) || password.equals("")) return -1;
        Libraryuser user = new Libraryuser();
        user.setUsername(name);
        user.setPassword(password);
        
        em.persist(user);
        return 1;
    }

    public boolean loginReader(String name, String password) {
        //1st: check syntax correctness
        Pattern p = Pattern.compile("[^0-9a-zA-Z]");
        Matcher m = p.matcher(name);
        if (m.find())
            return false;
        //check if user exists in database
        Libraryuser user = findUserByName(name);
        return (user != null && password.equals(user.getPassword()));
    }
    //====================================================
    //          end: Libraryuser methods
    //====================================================
    
    //====================================================
    //                  Books methods
    //====================================================
    public int findBookCount(String author, String title) {
        List<Books> books = findBooksFullMatch(author, title);
        if (books.size() > 0) {
            return books.get(0).getCountfree();
        } else {
            return 0;
        }
    }

    public Books findBookByID(int id) {
        Query query = em.createNamedQuery("Books.findByBookid");
        query.setParameter("bookid", id);
        List books = query.getResultList();
        if (books.size() > 0) {
            return (Books)books.get(0);
        } else {
            return null;
        }
    }

    public List<Books> findBooks(String author, String title) {
        Query query = em.createNamedQuery("Books.findBook");
        query.setParameter("author", "%" + author + "%");
        query.setParameter("title", "%" + title + "%");
        return query.getResultList();
    }

    public List<Books> findBooksFullMatch(String author, String title) {
        Query query = em.createNamedQuery("Books.findBookFullMatch");
        query.setParameter("author", author);
        query.setParameter("title", title);
        return query.getResultList();
    }
    //====================================================
    //                 end: Books methods
    //====================================================
    
    //====================================================
    //                 Orders methods
    //====================================================
    public List<Orders> findOrderedBooks(String username) {
        Libraryuser user = findUserByName(username);
        Query query = em.createNamedQuery("Orders.findByUserid");
        query.setParameter("userid", user.getUserid());
        return query.getResultList();
    }
    
    public Orders findOrderByID(int orderID) {
        Query query = em.createNamedQuery("Orders.findByOrderid");
        query.setParameter("orderid", orderID);
        List orders = query.getResultList();
        if (orders.size() > 0) {
            return (Orders)orders.get(0);
        } else {
            return null;
        }
    }
    //====================================================
    //                 end: Orders methods
    //====================================================
    
    //====================================================
    //                 Libraries methods
    //====================================================
    @Override
    public String findLibraryAddressByID(int libraryId) {
        Query query = em.createNamedQuery("Libraries.findByLibraryid");
        query.setParameter("libraryid", libraryId);
        List libraries = query.getResultList();
        if (libraries.size() > 0) {
            return ((Libraries)libraries.get(0)).getAddress();
        } else {
            return null;
        }
    }
    @Override
    public String findLibraryAddressByOrderID(int orderID) {
        int bookID = findOrderByID(orderID).getBookid();
        int libraryID = findBookByID(bookID).getLibraryid();
        return findLibraryAddressByID(libraryID);
    }
    //====================================================
    //                 end: Libraries methods
    //====================================================
    
    //====================================================
    //                 combined methods
    //====================================================
    public int orderBook(String username, int bookID) {
        int userID = findUserByName(username).getUserid();
        Orders order = new Orders();
        order.setUserid(userID);
        order.setBookid(bookID);
        int bookCount = findBookByID(bookID).getCountfree();
        if (bookCount > 0) {
            Query query = em.createNamedQuery("Books.updateCountfree");
            query.setParameter("bookid", bookID);
            query.setParameter("countfree", bookCount - 1);
            query.executeUpdate();
            em.persist(order);
            return order.getOrderid();
        } else {
            return 0;
        }
    }
    
    public boolean returnBook(int orderID) {
        int bookID = findOrderByID(orderID).getBookid();

        Query ordersQuery = em.createNamedQuery("Orders.deleteByOrderId");
        ordersQuery.setParameter("orderid", orderID);
        ordersQuery.executeUpdate();

        int bookCount = findBookByID(bookID).getCountfree();
        Query booksQuery = em.createNamedQuery("Books.updateCountfree");
        booksQuery.setParameter("bookid", bookID);
        booksQuery.setParameter("countfree", bookCount + 1);
        booksQuery.executeUpdate();

        return true;
    }
    
    public String findAuthorByOrderID(int orderID) {
        int bookID = findOrderByID(orderID).getBookid();
        return findBookByID(bookID).getAuthor();
    }

    public String findTitleByOrderID(int orderID) {
        int bookID = findOrderByID(orderID).getBookid();
        return findBookByID(bookID).getTitle();
    }
}
