/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import Controllers.Item_registrationController;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roshan Withanage
 */
public class Invoice_details_List {

    private List<Invoice_details> list = new ArrayList<>();

    private static final Invoice_details_List obj = new Invoice_details_List();

    public static Invoice_details_List getInstance() {
        return obj;
    }

    public void addInvoice(Invoice_details obj) {
        list.add(obj);
    }

    public void deleteGrn(int item_registration_id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getItem_registration_id() == item_registration_id) {
                list.remove(list.get(i));
            }
        }
    }

    public double calTotal() throws Exception {
        double total = 0;

        for (int i = 0; i < list.size(); i++) {
            total += list.get(i).getQty() * Item_registrationController.getInstance().getPrice(list.get(i).getItem_registration_id());
        }

        return total;
    }

    public List<Invoice_details> getCart() {
        return list;
    }

    public void setInvoiceID(int id) {
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setInvoice_id(id);
        }
    }

    public void setDate(String date) {
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setDate_time(date);
        }
    }

    public void removeAll() {
        list.removeAll(list);
    }
}
