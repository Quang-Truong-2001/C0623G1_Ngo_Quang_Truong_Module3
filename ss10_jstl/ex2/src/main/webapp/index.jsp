<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculate</title>
</head>
<body>

<form action="/servlet">
    <fieldset>
        <legend>Caculator</legend>
        <label for="num1">First operand:</label>
        <input type="number" name="number1" id="num1">
        <br>
        <br>
        <label style="min-width: 150px" for="operator">Operator:</label>
        <select name="operator" id="operator">
            <option value="Addition">Addition</option>
            <option value="Subtraction">Subtraction</option>
            <option value="Multiplication">Multiplication</option>
            <option value="Division">Division</option>
        </select>
        <br>
        <br>
        <label for="num2">Second operand: </label>
        <input type="number" name="number2" id="num2">
        <br>
        <br>
        <input type="submit" value="Calculate">
    </fieldset>
</form>
<br>
Result: ${result}
</body>
</html>