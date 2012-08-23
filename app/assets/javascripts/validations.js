$(document).ready(function(){

 var emailreg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

$("#idbutton").click(function(){
        $(".error").remove();
        if( $("#option").val() == "" ){
            $("#option").focus().after("<span class='error'>Select Something </span>");
            return false;
        }
        if( $("#value").val() == "" ){
            $("#value").focus().after("<span class='error'>Type your selection </span>");
            return false;
        }

        if( $("#option").val() == "Email" ){
        if( $("#value").val() == "" || !emailreg.test($("#value").val()) ){
            $("#value").focus().after("<span class='error'>Check your email</span>");
            return false;
        }
       }

    });


$("#idbutton_venues").click(function(){
        $(".error").remove();
        if( $("#name").val() == "" ){
            $("#name").focus().after("<span class='error'>Type name of venue </span>");
            return false;
        }

    });


$("#idbutton_friends").click(function(){
        $(".error").remove();
        if( $("#email").val() == "" ){
            $("#email").focus().after("<span class='error'>Type a email </span>");
            return false;
        }
         if( $("#email").val() == "" || !emailreg.test($("#email").val()) ){
            $("#email").focus().after("<span class='error'>Check your email</span>");
            return false;
        }
    });

});