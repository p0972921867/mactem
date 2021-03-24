package com.team2.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.team2.bean.FoodBean;


@WebServlet("/UpdateFood2")
public class UpdateFood2 extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String foodno =  request.getParameter("foodno");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String expiredate = request.getParameter("expiredate");
		String preservation = request.getParameter("preservation");
		String cal = request.getParameter("cal");


		
		//Dao method 
		FoodDaoImpl foodDao = new FoodDaoImpl();
		foodDao.updateFood(foodno, name, category, expiredate, preservation, cal);
		List<FoodBean> foods = foodDao.getAllFoods();
		request.setAttribute("foods", foods);
		request.getRequestDispatcher("/web/AllFood.jsp").forward(request, response);
				
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}