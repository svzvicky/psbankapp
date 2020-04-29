package com.ps.springmvc.psbankapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ps.springmvc.psbankapp.model.Account;
import com.ps.springmvc.psbankapp.services.AccountService;

@RestController
@RequestMapping(value = "/account")
public class AccountRESTController {

	@Autowired
	private AccountService accountService;

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/{id}", method = RequestMethod.POST) public
	 *  getAccount(Integer accountNo) {
	 * System.out.println("Request Account Number :" + accountNo); Account account =
	 * accountService.getAccount(accountNo);  }
	 */

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ResponseEntity<Account> getAccount(Integer accountNo) {
		System.out.println("Request Account Number :" + accountNo);
		Account account = accountService.getAccount(accountNo);
		if (account == null) 
			return new ResponseEntity<Account>(HttpStatus.NOT_FOUND); 
		return new ResponseEntity<Account>(account, HttpStatus.OK);
		
	}
}