<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="header.jsp">
	<c:param name="title" value="Sellphone" ></c:param>
</c:import>

<%
    if (request.getAttribute("redirected") == null) {
        response.sendRedirect("list");
    }
%>

<div class="grid content__menu">    
	<div class="row">
        <c:forEach items="${allProducts}" var="product">
	     	<div class="content__item">
	             <div class="item__image">
	                 <a href="info?id=${product.id}">
	                     <img src="${product.src}" alt="item">
	                 </a>
	                 <span class="hot">${product.type}</span>
	                 <a href="cart?id=${product.id}&action=plus" class="add__cart">
	                     <i class="fa-solid fa-cart-shopping"></i> Mua hàng
	                 </a>
	             </div>
	
	             <div class="item__name">
	                 <a href="info?id=${product.id}">${product.name}</a>
	             </div>
	
	             <div class="item__price">
	                 <p class="item__price--able">$${product.price}</p>
	             </div>
	         </div>
    	</c:forEach>
    </div>
    
	<div class="pagination">
		<c:if test="${tag > 1}">
			<a href="list?index=${tag-1}">&laquo;</a>
		</c:if>
		<c:forEach begin="1" end="${endPage}" var="i">
			<a href="list?index=${i}" class='${tag == i ? "active" : ""}'>${i}</a>
		</c:forEach>
		<c:if test="${tag < endPage}">
			<a href="list?index=${tag+1}">&raquo;</a>
		</c:if>
		<c:if test="${tagSearch > 1}">
			<a href="search?index=${tagSearch-1}&txt=${txtSearch}">&laquo;</a>
		</c:if>
		<c:forEach begin="1" end="${endPageSearch}" var="i">
			<a href="search?index=${i}&txt=${txtSearch}" class='${tagSearch == i ? "active" : ""}'>${i}</a>
		</c:forEach>
		<c:if test="${tagSearch < endPageSearch}">
			<a href="search?index=${tagSearch+1}&txt=${txtSearch}">&raquo;</a>
		</c:if>
	</div>
	
	<c:if test="${allProducts == null}">
		<div class="not-exist">
			<h2>Không tìm thấy sản phẩm, vui lòng thử lại!</h2>
		</div>
	</c:if>
	
</div>

<c:import url="footer.jsp"></c:import>
        
        