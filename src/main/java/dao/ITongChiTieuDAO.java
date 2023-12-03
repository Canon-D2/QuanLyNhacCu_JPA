package dao;

import entity.TongChiTieuBanHang;
import java.util.List;

public interface ITongChiTieuDAO{
    
    List<TongChiTieuBanHang> findTopKhachHang(int limit);
    TongChiTieuBanHang checkTCT(int userId);
}
