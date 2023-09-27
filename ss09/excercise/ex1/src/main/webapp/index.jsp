<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> Product Discount Calculator </title>
</head>
<body>
    <form action="/discount-servlet">
        <label for="listPrice">Giá niêm yết:</label>
        <input type="number" name="listPriceProduct" id="listPrice"/>
        <br>
        <br>
        <label for="discountPercent">Tỷ lệ chiết khấu:</label>
        <input type="number" name="discountPercentProduct" id="discountPercent"/>
        <input type="submit" value="Chiết khấu">
    </form>
    <br>
    Chiết khấu: ${result}VND
    <br>
    Giá sản phẩm sau khi giảm giá: ${priceProduct}VND
</body>
</html>