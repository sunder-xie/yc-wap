<%--
  Created by IntelliJ IDEA.
  User: ldy
  Date: 2016/11/9
  Time: 下午9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>账户余额</title>
    <script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/global.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/frame.js"></script>
    <script type="text/javascript" src="<%=path%>/js/modular/eject.js"></script>
    <link href="<%=path%>/ui/css/bootstrap/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/iconfont.css" rel="stylesheet" type="text/css">
    <link href="<%=path%>/ui/css/modular/global.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/modular.css" rel="stylesheet" type="text/css"/>
    <link href="<%=path%>/ui/css/modular/frame.css" rel="stylesheet" type="text/css"/>

</head>
<body>
    <div class="wrapper-big"><!--包含除底部外的所有层-->
        <nav class="wap-second-nav">
            <ul>
                <a href="javascript:" onclick="retLeft()"><i class="icon iconfont left">&#xe626;</i></a>
                <li>账户余额</li>
                <a href="javascript:" id="nav-list"><i class="icon iconfont right">&#xe629;</i></a>
            </ul>
            <div class="pop-nav">
                <ul>
                    <li>
                        <a href="#">译云首页</a>|
                        <a href="#">个人中心</a>|
                        <a href="#">我的订单</a>|
                        <a href="#">安全退出</a>
                    </li>
                </ul>
            </div>
        </nav>
        <section class="form-big">
            <div class="balance">
                账户余额:<span>12331.34元</span>
            </div>
            <div class="wap-btn"><a href="#" onclick="toRecharge()"  class="btn submit-btn btn-blue">充值</a></div>
            <div class="balance-word">账户余额是在译云账户中的款项，下单时可以直接用于支付订单。</div>
        </section>
    </div>

    <%--底部視圖--%>
    <jsp:include page="/jsp/common/bottom.jsp" flush="true"/>

</body>
</html>
<script>
    function toRecharge(){
        var tourl = "<%=path%>/account/recharge";
        window.location.href=tourl;
    }
    function retLeft() {
        window.history.go(-1);
    }
</script>