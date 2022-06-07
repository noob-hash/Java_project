package doctorController;


/**
 *
 * @author Subin
 */

//model for patient data
public class doctorModel {
    String name;
    int id;
    String date;
    String gender;
    int age;
    String phone;
    String blood_group;
    String allergies;
    int height;
    int weight;
    int temp;
    int pulse;
    String bp;
    String diagnosis;
    String TP;
    String Presciption;
    String TR;
    int totalApp;
    int upcommingApp;
    String time;
    
    //stores date for particular patient where the patient has an appoinment
    public doctorModel(String date){
        this.date=date;
    }
    
    //for homepage stores data to be shown in table
    public doctorModel(int id, String name,String time,String phone){
        this.id=id;
        this.name=name;
        this.time=time;
        this.phone=phone;
    }
    
    //for homepage stores data to be shown in table
    public doctorModel(int id, String name,String phone){
        this.id=id;
        this.name=name;
        this.phone=phone;
    }
    
    //for patient data stores data to be shown in record
    public doctorModel(int id,String name,String gender,int age,String phone,String Bg,String Allergies){
        this.name=name;
        this.id=id;
        this.gender=gender;
        this.age=age;
        this.phone=phone;
        this.blood_group=Bg;
        this.allergies=Allergies;
    }
    
    //for patient data stores data to be shown in record
    public doctorModel(int id,String name,int totalApp,int upcomingApp,String gender,int age,String phone,String Bg,String Allergies,int height,int weight,int temp,int pulse,String bp,String diagonisis,String TP, String Presciption,String TR,String date){
        this.name=name;
        this.id=id;
        this.totalApp=totalApp;
        this.upcommingApp=upcomingApp;
        this.gender=gender;
        this.age=age;
        this.phone=phone;
        this.blood_group=Bg;
        this.allergies=Allergies;
        this.diagnosis=diagonisis;
        this.Presciption=Presciption;
        this.TP=TP;
        this.TR=TR;
        this.temp=temp;
        this.height=height;
        this.pulse=pulse;
        this.bp=bp;
        this.weight=weight;
        this.date=date;
    }

    //all getters for data
    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public String getGender() {
        return gender;
    }

    public int getAge() {
        return age;
    }

    public String getPhone() {
        return phone;
    }

    public String getBlood_group() {
        return blood_group;
    }

    public String getAllergies() {
        return allergies;
    }

    public int getHeight() {
        return height;
    }

    public int getWeight() {
        return weight;
    }

    public int getTemp() {
        return temp;
    }

    public int getPulse() {
        return pulse;
    }

    public String getBp() {
        return bp;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public String getTP() {
        return TP;
    }

    public String getPresciption() {
        return Presciption;
    }

    public String getTR() {
        return TR;
    }

    public int getTotalApp() {
        return totalApp;
    }

    public int getUpcommingApp() {
        return upcommingApp;
    }
    
    public String getTime() {
        return time;
    }
    
}
