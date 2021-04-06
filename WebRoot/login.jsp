<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>欢迎使用</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    <script type="text/javascript" src="<%=path %>/commutil.js"></script>
    <STYLE type=text/css>
BODY {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
TD {
	FONT-SIZE: 12px; COLOR: #ffffff; FONT-FAMILY: 宋体
}
</STYLE>
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        
		<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }
			 var New=document.getElementsByName("select");  
	 var strNew;
     for(var i=0;i<New.length;i++)
        {
          if(New.item(i).checked)
          {
             strNew=New.item(i).getAttribute("value");
             break;
          }
        else
        {
           continue;
         }
       }        
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,strNew,callback);
		}
		
		function callback(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		    
		}
	    </script>
  </head>
  <body>
   <FORM name="ThisForm" action="<%=path %>/adminLogin.action" method=post>
<DIV>&nbsp;&nbsp; </DIV>
<DIV>
<TABLE cellSpacing=0 cellPadding=0 width=900 align=center border=0>
  <TBODY>

  <TR>
    <TD background="img/login_2.jpg" height=300>
      <TABLE height=300 cellPadding=0 width=900 border=0>
        <TBODY>
        <TR>
          <TD colSpan=2 height=35></TD></TR>
        <TR>
          <TD width=360></TD>
          <TD>
            <TABLE cellSpacing=0 cellPadding=2 border=0>
              <TBODY>
              <TR>
                <TD style="HEIGHT: 28px" width=80>登 录 名：</TD>
                <TD style="HEIGHT: 28px" width=150><INPUT id=userName 
                  style="WIDTH: 130px" name=userName></TD>
                <TD style="HEIGHT: 28px" width=370></TD></TR>
              <TR>
                <TD style="HEIGHT: 28px">登录密码：</TD>
                <TD style="HEIGHT: 28px"><INPUT id=userPw style="WIDTH: 130px" 
                  type=password name=userPw></TD>
                <TD style="HEIGHT: 28px"></TD></TR>
  
              <TR>
                <TD style="HEIGHT: 18px"></TD>
                <TD style="HEIGHT: 18px" width=200>
                <input id="Radio3" type="radio" CHECKED value="1" name="select"/>普通管理员
    <input id="Radio2" type="radio"  value="0" name="select"/>超级管理员
                </TD>
                <TD style="HEIGHT: 18px"></TD></TR>
              <TR>
                <TD></TD>
                <TD> <input name="button" type="button" class="button" id="Submit" value="登 陆" onClick="check1()"> 
                                <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
              </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD><IMG src="img/login_3.jpg" 
border=0></TD></TR></TBODY></TABLE></DIV>
</form>
  </body>
</html>
