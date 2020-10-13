package Servlets;

import Models.Invoice_details;
import Controllers.Invoice_detailsController;
import Models.Grn_details;
import Models.Grn_details_List;
import Models.Invoice_details_List;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Invoice_detailsServlet", urlPatterns = {"/Invoice_detailsServlet"})

public class Invoice_detailsServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String action = request.getParameter("action");
            String pattern = "yyyy/MM/dd - HH:mm:ss";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String current_date = simpleDateFormat.format(new Date());

            if (action.equals("insert")) {
                int invoice_id = Integer.parseInt(request.getParameter("invoice_id"));
                int item_registration_id = Integer.parseInt(request.getParameter("item_registration_id"));
                int qty = Integer.parseInt(request.getParameter("qty"));
                Invoice_details obj = new Invoice_details();
                obj.setInvoice_id(invoice_id);
                obj.setItem_registration_id(item_registration_id);
                obj.setQty(qty);
                obj.setDate_time(current_date);
                try {
                    Invoice_detailsController.getInstance().Save(obj);
                    response.getWriter().println("Saved!");
                } catch (Exception ex) {
                    //error
                }
            } else if (action.equals("update")) {
                int invoice_details_id = Integer.parseInt(request.getParameter("invoice_details_id"));
                int invoice_id = Integer.parseInt(request.getParameter("invoice_id"));
                int item_registration_id = Integer.parseInt(request.getParameter("item_registration_id"));
                int qty = Integer.parseInt(request.getParameter("qty"));
                Invoice_details obj = new Invoice_details();
                obj.setInvoice_details_id(invoice_details_id);
                obj.setInvoice_id(invoice_id);
                obj.setItem_registration_id(item_registration_id);
                obj.setQty(qty);
                obj.setDate_time(current_date);
                try {
                    Invoice_detailsController.getInstance().Update(obj);
                    response.getWriter().println("Updated!");
                } catch (Exception ex) {
                    //error
                }

            } else if (action.equals("delete")) {
                int invoice_details_id = Integer.parseInt(request.getParameter("invoice_details_id"));
                Invoice_details obj = new Invoice_details();
                obj.setInvoice_details_id(invoice_details_id);
                try {
                    Invoice_detailsController.getInstance().Delete(obj);
                    response.getWriter().println("Updated!");
                } catch (Exception ex) {
                    //error
                }
            } else if (action.equals("serch")) {
                try {
                    List<Invoice_details> list = new ArrayList<>();
                    List stringList = new ArrayList<>();

                    list = Invoice_detailsController.getInstance().SearchAll();
                    for (int i = 0; i < list.size(); i++) {
                        String s = list.get(i).getInvoice_details_id() + "_" + list.get(i).getInvoice_id() + "_" + list.get(i).getItem_registration_id() + "_" + list.get(i).getQty() + "_" + list.get(i).getDate_time() + "_";
                        stringList.add(s);
                    }
                    String b = String.join("~", stringList);
                    response.getWriter().println(b);
                } catch (Exception ex) {
                    //Error
                }

            } else if (action.equals("cart_insert")) {
                int invoice_id = Integer.parseInt(request.getParameter("invoice_id_i"));
                int item_registration_id = Integer.parseInt(request.getParameter("item_registration_id"));
                int qty = Integer.parseInt(request.getParameter("qty"));
                Invoice_details obj = new Invoice_details();
                obj.setInvoice_id(invoice_id);
                obj.setItem_registration_id(item_registration_id);
                obj.setQty(qty);
                obj.setDate_time(current_date);
                try {
                    Invoice_details_List.getInstance().addInvoice(obj);
                    double total = Invoice_details_List.getInstance().calTotal();
                    response.getWriter().println(total);
                } catch (Exception ex) {
                    //error
                }
            } else if (action.equals("cart_delete")) {
                int item_registration_id = Integer.parseInt(request.getParameter("item_dump"));
                try {
                    Invoice_details_List.getInstance().deleteGrn(item_registration_id);
                    double total = Grn_details_List.getInstance().calTotal();
                    response.getWriter().println(total);
                } catch (Exception ex) {
                    //error
                }
            } else if (action.equals("cart_serch")) {
                try {
                    List<Invoice_details> list = new ArrayList<>();
                    List stringList = new ArrayList<>();

                    list = Invoice_details_List.getInstance().getCart();
                    for (int i = 0; i < list.size(); i++) {
                        String s = list.get(i).getInvoice_details_id() + "_" + list.get(i).getInvoice_id() + "_" + list.get(i).getItem_registration_id() + "_" + list.get(i).getQty() + "_" + list.get(i).getDate_time() + "_";
                        stringList.add(s);
                    }
                    String b = String.join("~", stringList);
                    response.getWriter().println(b);
                } catch (Exception ex) {
                    //Error
                }

            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
