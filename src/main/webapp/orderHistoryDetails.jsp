<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="header.jsp">
	<c:param name="title" value="Order history"></c:param>
</c:import>

<div class="container">
	<table>
        <thead>
            <tr>
                <th>Product Id</th>
                <th>Product Image</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${listItems}" var="item" varStatus="status">
	        	<tr>
	                <td>${item.productId}</td>
	                <td>
	                	<img src="${item.product.src}" alt="item" width="20%">
	                </td>
	                <td>${item.product.name}</td>
	                <td>${item.quantity}</td>
	                <td>$${item.price}</td>
	                <c:if test="${status.index == 0}">
		                <td rowspan="${listItems.size()}">$${total}</td>
		                <td rowspan="${listItems.size()}">
		                	<a href="history">Back</a>
		                </td>
	                </c:if>
	            </tr>
        	</c:forEach>
        </tbody>
    </table>
</div>
        
<c:import url="footer.jsp"></c:import>
        
        