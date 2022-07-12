/**
 * [프로젝트]롯데e커머스_자바전문가과정
 * [시스템명]영화예매시스템
 * [팀 명]CUTEam
 * [파일명]login.js
 * -----------------------------------------------------------
 * 수정일자           수정자         수정내용
 * 2022.07.08       이충현         신규생성
 * -----------------------------------------------------------
 */

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