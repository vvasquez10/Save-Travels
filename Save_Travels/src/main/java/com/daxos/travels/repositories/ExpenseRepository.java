package com.daxos.travels.repositories;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.daxos.travels.models.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Long>{
	
	// SELECT * FROM expenses
	List<Expense> findAll();
	
	Optional<Expense> findById( Long id );
	
	
	// INSERT INTO expenses(name, vendor, amount, description)
	// VALUES( objecto Expense con todos los datos )
	@SuppressWarnings("unchecked")
	Expense save( Expense newExpense );
	
	// DELTE FROM expenses WHERE id = id
	@Transactional
	void deleteById( Long id );
	
	@Transactional
	@Modifying
	@Query( value = "UPDATE expenses " +
					"SET name = :name, vendor = :vendor, amount = :amount, description = :description " +
					"WHERE id = :id", nativeQuery = true )
	void updateExpenses( @Param("id") Long id, @Param("name") String name, 
								  @Param("vendor") String vendor, @Param("amount") double amount, 
								  @Param("description") String description); 
}
