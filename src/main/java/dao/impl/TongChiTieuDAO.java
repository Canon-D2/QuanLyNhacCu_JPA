package dao.impl;

import dao.ITongChiTieuDAO;
import entity.TongChiTieuBanHang;
import java.util.List;

public class TongChiTieuDAO extends AbstractDAO<TongChiTieuBanHang> implements ITongChiTieuDAO{ 
    
    public TongChiTieuDAO() {
        super(TongChiTieuBanHang.class);
    }

    @Override
    public List<TongChiTieuBanHang> findTopKhachHang(int limit) {
        String jpql = "SELECT tct FROM TongChiTieuBanHang tct ORDER by tct.tongChiTieu DESC";
        return super.findListSetLimit(jpql, limit, 0);
    }

    @Override
    public TongChiTieuBanHang checkTCT(int userId) {
        String jpql = "SELECT tct FROM TongChiTieuBanHang tct WHERE tct.user.id = "+userId;
        return findOne(jpql);

    }
}