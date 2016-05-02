$(document).ready(function() {
    var max_fields      = 3; //maximum input boxes allowed
    var wrapper         = $("#"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
    
        var parentDiv = $("#question_" + $(this).attr("id"))
        var childDiv = parentDiv.children().first();
        childDiv.clone().appendTo(parentDiv);

        var parentDiv = $("#priority_" + $(this).attr("id"))
        var childDiv = parentDiv.children().first();
        childDiv.clone().appendTo(parentDiv);


    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});