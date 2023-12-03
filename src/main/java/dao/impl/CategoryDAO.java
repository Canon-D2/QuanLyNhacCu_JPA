package dao.impl;

import dao.ICategoryDAO;
import entity.Category;

public class CategoryDAO extends AbstractDAO<Category> implements ICategoryDAO{
    
    public CategoryDAO() {
        super(Category.class);
    }
}