package com.team2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team2.bean.FoodBean;

@WebServlet("/Cal")
public class Cal extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FoodDaoImpl foodDao = new FoodDaoImpl();
		
		List<FoodBean> foods = foodDao.getCal();
		List<FoodBean> foodmeat = foodDao.getMeat();
		List<FoodBean> foodfruits = foodDao.getFruit();
		List<FoodBean> others = foodDao.getOther();
	
		request.setAttribute("foods", foods);
		request.setAttribute("foodmeats", foodmeat);
		request.setAttribute("foodfruits", foodfruits);
		request.setAttribute("others", others);
		
		request.getRequestDispatcher("/web/Carl.jsp").forward(request, response);
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}