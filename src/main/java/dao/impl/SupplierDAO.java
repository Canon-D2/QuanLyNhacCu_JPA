package dao.impl;

import dao.ISupplierDAO;
import entity.Supplier;

public class SupplierDAO extends AbstractDAO<Supplier> implements ISupplierDAO{
    
    public SupplierDAO() {
        super(Supplier.class);
    } 
}