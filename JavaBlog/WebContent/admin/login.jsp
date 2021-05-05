<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="admin-base.jsp"></jsp:include>
		<title>Login</title>
		<link rel="stylesheet" type="text/css" href="admin/css/admin.css">
		<link rel="stylesheet" type="text/css" href="admin/css/login.css">
		<script type="text/javascript" src="admin/js/admin.js"></script>
		<script type="text/javascript" src="admin/js/login.js"></script>
	</head>
	<body>
		<div id="container">
			<div id="loginframe">
				<div id="logintitle">
					Login
				</div>
				<form action="" id="form" method="post">
					<div class="loginrow">
						<div class="loginlabel">
							Username
						</div>
						<div class="loginfield">
							<input type="text" id="nametext"/>
						</div>
					</div>
					<div id="passwordrow" class="loginrow">
						<div class="loginlabel">
							Password
						</div>
						<div class="loginfield">
							<input type="password" id="pswdtext"/>
						</div>
					</div>
					<div id="emailrow" class="loginrow">
                        <div class="loginlabel">
                            Email
                        </div>
                        <div class="loginfield">
                            <input type="text" id="emailtext"/>
                        </div>
                    </div>
					<div class="loginrow">
						<div class="loginlabel">
							Code
							<img id="veryimg" title="Click to refresh" onclick="changeCode(this.id)" src="admin/VerifyImage" />
						</div>
						<div class="loginfield">
							<input type="text" id="codetext"/>
						</div>
					</div>
					<div class="loginrow">
						<div id="result" class="loginlabel">
						</div>
						<div class="loginfield">
						    <input type="hidden" id="type" value="login"/>
							<input class="button" id="submit" onclick="return checkLogin()" type="submit" value="Submit" />
							<input class="button" type="reset" value="Reset" />
						</div>
					</div>
				</form>
			</div>
			<div id="linktab">
                <a id="loginLink" class="tab" href="javascript:void(0)" onclick="changeTab(this, 'login')">Login</a>
                <a id="registerLink" class="tab" href="javascript:void(0)" onclick="changeTab(this, 'register')">Register</a>
                <a id="findPasswordLink" class="tab" href="javascript:void(0)" onclick="changeTab(this, 'findpassword')">Find password</a>
            </div>
		</div>
	</body>
</html>
