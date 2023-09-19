<!DOCTYPE html>
<html>
<head>
    <style>
        .main {
            font-weight: bold;
            font-size: x-large;

        }

        .container {

            background-color: rgba(192, 192, 192, 0.7); /* Light gray with 10% transparency */
            border-radius: 10px; /* Rounded corners */
            padding: 20px; /* Add padding to create space between content and border */
            margin: 50px;
            text-align: center; /* Center-align text inside the container */
            display: flex;
            flex-direction: column; /* Stack children vertically */
            justify-content: center; /* Vertically center-align children */
            align-items: center; /* Horizontally center-align children */
        }

        body {
            background-image: url("world.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }

        .edit-form-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2;

        }

        .edit-form {
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            margin: 50% 20%;
        }

    </style>

    <title>Countries</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>

<div class="container"> <!-- Apply the background to this div -->
    <h2>List of Countries</h2>

    <table class="custom-table">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Language</th>
            <th>Action</th>
            <th>Action</th>
        </tr>

        <#list countries as country>
            <tr>
                <td>${country.id}</td>
                <td>${country.name}</td>
                <td>${country.language}</td>
                <td>
                    <form method="post" action="/deletecountry/${country.id}" onsubmit="return confirm('Are you sure you want to delete this country? This action cannot be undone.');">
                        <button type="submit">Delete</button>
                    </form>
                </td>
                <td>
                    <button onclick="showEditForm(${country.id})">Edit</button>
                </td>
            </tr>
        </#list>
    </table>

    <div class="edit-form-container" id="editForm" style="display: none;">
        <div class="edit-form">
            <h2>Edit Country</h2>
            <form method="post" action="/updatecountry" id="editCountryForm">
                <input type="hidden" id="editCountryId" name="id">

                <label for="editName">Name:</label>
                <input type="text" id="editName" name="name" required><br><br>

                <label for="editLanguage">Language:</label>
                <input type="text" id="editLanguage" name="language" required><br><br>

                <button type="submit">Save Changes</button>
            </form>
        </div>
    </div>


    <h2>Add a New Country</h2>
    <form method="post" action="/addcountry">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="language">Language:</label>
        <input type="text" id="language" name="language" required><br><br>

        <button type="submit">Add Country</button>
    </form>

    <div class="main">
            <a href="/">Back</a>
    </div>



</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    function showEditForm(countryId) {
        console.log('Edit button clicked for country ID: ' + countryId);
        $.ajax({
            url: '/getcountry/' + countryId, // Replace with your actual endpoint
            type: 'GET',
            success: function (data) {
                document.getElementById("editCountryId").value = data.id;
                document.getElementById("editName").value = data.name;
                document.getElementById("editLanguage").value = data.language;

                document.getElementById("editForm").style.display = "block";
            },
            error: function () {
                alert("Error fetching country data.");
            }
        });
    }
</script>

</body>
</html>
