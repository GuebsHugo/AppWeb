<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="include/importTags.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paiement PayPal</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<h2>Paiement PayPal</h2>

<form action="/paypal" method="post">
    <input type="hidden" name="cmd" value="_xclick">
    <input type="hidden" name="business" value="${paypalBusinessEmail}">
    <input type="hidden" name="item_name" value="${itemName}">
    <input type="hidden" name="amount" value="${amount}">
    <input type="hidden" name="currency_code" value="${currencyCode}">
    <input type="hidden" name="return" value="${returnUrl}">
    <input type="hidden" name="cancel_return" value="${cancelUrl}">
    <input type="hidden" name="lc" value="FR">
    <button type="submit">Payer avec PayPal</button>
</form>
</body>
</html>
