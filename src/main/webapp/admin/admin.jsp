<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/base.css">
<link rel="stylesheet" type="text/css" href="../css/admin.css">
<link rel="stylesheet" href="../fonts/fontawesome-free-6.1.1-web/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<title>Admin Page</title>
</head>
<body>
	<div class="admin">
        <nav class="admin__sidebar">
            <a href="" class="admin__logo">ADMIN PAGE</a>
            <ul class="sidebar__nav">
                <li class="nav__item profile">
                    <div class="profile__container">
                        <div class="profile__infor">
                            <div class="profile__pic">
                                <img src="https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png?f=webp&w=256" alt="avatar" width="35px">
                                <span class="green-dot"></span>
                            </div>
                            <div>
                                <p class="profile__welcome">Welcome</p>
                                <p class="profile__name">${sessionScope.acc.email}</p>
                            </div>
                        </div>
                        <div class="profile__dropdown">
                            <i class="fa-solid fa-ellipsis-vertical"></i>
                            <div class="dropdown__menu">
                                <a class="dropdown__item" href="">
                                    <i class="fa-solid fa-gear green"></i>
                                    Settings
                                </a>
                                <div class="dropdown__divider"></div>
                                <a class="dropdown__item" href="/Asm3/logout">
                                    <i class="fa-solid fa-right-from-bracket red"></i>
                                    Log out
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="nav__item category">Navigation</li>
                <li class="nav__item menu__items active">
                    <a href="" class="nav__link">
                        <span class="link__icon purple">
                            <i class="fa-solid fa-gauge-simple-high"></i>
                        </span>
                        <span class="link__title">
                            Dashboard
                        </span>
                    </a>
                </li>
                <li class="nav__item menu__items">
                    <a href="" class="nav__link">
                        <span class="link__icon orange">
                            <i class="fa-solid fa-laptop"></i>
                        </span>
                        <span class="link__title">
                            Basic UI Elements
                        </span>
                    </a>
                </li>
                <li class="nav__item menu__items">
                    <a href="" class="nav__link">
                        <span class="link__icon red">
                            <i class="fa-solid fa-list"></i>                    
                        </span>
                        <span class="link__title">
                            Form Elements
                        </span>
                    </a>
                </li>
                <li class="nav__item menu__items">
                    <a href="" class="nav__link">
                        <span class="link__icon blue">
                            <i class="fa-solid fa-table-cells"></i>
                        </span>
                        <span class="link__title">
                            Tables
                        </span>
                    </a>
                </li>
                <li class="nav__item menu__items">
                    <a href="" class="nav__link">
                        <span class="link__icon green">
                            <i class="fa-solid fa-chart-simple"></i>
                        </span>
                        <span class="link__title">
                            Charts
                        </span>
                    </a>
                </li>
                <li class="nav__item menu__items">
                    <a href="" class="nav__link">
                        <span class="link__icon purple">
                            <i class="fa-solid fa-address-book"></i>
                        </span>
                        <span class="link__title">
                            Icons
                        </span>
                    </a>
                </li>
                <li class="nav__item menu__items">
                    <a href="" class="nav__link">
                        <span class="link__icon orange">
                            <i class="fa-solid fa-shield-halved"></i>
                        </span>
                        <span class="link__title">
                            User Pages
                        </span>
                    </a>
                </li>
                <li class="nav__item menu__items">
                    <a href="" class="nav__link">
                        <span class="link__icon red">
                            <i class="fa-solid fa-file"></i>
                        </span>
                        <span class="link__title">
                            Documentation
                        </span>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="admin__container">
            <div class="admin__img">
                <img src="https://doctech.com/wp-content/uploads/2022/04/businessman-cyber-lock.jpeg" alt="image" width="100%">
            </div>
            <div class="admin__main">
                <div class="card">
                        <table class="table">
                            <caption>Members of the team</caption>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Class</th>
                                <th>Project</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Member 1</td>
                                <td>Class 1</td>
                                <td>Project 1</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Member 2</td>
                                <td>Class 2</td>
                                <td>Project 2</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Member 3</td>
                                <td>Class 3</td>
                                <td>Project 3</td>
                            </tr>
                        </table>    
                </div>
            </div>
        </div>
    </div>
    <script>
        const userMenu = document.querySelector('.profile__dropdown')
        const dropdownContainer = document.querySelector('.dropdown__menu')

        userMenu.addEventListener('click', function() {
            if(!dropdownContainer.classList.contains('open')) {
                dropdownContainer.classList.add('open')
            } else {
                dropdownContainer.classList.remove('open')
            }
        })

        dropdownContainer.addEventListener('click', function(event) {
            event.stopPropagation()
        })
    </script>
</body>
</html>