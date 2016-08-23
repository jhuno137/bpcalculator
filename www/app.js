$(function(){
	// set background color on Result div
	// in order to underline the importance
	// of the diagnostic 
	setResultColor = function(){
		systolic = $('#systolic').val(); // actual value
		diastolic = $('#diastolic').val(); // actual value
		if(diastolic<60 && systolic <90){
        	$("#result").css('background','#d9edf7')
	    }else if(diastolic<80 && systolic<120){
	        $("#result").css('background','#dff0d8')
	    }else if(diastolic<90 && systolic<140){
	        $("#result").css('background','#fcf8e3')
	    }else{
	        $("#result").css('background','#f2dede')
	    }
	}
	// Init
	$("#result").css('background','#dff0d8');
	// diastolic pressure changed
	$("#diastolic").change(function(){setResultColor()});
	// systolic pressure changed
	$("#systolic").change(function(){setResultColor()});
});

