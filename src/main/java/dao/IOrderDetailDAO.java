package dao;

import entity.orderDetail;
import java.util.List;

public interface IOrderDetailDAO {
    List<orderDetail> findOrderDetailByOrder(int orderId);
}
