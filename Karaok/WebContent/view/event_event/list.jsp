<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Custom Tabs -->
<div class="nav-tabs-custom">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#tab_1" data-toggle="tab">전체 이벤트</a></li>
		<li><a href="#tab_2" data-toggle="tab">진행중인 이벤트</a></li>
		<li><a href="#tab_3" data-toggle="tab">종료된 이벤트</a></li>

		<li class="pull-right"><a href="#" class="text-muted"><i
				class="fa fa-gear"></i></a></li>
	</ul>
	<br>
	<div class="tab-content">
		<div class="tab-pane active" id="tab_1">
			<!-------- tab1 자리 --------->
			<c:forEach items="${listIng }" var="ing">
				<div class="container">
					<div class="row" style="outline-color: blue;">

						<div class="col-lg-7 col-md-7">
							<a href=""> <img width="600" height="250"
								src="./img/${ing.fileName}" alt="">
							</a>
						</div>

						<div class="col-lg-5 col-md-4" align="left">
							<h4>
								<span class="label label-danger">진행중</span>
							</h4>
							<h1>${ing.subject }</h1>
							<h4>기간: ${ing.startDate} ~ ${ing.endDate }</h4>
							<p>${ing.point }</p>
							<!--<a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>  -->
						</div>
					</div>

					<hr>
				</div>
			</c:forEach>
			<c:forEach items="${listEnd }" var="end">
				<div class="container">
					<div class="row" style="outline-color: blue;">

						<div class="col-lg-7 col-md-7">
							<a href=""> <img width="600" height="250"
								src="./img/${end.fileName}" alt="">
							</a>
						</div>

						<div class="col-lg-5 col-md-4" align="left">
							<h4>
								<span class="label label-default">종료</span>
							</h4>
							<h1>${end.subject }</h1>
							<h4>기간: ${end.startDate} ~ ${end.endDate }</h4>
							<p>${end.point }</p>
							<!--<a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>  -->
						</div>
					</div>

					<hr>
				</div>
			</c:forEach>
			
			<!-- /.container -->
		</div>

		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_2">
			<!-------- tab2 자리 --------->
			<c:forEach items="${listIng }" var="ing">
				<div class="container">
					<div class="row" style="outline-color: blue;">

						<div class="col-lg-7 col-md-7">
							<a href=""> <img width="600" height="250"
								src="./img/${ing.fileName}" alt="">
							</a>
						</div>

						<div class="col-lg-5 col-md-4" align="left">
							<h4>
								<span class="label label-danger">진행중</span>
							</h4>
							<h1>${ing.subject }</h1>
							<h4>기간: ${ing.startDate} ~ ${ing.endDate }</h4>
							<p>${ing.point }</p>
							<!--<a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>  -->
						</div>
					</div>

					<hr>
				</div>
			</c:forEach>
		</div>
		<!-- /.tab-pane -->
		<div class="tab-pane" id="tab_3">
			<!-------- tab3 자리 --------->
			<c:forEach items="${listEnd }" var="end">
				<div class="container">
					<div class="row" style="outline-color: blue;">

						<div class="col-lg-7 col-md-7">
							<a href=""> <img width="600" height="250"
								src="./img/${end.fileName}" alt="">
							</a>
						</div>

						<div class="col-lg-5 col-md-4" align="left">
							<h4>
								<span class="label label-default">종료</span>
							</h4>
							<h1>${end.subject }</h1>
							<h4>기간: ${end.startDate} ~ ${end.endDate }</h4>
							<p>${end.point }</p>
							<!--<a class="btn btn-primary" href="#">View Project <span class="glyphicon glyphicon-chevron-right"></span></a>  -->
						</div>
					</div>

					<hr>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<div align="center">
<form action="./event_create.ok">
	<input class="btn btn-warning" type="submit" value="글등록">
</form>



</div>











