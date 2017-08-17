$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        debugger;
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#profile-upload").change(function(){

    $('#img_prev').removeClass('hidden');
    readURL(this);
  });
});

$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#screenshot_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#screenshot-upload").change(function(){

    $('#screenshot_prev').removeClass('hidden');
    readURL(this);
  });
});


function Assign_function(project_id,bug_id)
{
  $.ajax({
    url: "/projects/"+project_id+"/bugs/"+bug_id+"/assign",

    cache: false,
    success: function(user){
      debugger;
      $("#assign_name_"+bug_id).html(user.name);
      $("#status_"+bug_id).html("Started");
      $("#completed_name_"+bug_id).html("<button href='#' onclick='complete_function("+ project_id +","+ bug_id +")' class='btn btn-info'>Marked Complete</button>");

    }
  });
}



function complete_function(project_id,bug_id)
{
  $.ajax({
    url: "/projects/"+project_id+"/bugs/"+bug_id+"/complete",

    cache: false,
    success: function(user){
      debugger;
      $("#status_"+bug_id).html("Completed");
      $("#completed_name_"+bug_id).html("");
    }
  });
}

