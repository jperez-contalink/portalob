$(document).on('ready', function () {
	$.ajax({
		url: "http://localhost:3000/api/v1/ad_images/FCA42C3E8A684B72AC00854C4243859B",
		success: function (data) {
			$("#imagen-bonita").attr("src", "data:image/png;base64,"+data["bindaryData"])
		},
		error: function (data) {
			alert("error")
		}
	});
});