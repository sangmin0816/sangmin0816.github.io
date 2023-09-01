<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<header class="header_section">
    <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="${rootPath}">
            <span>SamSam</span>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav  mx-auto ">
                    <li class="nav-item">
                        <a class="nav-link" href="${rootPath}">Home</a>
                    </li>
                    <li class="dropdown dropdown-slide">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">그로우앤조이북 소개 <i class="fas fa-sort-down" style="vertical-align: 0.125em!important;"></i></a>
                        <div class="dropdown-menu">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li><a href="${rootPath}/product/introduce.jsp">회사소개</a></li>
                                        <li><a href="${rootPath}/product/map.jsp">오시는길</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="dropdown dropdown-slide">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">도서 <i class="fas fa-sort-down" style="vertical-align: 0.125em!important;"></i></a>
                        <div class="dropdown-menu">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li><a href="${rootPath }/BookList.do?category=*">전체</a></li>
                                        <li><a href="${rootPath }/BookList.do?category=A">초등</a></li>
                                        <li><a href="${rootPath }/BookList.do?category=B">중등</a></li>
                                        <li><a href="${rootPath }/BookList.do?category=C">고등</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="dropdown dropdown-slide">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="350" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티 <i class="fas fa-sort-down" style="vertical-align: 0.125em!important;"></i></a>
                        <div class="dropdown-menu">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 mb-sm-3">
                                    <ul>
                                        <li><a href="${rootPath}/NoticeList.do">공지사항</a></li>
                                        <li><a href="${rootPath}/QnaList.do">묻고답하기</a></li>
                                        <li><a href="${rootPath }/Archive.do">학습자료실</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="user_option">
                    <ul class="top-menu text-right list-inline">
                        <c:choose>
                            <c:when test="${empty session_id}">
                                <li><a href="${rootPath }/member/login.jsp">로그인</a></li>
                                <li><a href="${rootPath }/member/term.jsp">회원가입</a></li>
                            </c:when>
                            <c:when test="${session_id eq 'admin'}">
                                <li><a href="${rootPath }/Logout.do">로그아웃</a></li>
                                <li><a href="${rootPath }/MemberListAdmin.do">관리자</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${rootPath }/Logout.do">로그아웃</a></li>
                                <li><a href="${rootPath }/CartList.do">장바구니</a></li>
                                <li><a href="${rootPath }/PayList.do">결제 내역</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>








<section class="top-header">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-xs-12 col-sm-4">
                <div class="contact-number">
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- Site Logo -->
                <div class="logo text-center">
                    <a href="${rootPath }/">
                        <img src="${rootPath }/images/common/icon_48.png" alt="그로우앤조이북">
                        그로우앤조이북
                    </a>
                </div>
            </div>
            <div class="col-md-4 col-xs-12 col-sm-4">
                <!-- Cart -->

            </div>
        </div>
    </div>
</section>
