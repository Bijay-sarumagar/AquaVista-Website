package com.AquaVista.controller;

import com.AquaVista.model.AquariumModel;
import com.AquaVista.service.AquariumService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final AquariumService aquariumService = new AquariumService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<AquariumModel> aquariums = aquariumService.getAllAquariums();
            request.setAttribute("aquariums", aquariums);
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/WEB-INF/pages/admin.jsp").forward(request, response);
    }
}
