import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class Simply_RandomDelegate extends WatchUi.BehaviorDelegate {
    var mainViewReference;
    function initialize(view) {
        BehaviorDelegate.initialize();
        mainViewReference = view;
    }

    function onMenu() {
        var menu = new WatchUi.Menu2({:title=>"Edit Glance"});
        var delegate;
        menu.addItem(
            new MenuItem(
                "Dice",
                "A 6-sided die",
                "Menu1",
                {}
            )
        );
        menu.addItem(
            new MenuItem(
                "1 - 100",
                "a random percent",
                "Menu2",
                {}
            )
        );

        delegate = new WatchUi.Menu2InputDelegate(); // a WatchUi.Menu2InputDelegate
        WatchUi.pushView(menu, delegate, WatchUi.SLIDE_IMMEDIATE);
        return true;
    }
    function onBack() as Boolean{
        System.exit();
    }
    
    function onSelect() as Boolean{

        mainViewReference.roll();
        WatchUi.requestUpdate();


        return true;
    }
}
