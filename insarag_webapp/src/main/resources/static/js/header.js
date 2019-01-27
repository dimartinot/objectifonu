function alertUpdate() {
	$.ajax({
        url: "/getAlert",
        }).then(
        		function(data) {
        			$('#numberOfAlerts').html(data);
        			$('#numberOfAlertsBis').html(data);
        			//       $('.greeting-content').append(data.content);
    });
}


$(document).ready(function() {
	alertUpdate();
	setInterval(alertUpdate,5000);
	});