window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');

    Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });
}, false);

$(function () {

    $("#id_chk").click(function () {
        //	alert("btn click");

        $.ajax({
            type:"post",
            url:"../member?param=idcheck",
            data:{ "id":$("#id").val() },
            success:function( data ){
                if(data.msg.trim() == "YES"){
                    $("#idcheck").css("color", "#0000ff");
                    $("#idcheck").html('사용할 수 있는 id입니다');
                }else{
                    $("#idcheck").css("color", "#ff0000");
                    $("#idcheck").html('사용 중인 id입니다');
                    $("#id").val("");
                }
            },
            error:function(){
                alert("error");
            }
        });

    });

});