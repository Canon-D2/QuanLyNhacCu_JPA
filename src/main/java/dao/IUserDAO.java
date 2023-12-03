package dao;

import entity.Account;

public interface IUserDAO {
    Account login(String userName, String pass);
    void signup(String userName, String pass, String email);
    Account checkAccountExist(String userName); 
    Account checkAccountExistByUsernameAndEmail(String username, String email);
    int checkAccountAdmin(int userID);
    void updateTinhTrang(int tinhTrang, int userId);
}