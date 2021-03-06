<%--
  Created by IntelliJ IDEA.
  User: ldy
  Date: 2016/11/10
  Time: 上午11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
    String path = request.getContextPath();
    String isLogin = (String) session.getAttribute("isLogin");
%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title><spring:message code="feedback.title"/></title>
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
        <%--头部--%>
        <spring:message code="feedback.title" var="title"/>
        <jsp:include page="/jsp/common/pophead.jsp" flush="true">
            <jsp:param name="Title" value="${title}"/>
            <jsp:param name="BackTo" value="javascript:window.history.go(-1)"/>
        </jsp:include>

        <section class="feedback">
            <ul>
                <li class="one">
                    <p><spring:message code="feedback.questiontype"/></p>
                    <p class="right">
                        <select class="select feedback-select" id="selectVal">
                            <option><spring:message code="feedback.wapSuggest"/></option>
                            <option><spring:message code="feedback.guzhang"/></option>
                            <option><spring:message code="feedback.zixunBangzhu"/></option>
                        </select>
                    </p>
                </li>
                <li><textarea class="textarea feedback-textarea" id="questionText"></textarea></li>
                <li class="tow">
                    <p><spring:message code="feedback.phone"/></p>
                    <p><input class="input phone-input" id="phone"></p>
                    <label id="errorTip"></label>
                </li>
            </ul>
        </section>
    </div>
    <section class="add-btn big-add-btn">
        <p><spring:message code="feedback.zixun"/></p>
        <a href="javascript:void (0)" onclick="checkAction()" class="btn submit-btn btn-blue" ><spring:message code="feedback.submit"/></a>
    </section>

    <%--loading--%>
    <%--<jsp:include page="/jsp/common/loading.jsp" flush="true"/>--%>
</body>
</html>
<script>

    function checkAction(){
        var selectVal = $("#selectVal").val();
        var questionText = $("#questionText").val();
        var phone = $("#phone").val();
        if (questionText == "" || questionText == null){
            $("#errorTip").html("<spring:message code="feedback.textError"/>");

            return;
        }else {
            $("#errorTip").html("");
        }
        if (phone == "" || phone == null){
            $("#errorTip").html("<spring:message code="feedback.phoneNull"/>");
            return;
        }else {
            $("#errorTip").html("");
        }
        var t = /^[0-9]*$/;
        if(!t.test(phone)){
            $("#errorTip").html("<spring:message code="feedback.phoneError"/>");
            return;
        }else {
            $("#errorTip").html("");
        }
        goSubmit(questionText,phone,selectVal);
    }
    function goSubmit(text,phone,selectVal){
        $.ajax({
            async: true,
            type: "POST",
            url: "<%=path%>/feedback/submitfeedback",
            modal: true,
            showBusi: false,
            timeout: 30000,
            data: {
                text:text,
                phone:phone,
                type:selectVal
            },
            success: function (data) {
                if (data.status == 1) {
                    window.location.href = '<%=path%>/feedbacksuccess';
                } else {

                }
            },
            error: function () {
            },
            beforeSend: function () {
//                Loading.ShowLoading();
            },
            complete: function () {
//                Loading.HideLoading();
            }
        });
    }
</script>