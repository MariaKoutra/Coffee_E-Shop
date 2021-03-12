/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffeeshop.service;

import coffeeshop.entity.Snacktype;
import coffeeshop.repository.SnackRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 *
 * @author Ugleethyn
 */
@Service
@Transactional
public class SnackServiceImpl implements SnackService {

    @Autowired
    private SnackRepo snackRepo;

    public List<Snacktype> findAll() {
        return snackRepo.findAll();
    }

}
