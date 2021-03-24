package com.team2.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.team2.bean.FoodBean;
import com.team2.model.FoodDao;



public class FoodDaoImpl implements FoodDao{
	
	@Override
	public FoodBean getFood(String foodno) {
		final String SQL ="select * from food where foodno = ?";
		FoodBean food = new FoodBean();
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
			Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, foodno);
			ResultSet rs = stmt.executeQuery();
			
			
			if(rs.next()) {
				food.setFoodno(rs.getString("foodno"));
				food.setName(rs.getString("name"));
				food.setCategory(rs.getString("category"));
				food.setExpiredate(rs.getString("expiredate"));
				food.setPreservation(rs.getString("preservation"));
				food.setCal(rs.getString("cal"));
			}
			stmt.close();
		} catch(SQLException e){
			e.printStackTrace();
		}catch (Exception e1) {
			e1.printStackTrace();
		}
		return food;
		
	}

	@Override
	public List<FoodBean> getAllFoods() {
		final String SQL ="select * from food";
		List<FoodBean> foods = new ArrayList<>();
		
			try {
				Context context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
				Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SQL);
				ResultSet rs = stmt.executeQuery();
				
				while(rs.next()) {
					FoodBean food = new FoodBean();
					food.setFoodno(rs.getString("foodno"));
					food.setName(rs.getString("name"));
					food.setCategory(rs.getString("category"));
					food.setExpiredate(rs.getString("expiredate"));
					food.setPreservation(rs.getString("preservation"));
					food.setCal(rs.getString("cal"));
					foods.add(food);
					}
				stmt.close();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			return foods;
	}

	@Override
	public void insertFood(String foodno, String name, String category, String expiredate, String preservation, String cal) {
		final String SQL ="INSERT INTO food VALUES (?, ?, ?, ?, ?, ?)";
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
			Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL);
			
			stmt.setString(1, foodno);
			stmt.setString(2, name);
			stmt.setString(3, category);
			stmt.setString(4, expiredate);
			stmt.setString(5, preservation);
			stmt.setString(6, cal);
			stmt.executeUpdate();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}

	@Override
	public void updateFood(String foodno, String name, String category, String expiredate, String preservation, String cal) {
		final String SQL ="UPDATE food SET name=?, category=?, expiredate=? , preservation=?, cal=? where foodno=?";
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
			Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL);
			
			stmt.setString(1, name);
			stmt.setString(2, category);
			stmt.setString(3, expiredate);
			stmt.setString(4, preservation);
			stmt.setString(5, foodno);
			stmt.setString(6, cal);
			stmt.executeUpdate();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}

	@Override
	public void deleteFood(String foodno) {
		final String SQL ="DELETE from food WHERE foodno = ?";
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
			Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL);
			
			stmt.setString(1, foodno);
			stmt.executeUpdate();
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}

	@Override
	public List<FoodBean> searchKeyWord(String name) {
		final String SQL ="SELECT * from EMPLOYEE WHERE ename LIKE ?";
		List<FoodBean> foods = new ArrayList<>();
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
			Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL);
			stmt.setString(1, "%" + name + "%");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				FoodBean food = new FoodBean();
				food.setFoodno(rs.getString("foodno"));
				food.setName(rs.getString("name"));
				food.setCategory(rs.getString("category"));
				food.setExpiredate(rs.getString("expiredate"));
				food.setPreservation(rs.getString("preservation"));
				food.setCal(rs.getString("cal"));
				foods.add(food);
				}
			stmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return foods;
	}
	
	@Override
	public List<FoodBean> getCal() {
		final String SQL ="select name,cal from food where name='broccoli' or name='tomato' or name='garlic'" ;
	
		List<FoodBean> foods = new ArrayList<>();
		
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
			Connection conn = ds.getConnection();
			PreparedStatement stmt = conn.prepareStatement(SQL);
//			stmt.setString(1, name);
			ResultSet rs = stmt.executeQuery();
			
			FoodBean food = null;
						
			while (rs.next()) {
				food = new FoodBean();
				food.setName(rs.getString("name"));
				food.setCal(rs.getString("cal"));
				foods.add(food);
			}
			
			
			stmt.close();
		} catch(SQLException e){
			e.printStackTrace();
		}catch (Exception e1) {
			e1.printStackTrace();
		}
		
		
		return foods;
		
	}
	


		@Override
	     public List<FoodBean> getMeat() {

	     final String SQL1 ="select name,cal from food where name='milk' or name='egg' or name='chicken'" ;

         List<FoodBean> foodmeats = new ArrayList<>();

         try {
 			Context context = new InitialContext();
 			DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
 			Connection conn = ds.getConnection();
 			PreparedStatement stmt = conn.prepareStatement(SQL1);
// 			stmt.setString(1, name);
 			ResultSet rs = stmt.executeQuery();
 			
 			FoodBean foodmeat = null;
 						
 			while (rs.next()) {
 				foodmeat = new FoodBean();
 				foodmeat.setName(rs.getString("name"));
 				foodmeat.setCal(rs.getString("cal"));
 				foodmeats.add(foodmeat);
 			}
 			
 			
 			stmt.close();
 		} catch(SQLException e){
 			e.printStackTrace();
 		}catch (Exception e1) {
 			e1.printStackTrace();
 		}
           return foodmeats;
       }
		
		
		@Override
		 public List<FoodBean> getFruit() {

		 final String SQL1 ="select name,cal from food where name='banana'" ;

		 List<FoodBean> foodfruits = new ArrayList<>();

		 try {
				Context context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
				Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SQL1);
//				stmt.setString(1, name);
				ResultSet rs = stmt.executeQuery();
				
				FoodBean foodfruit1 = null;
							
				while (rs.next()) {
					foodfruit1 = new FoodBean();
					foodfruit1.setName(rs.getString("name"));
					foodfruit1.setCal(rs.getString("cal"));
					foodfruits.add(foodfruit1);
				}
				
				
				stmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
		   return foodfruits;
		}

		@Override
		 public List<FoodBean> getOther() {

		 final String SQL1 ="select name,cal from food where name='ice cream' or name='honey' " ;

		 List<FoodBean> others = new ArrayList<>();

		 try {
				Context context = new InitialContext();
				DataSource ds = (DataSource)context.lookup("java:/comp/env/jdbc/servdb");
				Connection conn = ds.getConnection();
				PreparedStatement stmt = conn.prepareStatement(SQL1);
//				stmt.setString(1, name);
				ResultSet rs = stmt.executeQuery();
				
				FoodBean other = null;
							
				while (rs.next()) {
					other = new FoodBean();
					other.setName(rs.getString("name"));
					other.setCal(rs.getString("cal"));
					others.add(other);
				}
				
				
				stmt.close();
			} catch(SQLException e){
				e.printStackTrace();
			}catch (Exception e1) {
				e1.printStackTrace();
			}
		   return others;
		}


		
}












	