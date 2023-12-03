package dao;

import entity.Review;
import java.util.List;

public interface IReviewDAO {
    Review getNewReview(int accountID, int productID);
    List<Review> getAllReviewByProductID(int productId);
    void deleteReviewByProductID(int productID);
    void deleteReviewByAccountID(int accountID);
}