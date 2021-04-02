
package coffeeshop.service;

import coffeeshop.entity.Address;
import coffeeshop.repository.AddressRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AddressServiceImpl implements AddressService{
    
    @Autowired
    AddressRepo addressRepo;

    @Override
    public List<Address> getAddresses(int accountId) {
        return addressRepo.findByAccount(accountId);
    }
    
    
    
    
}
