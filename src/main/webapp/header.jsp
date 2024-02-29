<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/base.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/infoProduct.css">
<link rel="stylesheet" type="text/css" href="css/orderHistory.css">
<link rel="stylesheet" type="text/css" href="css/responsive.css">
<link rel="stylesheet" href="fonts/fontawesome-free-6.1.1-web/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="https://www.freeiconspng.com/thumbs/phone-icon/office-phone-icon--25.png">
<title>${param.title}</title>
</head>
<body>
<header class="header">
    <nav class="header__nav">
        <div class="grid flex">
            <ul class="header__navbar">
                <li class="header__nav-item">
                    <a class="header__nav-link" href="list">Trang chủ</a>
                </li>
                <li class="header__nav-item header__nav-item--have-dropdown">
                    <a class="header__nav-link" href="#">Danh mục sản phẩm</a>
                    <ul class="header__dropdown-menu">
                        <li class="header__dropdown-item">
                            <a class="header__dropdown-item-link" href="search?txt=iphone">Iphone</a>
                        </li>
                        <li class="header__dropdown-item">
                            <a class="header__dropdown-item-link" href="search?txt=samsung">Samsung</a>
                        </li>
                        <li class="header__dropdown-item">
                            <a class="header__dropdown-item-link" href="search?txt=xiaomi">Xiaomi</a>
                        </li>
                        <li class="header__dropdown-item">
                            <a class="header__dropdown-item-link" href="search?txt=huawei">Huawei</a>
                        </li>
                        <li class="header__dropdown-item">
                            <a class="header__dropdown-item-link" href="search?txt=oppo">Oppo</a>
                        </li>
                    </ul>
                </li>
                <li class="header__nav-item">
                    <a class="header__nav-link" href="#">Về chúng tôi</a>
                </li>
                <li class="header__nav-item">
                    <a class="header__nav-link" href="#">Liên hệ</a>
                </li>
            </ul>
            <ul class="header__utility">
                <li class="header__nav-item header__nav-item--have-dropdown">
                    <a class="header__icon-link" href="${sessionScope.acc == null ? 'login.jsp' : '#'}">
                        <i class="fa-solid fa-user" style="margin-right: 4px;"></i>
                        <c:if test="${sessionScope.acc == null}">
                        Đăng nhập
                        </c:if>
                        <c:if test="${sessionScope.acc != null}">
                        ${sessionScope.acc.email}
                        </c:if>
                    </a>
                    <c:if test="${sessionScope.acc != null}">
                    <ul class="header__dropdown-menu-icon">
                        <li class="header__dropdown-item">
                            <a class="header__dropdown-item-link" href="history">Lịch sử đơn hàng</a>
                        </li>
                        <li class="header__dropdown-item">
                            <a class="header__dropdown-item-link" href="logout">Đăng xuất</a>
                        </li>
                    </ul>
                    </c:if>
                </li>
                <li class="header__nav-item">
                    <a class="header__icon-link header__cart-link" href="cart">
                        <i class="fa-solid fa-cart-shopping"></i>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="header__search">
        <div class="grid header__search-flex">
            <div class="header__logo">
                <a href="list">
                    <img src="img/logo.png" alt="logo" width="215px">
                </a>
            </div>

            <div class="header__search-bar">
                <form action="search" method="get">
                    <input name="txt" value="${txtSearch}" type="text" class="header__search-input" placeholder="Bạn đang tìm gì?">
                    <button type="submit" class="header__search-button">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>

            <div class="header__adv">
                <div class="header__adv-item">
                    <i class="header__adv-icon fa-solid fa-sack-dollar"></i>
                    <div>Giá tốt nhất <br> thị trường</div>
                </div>

                <div class="header__adv-item">
                    <i class="header__adv-icon fa-solid fa-circle-check"></i>
                    <div>Bảo hành <br> chính hãng</div>
                </div>

                <div class="header__adv-item">
                    <i class="header__adv-icon fa-solid fa-truck-fast"></i>
                    <div>Giao hàng <br> toàn quốc</div>
                </div>
            </div>
        </div>
	</div>
</header>