package com.daxos.travels.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.daxos.travels.models.Expense;
import com.daxos.travels.repositories.ExpenseRepository;

@Service
public class ExpenseService {

	@Autowired
	private ExpenseRepository expenseRepository;
	
	public List<Expense> selectAllFromExpenses(){
		return expenseRepository.findAll();
	}
	
	public Expense findExpenseById(Long id){
		Optional<Expense> optionalResult = expenseRepository.findById(id);
		if(optionalResult.isPresent()) {			
			return optionalResult.get();
		} else {
			return null;
		}
	}
	
	public Expense insertIntoExpenses( Expense newExpense ) {
		return expenseRepository.save( newExpense );
	}
	
	public void deleteFromExpenses( Long id ) { /// Posible error
		expenseRepository.deleteById( id );
	}
	
	public void updateExpense( Expense e ) {
		expenseRepository.updateExpenses(  e.getId(),
										   e.getName(), 
										   e.getVendor(), 
										   e.getAmount(), 
										   e.getDescription());
	}
}
