$(document).ready(function(){
  $("#type_select").on("change", function(){
    var value = $("option:selected", "#type_select").val();
    console.log(value);
    if ((value === "block") || (value === "block with multiple inputs")){    
      $('#hide-sub-question').css('display', 'inline');
      console.log("hi");
    } else {
      $('#hide-sub-question').css('display', 'none');
    }
  });
  var count = 1;
  $("#add").click(function(){
    var newElement = "<div class='form-group'><label class='col-sm-2 control-label' for='sub_question'>Sub question</label><div class='col-sm-10'><input type='text' name='sub_question["+count+"]' id='sub_question_"+count+"' class='form-control' /></div></div>"
    count = count + 1;
    $(".sub-question").append(newElement);
  });
});



