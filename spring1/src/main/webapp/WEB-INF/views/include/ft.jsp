<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path3" value="${pageContext.request.contextPath }" />
<!-- 푸터 내용 기술 -->
    <div class="ft-wrap">
    	<nav class="footer container clr-fix">
    		<ul class="menu">
    			<li><a href="${path3 }/member/privacy.do">저작권안내</a></li>
    			<li><a href="${path3 }/member/policy.do">개인정보 처리방침</a></li>
    			<li><a href="${path3 }/member/term.do">이용약관</a></li>
    			<li><a href="${path3 }/member/storeFind.do">매장찾기</a></li>
    			<li><a href="${path3 }/member/recruit.do">인재채용</a></li>
    		</ul>
    	</nav>
    	<hr style="background-color:#ddd; height:3px; margin:0px auto; padding:0px; ">
        <div class="footer container clr-fix">
            <p class="copyright">
				<span class="ft_col">(주)현대자동차</span> 
				<span class="ft_col">고객센터 : 080-600-6000</span>
				<span class="ft_col">개인정보관리책임자: <strong><a href="mailto:admin@hyundaioffice.co.kr" title="관리자에게 메일 보내기">관리자(admin@hyundaioffice.co.kr)</a></strong></span><br>
				<span class="ft_col">COPYRIGHT ⓒ HYUNDAI MOTOR COMPANY. ALL RIGHTS RESERVED.</span>
            </p>
        </div>
    </div>