<%--
  Created by IntelliJ IDEA.
  User: ldy
  Date: 2016/11/4
  Time: 下午4:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String name = (String) request.getAttribute("name");
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>${name}</title>
    <script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/global.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/frame.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/eject.js"></script>
    <link href="<%=path%>/ui/css/bootstrap/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/iconfont.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/modular/global.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/modular.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/frame.css" rel="stylesheet" type="text/css"/>
    <%@ include file="../common/timezone.jsp" %>
</head>
<body>
    <div class="wrapper-big"><!--包含除底部外的所有层-->
        <nav class="wap-second-nav">
            <ul>
                <%--<a href="javascript:"><i class="icon iconfont left" id="leftRe">&#xe626;</i></a>--%>
                <li>${name}</li>
            </ul>

        </nav>

        <section class="index-wrapper ">
            <section class="tij-cg">
                <ul>
                    <li><i class="icon iconfont">&#xe612;</i></li>
                    <li class="word">${name}<spring:message code="safe.safesuccess.word_li"/></li>
                    <li><span class="red" id="spanTime">5s</span><spring:message code="safe.safesuccess.red_span"/><a href="javascript:void (0)" onclick="goLogin()"><spring:message code="safe.safesuccess.red_a"/></a></li>
                </ul>
            </section>
        </section>
    </div>

    <%--底部視圖--%>
    <jsp:include page="/jsp/common/bottom.jsp" flush="true"/>

</body>
</html>
<script>

    function goLogin() {
        var tourl = "<%=path%>/safe/safe";
        window.location.href=tourl;
    }

    var wait = 4;
    var timer = setInterval(function(){
        if(wait==0){
            wait = 5;
            goLogin();
            return;
        }
        $("#spanTime").html(wait+"s");
        wait--;
    },1000);
</script>