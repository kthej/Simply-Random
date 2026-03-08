import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Math;
import Toybox.System;
import Toybox.Application.Properties;
// import Toybox.Sensor;
public var mainRand;



(:glance)
class Dice {
    var x_pos, y_pos, side, number, radius;
    function initialize(){
        
    }
    function draw(dc as Dc,x_pos,y_pos,side,number){
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        dc.fillRoundedRectangle(x_pos- side/2,y_pos - side/2,side,side,side/5);
        dc.setColor(Graphics.COLOR_BLACK,Graphics.COLOR_TRANSPARENT);
        if(number == 1){
           
            dc.fillCircle(x_pos,y_pos,side/10);
        }
        else if(number == 2){
            dc.fillCircle(x_pos+side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos-side/4,y_pos+side/4,side/10);
        }
        else if(number == 3){
            dc.fillCircle(x_pos+side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos,y_pos,side/10);
            dc.fillCircle(x_pos-side/4,y_pos+side/4,side/10);
        }
        else if(number == 4){
            dc.fillCircle(x_pos+side/4,y_pos+side/4,side/10);
            dc.fillCircle(x_pos-side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos+side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos-side/4,y_pos+side/4,side/10);
        }
        else if(number == 5){
            dc.fillCircle(x_pos,y_pos,side/10);
            dc.fillCircle(x_pos+side/4,y_pos+side/4,side/10);
            dc.fillCircle(x_pos-side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos+side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos-side/4,y_pos+side/4,side/10);
        }
        else if(number == 6){
            dc.fillCircle(x_pos-side/4,y_pos,side/10);
            dc.fillCircle(x_pos+side/4,y_pos,side/10);
            dc.fillCircle(x_pos+side/4,y_pos+side/4,side/10);
            dc.fillCircle(x_pos-side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos+side/4,y_pos-side/4,side/10);
            dc.fillCircle(x_pos-side/4,y_pos+side/4,side/10);
        }
                
    }
}
class Simply_RandomView extends WatchUi.View {
    // var mainDC = Graphics.Dc;
    // public var screen_height = mainDC.getHeight();
    // public var screen_width = mainDC.getWidth();
    public var main_die = new Dice();
    
    public var rand1 = (Math.rand()%6)+1;
    public var randBool;
    public var randInt;
    
    

    function initialize() {
        View.initialize();
        
    }
    function roll(){
        rand1 = (Math.rand()%6)+1;
        randBool = (Math.rand()%2);
        
    }
    function onLayout(dc as Dc) as Void {
       
        
    }

    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        

    var screen_height = dc.getHeight();
    var screen_width = dc.getWidth();
    var dc_height = dc.getHeight();
    var dc_width = dc.getWidth();
    var range_min = Properties.getValue("RangeMin");
    var range_max = Properties.getValue("RangeMax");
    var range_diff = range_max - range_min; 
    randBool = Math.rand()%2;   

        View.onUpdate(dc);

        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_BLACK);
        
        if (randBool == 0){
            dc.drawText(screen_width/2,screen_height/16,Graphics.FONT_SMALL,"No",Graphics.TEXT_JUSTIFY_CENTER);
        }
        else if(randBool == 1){
            dc.drawText(screen_width/2,screen_height/16,Graphics.FONT_TINY,"Yes",Graphics.TEXT_JUSTIFY_CENTER);
        }

        main_die.draw(dc,screen_width/3,screen_height/2,screen_height/4,((Math.rand()%6)+1).toNumber());
        main_die.draw(dc,screen_width*2/3,screen_height/2,screen_height/4,((Math.rand()%6)+1).toNumber());

        var randInt = (Math.rand() % (range_diff + 1))+range_min;
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        // dc.drawRectangle(0,0,dc_width,dc_height);
        dc.drawText(dc_width/2,dc_height*7/8,Graphics.FONT_LARGE,randInt, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }



    function onHide() as Void {
    }

}

(:glance)
class Simply_RandomGlance extends WatchUi.GlanceView{
    public var glance_die = new Dice();
    public var glance_mode = Properties.getValue("GlanceMode");
    
    public var rpsInt;
    public var rpsResult;

    function initialize(){
        GlanceView.initialize();
    }
    
    function onUpdate(dc as Dc) as Void{

        var dc_height = dc.getHeight();
        var dc_width = dc.getWidth();
        var range_min = Properties.getValue("RangeMin");
        var range_max = Properties.getValue("RangeMax");
        var range_diff = range_max - range_min;

        if (glance_mode == 0){
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        glance_die.draw(dc,dc_width*3/4,dc_height/2,dc_height*0.75,(Math.rand()%6)+1);
        glance_die.draw(dc,dc_width/4,dc_height/2,dc_height*0.75,(Math.rand()%6)+1);
        }

        else if(glance_mode == 1){
        var randInt = (Math.rand() % (range_diff + 1))+range_min;
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        dc.drawRectangle(0,0,dc_width,dc_height);
        dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,randInt, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(glance_mode == 2){
            
        }
        else if(glance_mode == 3){
            var randBool = (Math.rand() % 2);
            var displayText = null;
            if(randBool == 0){
                displayText = "No";
            }
            else if(randBool == 1){
                displayText = "Yes";
            }
            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawRectangle(0,0,dc_width,dc_height);
            dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,displayText, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(glance_mode == 4){

            var rpsArray = ["Rock", "Paper", "Scissors"];
            rpsInt = Math.rand() % rpsArray.size().toNumber();
            rpsResult = rpsArray[rpsInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawRectangle(0,0,dc_width,dc_height);
            dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,rpsResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }

    }

}
