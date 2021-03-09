/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coffeeshop.repository;

import coffeeshop.entity.CoffeeSize;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Ugleethyn
 */
@Repository
public interface CoffeeSizeRepo extends JpaRepository<CoffeeSize, Integer> {
    
}
