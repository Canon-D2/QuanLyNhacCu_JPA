package dao;

import java.util.List;

public interface GenericDAO<T> {
    T save(T entity);
    void update(T entity);
    void UpdateWithJPQL(String jpql, Object... Parameters);
    void delete(int id);
    void deleteWithJPQL(String jpql, Object... Parameters);
    void deleteWithEntity(T entity);
    void deleteManyEntity(String jpql, Object... Parameters);
    List<T> findAll();
    T findById(int id);
    Long countAll();
    T findOne(String jdql, Object... Parameters);
    List<T> findList(String jdql, Object... Parameters);
    List<T> findListSetLimit(String jdql, int limit, int Offset, Object... Parameters);
    Double sumByColumn(String jdql);
}
