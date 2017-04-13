package library_system;

import javax.ejb.Local;

@Local
public interface LibrarySessionLocal {

    Orders findOrderByID(int orderID);
    
}
