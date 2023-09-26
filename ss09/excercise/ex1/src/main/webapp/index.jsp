<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title> Product Discount Calculator </title>
</head>
<body>
    <form action="/discount-servlet">
        <label for="description">Mô tả sản phẩm</label>
        <input type="text" name="description" id="description"/>
        <br>
        <label for="listPrice">Giá niêm yết</label>
        <input type="number" name="listPriceProduct" id="listPrice"/>
        <br>
        <label for="discountPercent">Giá niêm yết</label>
        <input type="number" name="discountPercentProduct" id="discountPercent"/>
        <input type="submit" value="Chiết khấu">
    </form>
    Chiết khấu: ${result}
</body>
</html>