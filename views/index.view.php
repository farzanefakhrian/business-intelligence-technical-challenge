<!DOCTYPE html>
<html>

<head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" /></head>
<body>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<h1 style="padding: 2em; background-color: crimson; text-align: center; color: white">Digikala Business Intelligence Test</h1>

<h2>File upload</h2>


<p>Please submit your excel file:</p>
<form action="import-file" method="POST" enctype="multipart/form-data">
    <label for="tables">Choose a table:</label>
    <select name="tables" id="tables">
        <option value="user_table">user</option>
        <option value="product_table">product</option>
        <option value="variant_table">variant</option>
        <option value="order_table">order</option>
        <option value="orderitems_table">order items</option>
    </select>
    <br><br>
    <label for="file">Select a file:</label>
    <input type="file" id="file" name="file"><br><br>
    <input type="submit"  name="submit_file" value="Submit">
</form><br>

<hr>

<h2>File Download</h2>

<p>Enter your desired period:</p>

<form action="export-file" method="POST">
    <label for="start_day">From:</label>
    <input type="date" id="start_day" name="start_day">
    <label for="end_day">To:</label>
    <input type="date" id="end_day" name="end_day">
    <input type="submit" value="Submit">
</form>

</body>
</html>
