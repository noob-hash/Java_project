package controller1;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Subin
 */
public class model {
    //all the data that can be stored for the webpage
    int id;
    String name;
    String phone;
    String Degree;
    String Department;
    String password;
    int depId;
    String depName;
    String date;
    String data;

    //use abstraction to send only the needed information during each operation
    //model used for saving,editing a doctor's profile
    public model(int Id,String Name,String Phone,String DEGREE,String Dep,String Password){
        this.id=Id;
        this.name=Name;
        this.Degree=DEGREE;
        this.Department=Dep;
        this.phone=Phone;
        this.password=Password;
    }
    
    //model used to see the history of use
    public model(String DOI,String data){
        this.date=DOI;
        this.data=data;
    }
    
    //model used to save new department
    public model(int did,String Dname){
        this.depId=did;
        this.depName=Dname;
    }
    
    //setters for all the variables
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPhone() {
        return phone;
    }

    public String getDegree() {
        return Degree;
    }

    public String getDepartment() {
        return Department;
    }

    public String getPassword() {
        return password;
    }

    public int getDepId() {
        return depId;
    }

    public String getDepName() {
        return depName;
    }

    public String getDate() {
        return date;
    }

    public String getData() {
        return data;
    }
}
