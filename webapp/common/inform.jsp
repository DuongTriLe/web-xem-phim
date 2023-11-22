<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>


<div class="row">
	<div class="col">
		<c:if test="${not empty MESSAGE }">
			<div class="alert alert-success">
				<strong>${MESSAGE }</strong>
			</div>
		</c:if>
		<c:if test="${not empty ERROR }">
			<div class="alert alert-danger">
				<strong>${ERROR }</strong>
			</div>
		</c:if>
	</div>
</div>