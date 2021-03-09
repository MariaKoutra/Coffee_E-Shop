/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffeeshop.service;

import coffeeshop.entity.Ingredients;
import coffeeshop.repository.IngredientsRepo;
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
public class IngredientsServiceImpl implements IngredientsService {

    @Autowired
    private IngredientsRepo ingredientsRepo;

    public List<Ingredients> findAll() {
        return ingredientsRepo.findAll();
    }

}
