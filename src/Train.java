package src;
public class Train{
    private int no,day;
    private String name,from,to;
    private double fare;

    // int ac1,ac2,ac3,ac4,ac5;
    // int sl1,sl2,sl3,sl4,sl5;
    public Train(int no,int day,String name,String from,String to,double fare){
        this.no = no;
        this.day = day;
        this.name = name;
        this.from = from;
        this.to = to;
        this.fare = fare;
    }
    public int getNo(){
        return no;
    }
    public int getDay(){
        return day;
    }
    public String getName(){
        return name;
    }
    public String getFrom(){
        return from;
    }
    public String getTo(){
        return to;
    }
    public double getFare(){
        return fare;
    }
}