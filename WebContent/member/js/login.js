window.addEventListener('load', () => {
	const forms = document.getElementsByClassName('validation-form');

	Array.prototype.filter.call(forms, (form) => {
		form.addEventListener('submit', function(event) {
			if (form.checkValidity() === false) {
				event.preventDefault();
				event.stopPropagation();
			}

			form.classList.add('was-validated');
		}, false);
	});
}, false);
let user_id = $.cookie("user_id");
if (user_id != null) {
	$("#id").val(user_id);
	$("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function() {

	if  ($"#chk_save_id").is(":checked")) {

		if  ($("#id").val().trim() == "") {
			alert("id를 입력해 주십시오");
			$("#chk_save_id").prop("checked", false);
		} else {
			// cookie를 저장
			$.cookie("user_id", $("#id").val().trim(), {  expires 7, path: './' });
		}

	} else {
		$.removeCookie("user_id", { path: './' });
	}
});
