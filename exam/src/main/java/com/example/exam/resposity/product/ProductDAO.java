package com.example.exam.resposity.product;

import com.example.exam.model.DAO;
import com.example.exam.model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ProductDAO implements IProductDAO {
    private final DAO  dbConnection=new DAO();
    private final Connection connection =dbConnection.getConnection();
    private static final String INSERT_PRODUCTS_SQL = "INSERT INTO product (name, price, quantity, color, description, category_id) VALUES (?, ?, ?,?,?,?);";
    private static final String SELECT_PRODUCTS_BY_ID = "select name, price, quantity, color, description, category_id from product where id =?";
    private static final String SELECT_ALL_PRODUCTS = "select * from product";
    private static final String DELETE_PRODUCTS_SQL = "delete from product where id = ?;";
    private static final String UPDATE_PRODUCTS_SQL = "update product set name = ?,price= ?, quantity =?,color=?,description=?,category_id=? where id = ?";
    private static final String SELECT_PRODUCTS_BY_NAME = "SELECT * FROM Product WHERE name LIKE =?";
    private static final String SELECT_PRODUCTS_BY_PRICE = "SELECT * FROM Product WHERE price >=";
    private static final String SELECT_PRODUCTS_BY_ALL_INFORM = "SELECT * FROM Product WHERE 1=1";

    public void insertProduct(Product products) throws SQLException {
        try(PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PRODUCTS_SQL)) {
            preparedStatement.setString(1,products.getNameProduct());
            preparedStatement.setDouble(2,products.getPrice());
            preparedStatement.setInt(3,products.getQuantity());
            preparedStatement.setString(4,products.getColor());
            preparedStatement.setString(5,products.getDescription());
            preparedStatement.setInt(6,products.getCategoryId());
            preparedStatement.executeUpdate();
        }catch(SQLException e){
            System.out.println("SQLException: " + e.getMessage());
        }
    }


    public Product selectProduct(int id) {
        Product product = null;
        try(PreparedStatement preparedStatement =connection.prepareStatement(SELECT_PRODUCTS_BY_ID)){
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int category_id = resultSet.getInt("category_id");
                product =new Product(name,price,quantity,color,description,category_id);
            }
        }catch (SQLException e){
            System.out.println("SQLException: " + e.getMessage());
        }
        return product;
    }

    @Override
    public List<Product> selectAllProduct() {
        List<Product> products = new ArrayList<Product>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PRODUCTS )) {
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int category_id = resultSet.getInt("category_id");
                Product product = new Product(id,name,price,quantity,color,description,category_id);
                products.add(product);
            }

        }catch (SQLException e){
            System.out.println("SQLException: " + e.getMessage());

        }
        return products;
    }

    @Override
    public boolean deleteProduct(int id) throws SQLException {
        boolean isDelete = false;
        try(PreparedStatement preparedStatement =connection.prepareStatement(DELETE_PRODUCTS_SQL)) {
            preparedStatement.setInt(1,id);
            isDelete = preparedStatement.executeUpdate() > 0;
        }catch (SQLException e){
            System.out.println("SQLException: " + e.getMessage());
        }
        return isDelete;
    }

    @Override
    public boolean updateProduct(Product product) throws SQLException {
        boolean isUpdate = false;
        try(PreparedStatement preparedStatement =connection.prepareStatement(UPDATE_PRODUCTS_SQL)) {
            preparedStatement.setInt(1,product.getId());
            isUpdate = preparedStatement.executeUpdate() > 0;
        }catch (SQLException e){
            System.out.println("SQLException: " + e.getMessage());
        }
        return isUpdate;
    }

    @Override
    public List<Product> selectAllProductByName(String name) throws SQLException {
        List<Product> products = new ArrayList<>();
        try(PreparedStatement preparedStatement =connection.prepareStatement(SELECT_PRODUCTS_BY_NAME)) {
            preparedStatement.setString(1,name);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name1=resultSet.getString("name");
                double price = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int category_id = resultSet.getInt("category_id");
                products.add(new Product(name1,price,quantity,color,description,category_id));
            }
        }
        return products;
    }

    @Override
    public List<Product> selectAllProductByPrice(double price) throws SQLException {
        List<Product> products = new ArrayList<>();
        try(PreparedStatement preparedStatement =connection.prepareStatement(SELECT_PRODUCTS_BY_PRICE)) {
            preparedStatement.setDouble(1,price);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price1 = resultSet.getDouble("price");
                int quantity = resultSet.getInt("quantity");
                String color = resultSet.getString("color");
                String description = resultSet.getString("description");
                int category_id = resultSet.getInt("category_id");
                products.add(new Product(name,price1,quantity,color,description,category_id));
            }
        }
        return products;
    }

    @Override
    public List<Product> searchProducts(String name, Double price, String category, String color) {
        List<Product> products = new ArrayList<>();
        StringBuilder sql = new StringBuilder(SELECT_PRODUCTS_BY_ALL_INFORM);
        if (name != null && !name.isEmpty()) {
            sql.append(" AND name LIKE ?");
        }
        if (price != null) {
            sql.append(" AND price >= ?");
        }
        if (color != null && !color.isEmpty()) {
            sql.append(" AND color LIKE ?");
        }
        if (category != null && !category.isEmpty()) {
            sql.append(" AND category_id = (SELECT id FROM Category WHERE name = ?)");
        }

        try (PreparedStatement stmt = connection.prepareStatement(sql.toString())) {

            int index = 1;
            if (name != null && !name.isEmpty()) {
                stmt.setString(index++, "%" + name + "%");
            }
            if (price != null) {
                stmt.setDouble(index++, price);
            }
            if (color != null && !color.isEmpty()) {
                stmt.setString(index++, "%" + color + "%");
            }
            if (category != null && !category.isEmpty()) {
                stmt.setString(index++, category);
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("color"),
                        rs.getString("description"),
                        rs.getInt("category_id")
                );
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
