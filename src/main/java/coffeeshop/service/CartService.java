package coffeeshop.service;

import coffeeshop.entity.Account;
import java.util.List;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface CartService extends UserDetailsService {
    
    List<Account> getAllAccounts();
    
    List<Account> getAdmins();
    
    List<Account> getUsers();

    Account findByUsername(String username);

    Account saveUser(Account account);

    Account getCurrentlyLoggedInAccount(Authentication authentication);
}
