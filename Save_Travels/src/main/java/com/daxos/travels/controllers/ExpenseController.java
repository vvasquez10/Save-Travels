package com.daxos.travels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daxos.travels.models.Expense;
import com.daxos.travels.services.ExpenseService;

@Controller
@RequestMapping( "/expenses" )
public class ExpenseController {
	
	@Autowired
	private ExpenseService expenseService;
	
	//localhost:8080/expenses
	@RequestMapping( value = "", method = RequestMethod.GET )
	public String deployExpenses(Model model, @ModelAttribute("expense") Expense newExpense) {
		
		List<Expense> expenseList = expenseService.selectAllFromExpenses();
		model.addAttribute( "expenseList", expenseList );
		
		return "index.jsp";	
	}	
	
	//localhost:8080/expenses/create
	@RequestMapping( value = "/create", method = RequestMethod.POST )
	public String createExpense(@Valid @ModelAttribute("expense") Expense newExpense, BindingResult result) {
		
		if ( result.hasErrors() ) {
			return "index.jsp";
		}
		else {
			expenseService.insertIntoExpenses( newExpense );
	
			return "redirect:/expenses";
		}
	}
	
	//localhost:8080/expenses/show/{id}
	@RequestMapping( value = "/show/{id}", method = RequestMethod.GET )
	public String showExpense(Model model, @PathVariable("id") Long id ) {
		
		Expense selectedExpense = expenseService.findExpenseById(id);		
		model.addAttribute( "selectedExpense", selectedExpense );

		return "showExpense.jsp";
	}

	@RequestMapping( value = "/delete/{id}", method = RequestMethod.DELETE )
	public String deleteExpense( @PathVariable("id") Long id ) {		
		System.out.println("Eliminao");
		expenseService.deleteFromExpenses( id );
		return "redirect:/expenses";
	}
	
	@RequestMapping( value = "/edit/{id}", method = RequestMethod.GET )
	public String deployEditExpense(Model model, @ModelAttribute("expense") Expense expense, @PathVariable("id") Long id ) {
		Expense selectedExpense = expenseService.findExpenseById(id);		
		model.addAttribute( "selectedExpense", selectedExpense );
		return "editExpense.jsp";
	}
	
	@RequestMapping( value = "/edit", method = RequestMethod.PUT )
	public String editarUsuario( @Valid @ModelAttribute("expense") Expense expense, BindingResult result){
		
		if ( result.hasErrors() ) {
			return "editExpense.jsp";
		}
		else {						
			expenseService.updateExpense( expense );
			return "redirect:/expenses";
		}
	}
}
