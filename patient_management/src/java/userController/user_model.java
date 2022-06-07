package userController;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Subin
 */
public class user_model {
    private String name;
    private String age;
    private String gender;
    private String phone;
    private String date;
    private String time;
    private String department;
    private String doctor;
    private String Dep_list;
    private String Doc_list;

    
    public user_model(String name,String age,String gender,String phone,String date,String time,String department,String doctor){
        this.name=name;
        this.age=age;
        this.gender=gender;
        this.phone=phone;
        this.date=date;
        this.time=time;
        this.department=department;
        this.doctor=doctor;
    }
    
    public user_model (String department){
        this.Dep_list=department;
    }
    
    public user_model (String d,String doctor){
        this.Doc_list=doctor;
    }
    
    public String getName() {
        return name;
    }

    public String getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getPhone() {
        return phone;
    }

    public String getDate() {
        return date;
    }

    public String getTime() {
        return time;
    }

    public String getDepartment() {
        return department;
    }

    public String getDoctor() {
        return doctor;
    }

    public String getDep_list() {
        return Dep_list;
    }

    public String getDoc_list() {
        return Doc_list;
    }
    
    
}
