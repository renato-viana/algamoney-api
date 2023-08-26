$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    $("form").submit(function () {
        $("#spinner-container").css("display", "block");
    });

    $("#togglePasswordButton").click(function () {
        var passwordInput = $("#password");
        var togglePasswordButton = $("#togglePasswordButton");

        if (passwordInput.attr("type") === "password") {
            passwordInput.attr("type", "text");
            togglePasswordButton.html('<i class="far fa-eye-slash"></i>');
        } else {
            passwordInput.attr("type", "password");
            togglePasswordButton.html('<i class="far fa-eye"></i>');
        }
    });
});
