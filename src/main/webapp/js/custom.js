/**
 * Created by isuru on 2/8/17.
 */


var table;

$(document).ready(function(){

    //initialize datepicker plugin
    $( function() {
        $( ".datepicker" ).datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy-mm-dd'
        });
    } );

    //initialize datatables plugin
    table = $('#activityTable').DataTable({
        "order": [[ 2, "asc" ]]
    });

});

function searchCourse() {
    var selectedCourse = $("#courseSelector").val();
    console.log(selectedCourse);
    table.search(selectedCourse).draw();
}

function searchActivity() {
    var selectedActivity = $("#activitySelector").val();
    console.log(selectedActivity);
    table.columns(1).search(selectedActivity).draw();
}

function startDateFilter() {
    var startDate = $("#start-date").val();
}
