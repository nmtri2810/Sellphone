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
                <th>Order Id</th>
                <th>Order Date</th>
                <th>Status</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach items="${list}" var="order">
	        	<tr>
	                <td>${order.orderId}</td>
	                <td>${order.orderDate}</td>
	                <td>${order.status == 0 ? "Pending" : ""}</td>
	                <td>
	                    <a href="historyDetail?orderId=${order.orderId}">Click here</a>
	                </td>
	            </tr>
        	</c:forEach>
        </tbody>
    </table>
</div>
        
<c:import url="footer.jsp"></c:import>
        
        