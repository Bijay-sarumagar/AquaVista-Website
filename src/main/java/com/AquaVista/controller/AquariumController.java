package com.AquaVista.controller;

import com.AquaVista.model.AquariumModel;
import com.AquaVista.service.AquariumService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/aquariums", "/addAquarium", "/editAquarium", "/deleteAquarium"})
public class AquariumController extends HttpServlet {

    private final AquariumService aquariumService = new AquariumService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();
        String idParam = req.getParameter("id");

        switch (path) {
            case "/editAquarium":
                if (idParam != null) {
                    int id = Integer.parseInt(idParam);
                    AquariumModel aquarium = aquariumService.getAquariumById(id);
                    req.setAttribute("aquarium", aquarium);
                    req.getRequestDispatcher("/WEB-INF/pages/editAquarium.jsp").forward(req, resp);
                }
                break;

            case "/deleteAquarium":
                if (idParam != null) {
                    int id = Integer.parseInt(idParam);
                    boolean deleted = aquariumService.deleteAquarium(id);
                    req.getSession().setAttribute("message", deleted ? "Aquarium deleted successfully." : "Failed to delete aquarium.");
                }
                resp.sendRedirect(req.getContextPath() + "/aquariums");
                break;

            case "/addAquarium":
                req.getRequestDispatcher("/WEB-INF/pages/addAquarium.jsp").forward(req, resp);
                break;

            case "/aquariums":
            default:
                String keyword = req.getParameter("keyword");
                List<AquariumModel> list = aquariumService.getAllAquariums();

                if (keyword != null && !keyword.trim().isEmpty()) {
                    String lowerKeyword = keyword.toLowerCase().trim();
                    List<AquariumModel> filteredList = new ArrayList<>();

                    for (AquariumModel a : list) {
                        if (a.getName().toLowerCase().contains(lowerKeyword) ||
                            a.getDescription().toLowerCase().contains(lowerKeyword)) {
                            filteredList.add(a);
                        }
                    }

                    req.setAttribute("aquariums", filteredList);
                    req.setAttribute("keyword", keyword); // retain value in search input
                } else {
                    req.setAttribute("aquariums", list);
                }

                req.getRequestDispatcher("/WEB-INF/pages/aquariums.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String path = req.getServletPath();
        String idParam = req.getParameter("aquariumId");

        String name = req.getParameter("name");
        String description = req.getParameter("description");
        double size = Double.parseDouble(req.getParameter("size"));
        int ownerId = Integer.parseInt(req.getParameter("ownerId"));

        AquariumModel aq = new AquariumModel();
        aq.setName(name);
        aq.setDescription(description);
        aq.setSize(size);
        aq.setOwnerId(ownerId);

        boolean success = false;

        if ("/editAquarium".equals(path)) {
            aq.setAquariumId(Integer.parseInt(idParam));
            success = aquariumService.updateAquarium(aq);
            req.getSession().setAttribute("message", success ? "Aquarium updated successfully." : "Failed to update. Check if name or ID already exists.");

        } else if ("/addAquarium".equals(path)) {
            success = aquariumService.addAquarium(aq);
            req.getSession().setAttribute("message", success ? "Aquarium added successfully." : "Failed to add. Check for duplicate name or ID.");
        }

        resp.sendRedirect(req.getContextPath() + "/aquariums");
    }
}
