$(document).ready(function(){


   $('#wash_record_muddy_bed_true').click(function(){
      $('#amount-charged').val('12');
   });

   $('#wash_record_muddy_bed_false').click(function(){
      $('#amount-charged').val('10');
   });




});

function hideTruckQuestions() {
    document.getElementById('trucks').style.display = "none";
}
function showTruckQuestions() {
    document.getElementById('trucks').style.display = "block";
}
