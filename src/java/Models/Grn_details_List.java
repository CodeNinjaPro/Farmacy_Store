/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Roshan Withanage
 */
public class Grn_details_List {

    private List<Grn_details> list = new ArrayList<>();

    private Grn_details_List() {
    }

    private static final Grn_details_List obj = new Grn_details_List();

    public static Grn_details_List getInstance() {
        return obj;
    }

    public void addGrn(Grn_details obj) {
        list.add(obj);
    }

    public void deleteGrn(int item_registration_id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getItem_registration_id() == item_registration_id) {
                list.remove(list.get(i));
            }
        }
    }

    public double calTotal() {
        double total = 0;

        for (int i = 0; i < list.size(); i++) {
            total += list.get(i).getQty() * list.get(i).getUnit_price();
        }

        return total;
    }

    public List<Grn_details> getCart() {
        return list;
    }

    public void setGrnID(int id) {
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setGrn_id(id);
        }
    }

    public void setDate(String date) {
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setDate_time(date);
        }
    }
    
    public void removeAll(){
        list.removeAll(list);
    }

}
