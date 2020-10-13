package Controllers;

import Models.Customer;
import DataBaseConnector.Connector;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerController {

    Connector con = Connector.getInstance();

    private CustomerController() {
    }

    private static final CustomerController obj = new CustomerController();

    public static CustomerController getInstance() {
        return obj;
    }

    public void Save(Customer data) throws Exception {
        con.getConnection();
        con.aud("INSERT INTO customer(name,address,contact_no,email,date_time) values ('" + data.getName() + "','" + data.getAddress() + "','" + data.getContact_no() + "','" + data.getEmail() + "','" + data.getDate_time() + "') ");
    }

    public void Update(Customer data) throws Exception {
        con.getConnection();
        con.aud("UPDATE customer SET name  = '" + data.getName() + "',address  = '" + data.getAddress() + "',contact_no  = '" + data.getContact_no() + "',email  = '" + data.getEmail() + "',date_time  = '" + data.getDate_time() + "' WHERE customer_id = '" + data.getCustomer_id() + "'");
    }

    public void Delete(Customer data) throws Exception {
        con.getConnection();
        con.aud("DELETE FROM customer WHERE customer_id = '" + data.getCustomer_id() + "'");
    }

    public List<Customer> SearchAll() throws Exception {
        List<Customer> objList = new ArrayList<Customer>();
        con.getConnection();
        ResultSet rset = con.srh("SELECT * FROM customer");
        while (rset.next()) {
            Customer obj = new Customer();
            obj.setCustomer_id(rset.getInt(1));
            obj.setName(rset.getString(2));
            obj.setAddress(rset.getString(3));
            obj.setContact_no(rset.getString(4));
            obj.setEmail(rset.getString(5));
            obj.setDate_time(rset.getString(6));
            objList.add(obj);
        }

        return objList;
    }

    public List<Customer> Search(Customer data) throws Exception {
        List<Customer> objList = new ArrayList<Customer>();
        con.getConnection();
        ResultSet rset = con.srh("SELECT * FROM customer WHERE customer_id = '" + data.getCustomer_id() + "'");
        while (rset.next()) {
            Customer obj = new Customer();
            obj.setCustomer_id(rset.getInt(1));
            obj.setName(rset.getString(2));
            obj.setAddress(rset.getString(3));
            obj.setContact_no(rset.getString(4));
            obj.setEmail(rset.getString(5));
            obj.setDate_time(rset.getString(6));
            objList.add(obj);
        }

        return objList;
    }

    public String getUserFullName(int user_id) throws Exception {
        String name = "";

        con.getConnection();
        ResultSet rset = con.srh("SELECT * FROM customer WHERE customer_id = '" + user_id + "'");
        if (rset.next()) {
            name = rset.getString(2);
        }

        return name;
    }

}
