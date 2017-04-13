package library_system;

import javax.ejb.Remote;
import java.util.List;

@Remote
public interface LibrarySessionRemote {
    int getUserID(String username);
    int findBookCount(String author, String title);
    
    List<Books> findBooks(String author, String title);

    List<Books> findBooksFullMatch(String author, String title);

    Libraryuser findUserByName(String name);

    int registerReader(String name, String password);

    Libraryuser findUserByID(int id);

    boolean loginReader(String name, String password);

    int orderBook(String username, int bookID);

    List<Orders> findOrderedBooks(String username);

    String findAuthorByOrderID(int orderID);

    String findTitleByOrderID(int orderID);

    boolean returnBook(int orderID);

    String findLibraryAddressByID(int libraryId);

    String findLibraryAddressByOrderID(int orderID);
}
