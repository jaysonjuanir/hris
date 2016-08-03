package com.system.service;

/**
 * Hello world!
 *
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.ParseException;

import com.system.util.UtilSession;
import com.system.model.*;
import com.system.dao.*;
import java.util.*;

public class Service {

    EmployeeDao employeeDao = new EmployeeDao();
    AccountDao accountDao = new AccountDao();
    BulletinDao bulletinDao = new BulletinDao();
    MessagesDao messagesDao = new MessagesDao();

    public void executeCreateEmployee(Employee employee) {
        employeeDao.addEmployee(employee);
    }
    public int executeCreateEmployeeWithAccount(Employee employee) {
        return employeeDao.addEmployeeWithAccount(employee);
    }

    public void executeUpdatedEmployee(Employee employee) {
        employeeDao.updateEmployee(employee);
    }

    public void deleteEmployee(Employee deleteEmployee) {
        employeeDao.deleteEmployee(deleteEmployee);
    }

    public Employee getEmployeeById(int employeeId) {
        return employeeDao.getEmployeeById(employeeId);
    }

    public List<Employee> getEmployees() {
        return employeeDao.getEmployees();
    }
    
    public void executeCreateBulletin(Bulletin bulletin) {
        bulletinDao.addBulletin(bulletin);
    }

    public void executeUpdatedBulletin(Bulletin bulletin) {
        bulletinDao.updateBulletin(bulletin);
    }

    public void deleteEmployee(Bulletin bulletin) {
        bulletinDao.deleteBulletin(bulletin);
    }

    public Bulletin getBulletinById(int bulletinId) {
        return bulletinDao.getBulletinById(bulletinId);
    }

    public List<Bulletin> getBulletin() {
        return bulletinDao.getBulletin();
    }

    public int verifyAccount(String user, String pass) {
        return accountDao.verifyAccount(user, pass);
    }
    public Account getAccount(String user, String pass) {
        return accountDao.getAccount(user, pass);
    }
    public Long checkUsername(String username){
        return accountDao.checkUsername(username);
    }
    public void addAccount(Account account) {
        accountDao.addAccount(account);
    }
    public void updateAccount(Account account) {
        accountDao.updateAccount(account);
    }
    public void deleteAccountByEmployeeId(int id){
        accountDao.deleteAccountByEmployeeId(id);
    }
    public List<Account> getAccountManagers(){
        return accountDao.getAccountManagers();
    }
    public boolean checkUsername(int id, String oldPass){
        return accountDao.checkAccount(id, oldPass);
    }
    public List<Messages> getMessagesById(int id){
        return messagesDao.getMessagesById(id);
    }
    public void createMessage(Messages message){
        messagesDao.createMessage(message);
    }
    public Account getAccountByEmployeeId(int id){
        return accountDao.getAccountByEmployeeId(id);
    }
}
