<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="header.jsp">
	<c:param name="title" value="${product.name}" ></c:param>
</c:import>

<div class="grid content__menu">
    <h2 class="info__heading">${product.name}</h2>
    <div class="info__line"></div>
    <div class="info__product">
        <div class="product__img">
            <img src="${product.src}" alt="item">
        </div>
        <div class="product__detail">
            <p class="item__price--able">$${product.price}</p>
            <p class="product__desc">${product.description}</p>
            <a href="cart?id=${product.id}&action=plus" class="product__add">Thêm vào giỏ hàng</a>
        </div>
    </div>
</div>

<c:import url="footer.jsp"></c:import>