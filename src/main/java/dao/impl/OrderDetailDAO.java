package dao.impl;

import dao.IOrderDetailDAO;
import entity.orderDetail;
import java.util.List;

public class OrderDetailDAO extends AbstractDAO<orderDetail> implements IOrderDetailDAO{
    
    public OrderDetailDAO() {
        super(orderDetail.class);
    }

    @Override
    public List<orderDetail> findOrderDetailByOrder(int orderId) {
        String jpql = "SELECT o FROM orderDetail o WHERE o.entityOrder.id ="+orderId;
        return super.findList(jpql);
    }
}