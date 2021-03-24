package com.team2.model;
import java.util.List;
import com.team2.bean.FoodBean;

public interface FoodDao {
	
	FoodBean getFood(String foodno);
	List<FoodBean> getAllFoods();
	void insertFood(String foodno, String name, String category, String expiredate, String preservation, String cal);
	void updateFood(String foodno, String name, String category, String expiredate, String preservation, String cal);
	void deleteFood(String foodno);
	List<FoodBean> searchKeyWord(String name);
	List<FoodBean> getCal();
	List<FoodBean> getMeat();
	List<FoodBean> getFruit();
	List<FoodBean> getOther();

}
