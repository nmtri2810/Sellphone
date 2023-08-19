<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="css/cart.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	<script src="https://use.fontawesome.com/c560c025cf.js"></script>
	<div class="cart">
        <div class="container">
            <div class="card shopping-cart" style="border-color: black;">
                <div class="card-header bg-dark text-light">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                    Cart
                    <a href="list" class="btn btn-outline-info btn-sm pull-right">Continue shopping</a>
                </div>
                
                <div class="card-body">
                    <hr>
                    <c:forEach items="${order.items}" var="cartItem">
	                    <div class="row">
	                        <div class="col-12 col-sm-12 col-md-2 text-center">
	                            <img class="img-responsive" src="${cartItem.product.src}" alt="prewiew" height="80">
	                        </div>
	                        <div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
	                            <h4 class="product-name"><strong>${cartItem.product.name}</strong></h4>
	                            <h4>
	                                <small>ID: ${cartItem.product.id}</small>
	                            </h4>
	                        </div>
	                        <div class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
	                            <div class="col-3 col-sm-3 col-md-6 text-md-right" style="padding-top: 5px">
	                                <h6><strong>$${cartItem.price}</strong></h6>
	                            </div>
	                            <div class="col-4 col-sm-4 col-md-4">
	                                <div class="quantity">
                                		<a href="cart?action=plus&id=${cartItem.product.id}">
                                			<input name="action" type="submit" value="+" class="plus">
                                		</a>
	                                    <input type="number" step="1" max="99" min="1" value="${cartItem.quantity}" title="Qty" class="qty"
                                           size="4" readonly style="cursor: default;">
                                        <c:if test="${cartItem.quantity > 1}">
                                        <a href="cart?action=minus&id=${cartItem.product.id}">
                                        	<input name="action" type="submit" value="-" class="minus">
                                        </a>
                                        </c:if>
	                                </div>
	                            </div>
	                            <div class="col-2 col-sm-2 col-md-2 text-right">
	                                <a href="cart?action=delete&id=${cartItem.product.id}" type="button" class="btn btn-outline-danger btn-xs">
	                                	<i class="fa fa-trash" aria-hidden="true"></i>
	                                </a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr>
                    </c:forEach>
                </div>
				<p class="text-danger" style="text-align: center;">${mess}</p>
                <div class="card-footer">
                	<div class="coupon col-md-5 col-sm-5 no-padding-left pull-left">
	                    <div class="row">
	                        <form id="form" class="col-6" action="pay"> 
	                            <input name="discount" type="text" class="form-control" placeholder="Discount code" maxlength="6" style="margin-top: 8px;">
	                        </form>
	                    </div>
	                </div>
                    <div class="pull-right" style="margin: 10px">
                        <a class="btn btn-success pull-right" style="margin-left: 12px; color: white;" onclick="submit()">Checkout</a>
                        <div class="pull-right" style="margin: 5px">
                        	<c:if test="${order != null}">
                        		Total price: <b>$${total}</b>
                        	</c:if>
                        	<c:if test="${order == null}">
                        		Total price: <b>$0.00</b>
                        	</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function submit() {
            var form = document.getElementById("form");
            if (form.checkValidity()) {
                form.submit();
              } else {
                form.reportValidity();
              }
        }
    </script>
</body>
</html>