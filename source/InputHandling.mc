import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class Simply_RandomDelegate extends WatchUi.BehaviorDelegate {
    var mainViewReference;
    function initialize(view) {
        BehaviorDelegate.initialize();
        mainViewReference = view;
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
