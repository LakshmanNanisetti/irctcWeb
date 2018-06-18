package src;
public class Passenger{
    int id,age,gender,bearthNo,ticketId,wl;
    String name,category;
    public Passenger(int id,int age,int gender,int bearthNo,int ticketId,int wl,String name,String category){
        this.id = id;
        this.age = age;
        this.gender = gender;
        this.bearthNo = bearthNo;
        this.ticketId = ticketId;
        this.wl = wl;
        this.name = name;
        this.category = category;
    }
    public int getId(){
        return id;
    }
    public int getAge(){
        return age;
    }
    public String getGender(){
        String res = "";
        if(gender==1){
            res = "Male";
        }
        else{
            res = "Female";
        }
        return res;
    }
    public int getBearthNo(){
        return bearthNo;
    }
    public int getTicketId(){
        return ticketId;
    }
    public int getWl(){
        return wl;
    }
    public String getName(){
        return name;
    }
    public String getCategory(){
        return category;
    }
}