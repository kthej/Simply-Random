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
    
    var MainMode = Properties.getValue("MainMode");
    var TopMode = Properties.getValue("TopMode");
    var BottomMode = Properties.getValue("BottomMode");

    var screen_height = dc.getHeight();
    var screen_width = dc.getWidth();
    var dc_height = dc.getHeight();
    var dc_width = dc.getWidth();
    var range_min = Properties.getValue("RangeMin");
    var range_max = Properties.getValue("RangeMax");
    var range_diff = range_max - range_min; 

// Top Item /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    randBool = Math.rand()%2;   

        View.onUpdate(dc);

        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_BLACK);
        
        if(TopMode == 1){
        var randInt = (Math.rand() % (range_diff + 1))+range_min;
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc_width/2,dc_height*1/8,Graphics.FONT_LARGE,randInt, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }

        else if(TopMode == 2){
            // AI-Generated code to handle parsing name list into accessible array. It did the busywork, not the creative work :)
            var rawNameList = Properties.getValue("NameList").toCharArray();
            var finalNameList = [];
            var currentName = "";
            var char;
            var nameInt;
            var nameResult;

            for (var i = 0; i < rawNameList.size(); i++) {
                char = rawNameList[i];

                if (char == ',') {
                    // If we hit a comma, save the current string and reset it
                    if (currentName.length() > 0) {
                        finalNameList.add(currentName);
                        currentName = "";
                    }
                } else {
                // No need for .toChar() if the array already contains Char objects
                currentName += rawNameList[i];
            }   
            }

            // Add the very last name after the final comma (or if there was only one name)
            if (currentName.length() > 0) {
                finalNameList.add(currentName);
            }


            nameInt = Math.rand() % finalNameList.size().toNumber();
            nameResult = finalNameList[nameInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*1/8,Graphics.FONT_LARGE,nameResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(TopMode == 3){
            var randBool = (Math.rand() % 2);
            var displayText = null;
            if(randBool == 0){
                displayText = "No";
            }
            else if(randBool == 1){
                displayText = "Yes";
            }
            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*1/8,Graphics.FONT_LARGE,displayText, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(TopMode == 4){
            var rpsInt;
            var rpsResult;
            var rpsArray = ["Rock", "Paper", "Scissors"];
            rpsInt = Math.rand() % rpsArray.size().toNumber();
            rpsResult = rpsArray[rpsInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*1/8,Graphics.FONT_LARGE,rpsResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(TopMode == 6){
            var coinRand = Math.rand()%2;
            var coinResult = null;
            if (coinRand == 0){
                coinResult = "Tails";
            }
            else if(coinRand == 1){
                coinResult = "Heads";
            }
            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*1/8,Graphics.FONT_LARGE,coinResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }

// Main Item ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    if (MainMode == 0){
        main_die.draw(dc,screen_width/3,screen_height/2,screen_height/4,((Math.rand()%6)+1).toNumber());
        main_die.draw(dc,screen_width*2/3,screen_height/2,screen_height/4,((Math.rand()%6)+1).toNumber());
    }
    else if(MainMode == 1){
    var randInt = (Math.rand() % (range_diff + 1))+range_min;
    dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
    dc.drawRectangle(0,0,dc_width,dc_height);
    dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,randInt, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
    else if(MainMode == 2){
        // AI-Generated code to handle parsing name list into accessible array. It did the busywork, not the creative work :)
        var rawNameList = Properties.getValue("NameList").toCharArray();
        var finalNameList = [];
        var currentName = "";
        var char;
        var nameInt;
        var nameResult;

        for (var i = 0; i < rawNameList.size(); i++) {
            char = rawNameList[i];

            if (char == ',') {
                // If we hit a comma, save the current string and reset it
                if (currentName.length() > 0) {
                    finalNameList.add(currentName);
                    currentName = "";
                }
            } else {
            // No need for .toChar() if the array already contains Char objects
            currentName += rawNameList[i];
        }   
        }

        // Add the very last name after the final comma (or if there was only one name)
        if (currentName.length() > 0) {
            finalNameList.add(currentName);
        }


        nameInt = Math.rand() % finalNameList.size().toNumber();
        nameResult = finalNameList[nameInt];

        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);

        dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_MEDIUM,nameResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);           
    }
    else if(MainMode == 3){
        var randBool = (Math.rand() % 2);
        var displayText = null;
        if(randBool == 0){
            displayText = "No";
        }
        else if(randBool == 1){
            displayText = "Yes";
        }
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        
        dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,displayText, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
    else if(MainMode == 4){
        var rpsInt;
        var rpsResult;
        var rpsArray = ["Rock", "Paper", "Scissors"];
        rpsInt = Math.rand() % rpsArray.size().toNumber();
        rpsResult = rpsArray[rpsInt];

        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);

        dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,rpsResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
    else if(MainMode == 5){
        var eightBallInt;
        var eightBallResult;
        var eightBallArray = [
        "It is certain.",
        "It is decidedly so.",
        "Without a doubt.",
        "Yes definitely.",
        "You may rely on it.",
        "As I see it, yes.",
        "Most likely.",
        "Outlook good.",
        "Yes.",
        "Signs point to yes.",
        "Reply hazy,\n try again.",
        "Ask again later.",
        "Better not\n tell you now.",
        "Cannot predict now.",
        "Concentrate and\n ask again.",
        "Don't count on it.",
        "My reply is no.",
        "My sources say no.",
        "Outlook\n not so good.",
        "Very doubtful."
            ];
        eightBallInt = Math.rand() % eightBallArray.size().toNumber();
        eightBallResult = eightBallArray[eightBallInt];

        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);

        dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_TINY,eightBallResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }
    else if(MainMode == 6){

        var coinRand = Math.rand()%2;
        var coinResult = null;
        if (coinRand == 0){
            coinResult = "Tails";
        }
        else if(coinRand == 1){
            coinResult = "Heads";
        }
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        
        dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,coinResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }     

// Bottom Item //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        if(BottomMode == 1){
        var randInt = (Math.rand() % (range_diff + 1))+range_min;
        dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
        dc.drawText(dc_width/2,dc_height*7/8,Graphics.FONT_LARGE,randInt, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }

        else if(BottomMode == 2){
            // AI-Generated code to handle parsing name list into accessible array. It did the busywork, not the creative work :)
            var rawNameList = Properties.getValue("NameList").toCharArray();
            var finalNameList = [];
            var currentName = "";
            var char;
            var nameInt;
            var nameResult;

            for (var i = 0; i < rawNameList.size(); i++) {
                char = rawNameList[i];

                if (char == ',') {
                    // If we hit a comma, save the current string and reset it
                    if (currentName.length() > 0) {
                        finalNameList.add(currentName);
                        currentName = "";
                    }
                } else {
                // No need for .toChar() if the array already contains Char objects
                currentName += rawNameList[i];
            }   
            }

            // Add the very last name after the final comma (or if there was only one name)
            if (currentName.length() > 0) {
                finalNameList.add(currentName);
            }


            nameInt = Math.rand() % finalNameList.size().toNumber();
            nameResult = finalNameList[nameInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*7/8,Graphics.FONT_LARGE,nameResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(BottomMode == 3){
            var randBool = (Math.rand() % 2);
            var displayText = null;
            if(randBool == 0){
                displayText = "No";
            }
            else if(randBool == 1){
                displayText = "Yes";
            }
            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*7/8,Graphics.FONT_LARGE,displayText, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(BottomMode == 4){
            var rpsInt;
            var rpsResult;
            var rpsArray = ["Rock", "Paper", "Scissors"];
            rpsInt = Math.rand() % rpsArray.size().toNumber();
            rpsResult = rpsArray[rpsInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*7/8,Graphics.FONT_LARGE,rpsResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(BottomMode == 6){
            var coinRand = Math.rand()%2;
            var coinResult = null;
            if (coinRand == 0){
                coinResult = "Tails";
            }
            else if(coinRand == 1){
                coinResult = "Heads";
            }
            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc_width/2,dc_height*7/8,Graphics.FONT_LARGE,coinResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }



    function onHide() as Void {
    }

}

// Glance /////////////////////////////////////////////////////////////////////////////////////////

(:glance)
class Simply_RandomGlance extends WatchUi.GlanceView{
    public var glance_die = new Dice();
    public var glance_mode = Properties.getValue("GlanceMode");
    
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
            //  AI-Generated code to handle parsing name list into accessible array. It did the busywork, not the creative work :)
            var rawNameList = Properties.getValue("NameList").toCharArray();
            var finalNameList = [];
            var currentName = "";
            var char;
            var nameInt;
            var nameResult;

            for (var i = 0; i < rawNameList.size(); i++) {
                char = rawNameList[i];

                if (char == ',') {
                    // If we hit a comma, save the current string and reset it
                    if (currentName.length() > 0) {
                        finalNameList.add(currentName);
                        currentName = "";
                    }
                } else {
                // No need for .toChar() if the array already contains Char objects
                currentName += rawNameList[i];
            }   
            }

            // Add the very last name after the final comma (or if there was only one name)
            if (currentName.length() > 0) {
                finalNameList.add(currentName);
            }

  
            nameInt = Math.rand() % finalNameList.size().toNumber();
            nameResult = finalNameList[nameInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);

            dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_MEDIUM,nameResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);           
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
            var rpsInt;
            var rpsResult;
            var rpsArray = ["Rock", "Paper", "Scissors"];
            rpsInt = Math.rand() % rpsArray.size().toNumber();
            rpsResult = rpsArray[rpsInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);

            dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,rpsResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(glance_mode == 5){
            var eightBallInt;
            var eightBallResult;
            var eightBallArray = [
            "It is certain.",
            "It is decidedly so.",
            "Without a doubt.",
            "Yes definitely.",
            "You may rely on it.",
            "As I see it, yes.",
            "Most likely.",
            "Outlook good.",
            "Yes.",
            "Signs point to yes.",
            "Reply hazy,\n try again",
            "Ask again later.",
            "Better not\n tell you now.",
            "Cannot predict now.",
            "Concentrate and\n ask again.",
            "Don't count on it.",
            "My reply is no.",
            "My sources say no.",
            "Outlook\n not so good.",
            "Very doubtful."
             ];
            eightBallInt = Math.rand() % eightBallArray.size().toNumber();
            eightBallResult = eightBallArray[eightBallInt];

            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);

            dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_TINY,eightBallResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
        else if(glance_mode == 6){

            var coinRand = Math.rand()%2;
            var coinResult = null;
            if (coinRand == 0){
                coinResult = "Tails";
            }
            else if(coinRand == 1){
                coinResult = "Heads";
            }
            dc.setColor(Graphics.COLOR_WHITE,Graphics.COLOR_TRANSPARENT);
            
            dc.drawText(dc_width/2,dc_height/2,Graphics.FONT_LARGE,coinResult, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }        
    if(Properties.getValue("BorderRectangle") == true){dc.drawRectangle(0,0,dc_width,dc_height);}
    }

}
