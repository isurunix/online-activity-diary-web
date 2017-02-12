/**
 * Created by isuru on 2/8/17.
 */


var table;

$(document).ready(function(){

    //initialize datatables plugin
    table = $('#activityTable').DataTable({
        "order": [[ 2, "asc" ]]
    });

    $(".datepicker").datepicker({
        onSelect: function () {
            table.draw();
        },
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });

    $( "#start-date" ).datepicker( "setDate", "2017-01-01" );
    $( "#end-date" ).datepicker( "setDate", "2017-12-31" );
});

$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var startDate = Date.parse($("#start-date").val());
        var endDate = Date.parse($("#end-date").val());
        var date = Date.parse(data[2]);

        if(isNaN(startDate) || isNaN(endDate) || isNaN(date)) {
            console.log("date null");
            return true;
        }
        if(date >= startDate && date <= endDate) {
            console.log("s:"+startDate);
            console.log("e:"+endDate);
            console.log("d:"+date);
            return true;
        }
        return false;
    }
);


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


