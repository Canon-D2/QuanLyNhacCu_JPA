package dao;

import entity.Cart;
import java.util.List;

public interface ICartDAO {
    List<Cart> getCartByAccountID(int accountID);
    Cart checkCartExist(int accountID, int productID);
    void deleteCartByProductID(int productID);
    void deleteCartByAccountID(int accountID);
    void deleteItemInUserCart(int accountID, int productID);
    void editAmountAndSizeCart(int accountID, int productID, int amount);
    void editAmountCart(int accountID, int productID, int amount);
    void editAmountCart(int accountID, int productID);
}
