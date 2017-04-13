package library_system;

import javax.ejb.Remote;
import java.util.List;

@Remote
public interface LibraryAdministrationRemote {
    void createNewBooks(String author, String bookName, int count, int libraryId);

    void deleteBooks(int bookID);

    List<Libraryuser> findAllUsers();
    
    List<Orders> findAllOrders();

    void deleteUser(int userID);
    
    boolean checkAuthorSyntax(String name);
    boolean checkTitleSyntax(String name);

    int createNewLibrary(String address);

    int findIdByAddress(String address);

    List<Libraries> findAllLibraries();

    void deleteLibrary(int libraryID);

    boolean checkLibrarySyntax(String address);
}
