<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <title></title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	
	<link href="<%=path %>/css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<%=path %>/css/sitegeneric08.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
 <script language="javascript">
            function check()
            {
                 var userPwReal="${sessionScope.user.mima}";
                 if(document.formPw.userPw.value !=userPwReal)
                 {
                     alert("原密码不正确");
                     return ;
                 }
                 
                 if(document.formPw.userPw1.value =="")
                 {
                     alert("新密码不能空");
                     return ;
                 }
                 if(document.formPw.userPw1.value != document.formPw.userPw2.value)
                 {
                     alert("两次输入的密码不一致");
                     return ;
                 }
                 document.getElementById("indicator").style.display="block";
                 loginService.yonghuPwEdit(document.formPw.userPw1.value,callback5);
            }
            function callback5(data)
            {
            document.getElementById("indicator").style.display="none";
                alert("修改成功");
            }
        </script>
    
    
 
  </head>
  
<body>
<!-- head如果图片高度不合适。请修改Common.ces里面的".Header .HeaderTop"的高度。和".Header"的高度-->
<jsp:include flush="true" page="/qiantai/inc/incTop.jsp"></jsp:include>    
<!-- head-->	
	
	
	
	
<!--body-->
<div align="center" class="Wrapper">
<div id="MainCenter" align="center" class="MainCenter">
	     <div id="navigation" class="naivgation">
			 <jsp:include flush="true" page="/qiantai/inc/incLeft.jsp"></jsp:include> 
		 </div>
		 <div id="content" class="Sub">
				<div class="NewContainer770">
					<div class="BoxHeader">
						<div class="BoxHeader-center MarginTop10">修改登陆密码</div>
					</div>
					<div class="Slot">
                <form name="formPw" method="post" action="<%=path %>/user?type=userReg">
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                   原密码： <input type="password" name="userPw" id="userPw" style="width: 200px;"/>
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                  登录密码：<input style="width: 200px;" name="userPw1" type="password" />
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                                                   确认密码：<input style="width: 200px;" name="userPw2" type="password" />
                                                </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                          
                                    <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 100px;">
   
                                        <input type="button" value="修改" style="width: 100px;height: 24px;" onclick="check()"/>
                                         <img id="indicator" src="<%=path %>/img/loading.gif" alt="Loading..." style="display:none"/>
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                  </form>
                                  
                                  			</div>
				</div>
		 </div>
</div>
</div>
<!--body-->
	
	
	
<!--foot -->	
<div align="center" class="Wrapper">
	<div id="footer" align="center" class="Footer">
		 <jsp:include flush="true" page="/qiantai/inc/incFoot.jsp"></jsp:include>
	</div>
</div>
<!--foot -->	
</body>
</html>