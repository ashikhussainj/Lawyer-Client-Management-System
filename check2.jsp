<!DOCTYPE html>
<html>
<head>
    <title>Servlet Data Example</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
    <h1>Servlet Data Example</h1>
    <button id="getDataButton">Get Data from Servlet</button>
    <div id="dataContainer"></div>

    <script>
        $(document).ready(function () {
            $("#getDataButton").click(function () {
                // Make an AJAX GET request to your servlet
                $.ajax({
                    type: "GET",
                    url: "YourServletURL",
                    dataType: "json", // Assuming your servlet returns JSON
                    success: function (data) {
                        // Handle the data here
                        $("#dataContainer").html('<pre>' + JSON.stringify(data, null, 2) + '</pre>');
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + status + " - " + error);
                    }
                });
            });
        });
    </script>
</body>
</html>
