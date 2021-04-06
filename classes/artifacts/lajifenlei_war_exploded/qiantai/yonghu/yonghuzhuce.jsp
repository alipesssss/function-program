<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
    <script type="text/javascript">
    	function check()
    	{
    		
    		 if(document.formAdd.zhanghao.value=="")
		        {
		            alert("请输入账号");
		            return false;
		        }
		        if(document.formAdd.mima.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		       if(document.formAdd.mima1.value=="")
		        {
		            alert("请输入确认密码");
		            return false;
		        }
		        if(document.formAdd.mima1.value!=document.formAdd.mima.value)
		        {
		            alert("两次输入的密码必须一致");
		            return false;
		        }
		        if(document.formAdd.xingming.value=="")
		        {
		            alert("请输入姓名");
		            return false;
		        }
		         if(document.formAdd.dianhua.value=="")
		        {
		            alert("请输入联系电话");
		            return false;
		        }
		         if(document.formAdd.weixin.value=="")
		        {
		            alert("请输入微信号码");
		            return false;
		        }
    		document.formAdd.submit();
    	}
    	
    
function ValidateValue(textbox) {
		var IllegalString = "[`~!%#$^&amp;*()=|{}':;',\\[\\].&lt;>/?~！#￥……&amp;*（）——|{}【】‘；：”“'。，、？]‘’";
		var textboxvalue = textbox.value;
		var index = textboxvalue.length - 1;
	
		var s = textbox.value.charAt(index);
	
		if (IllegalString.indexOf(s) >= 0) {
			s = textboxvalue.substring(0, index);
			textbox.value = s;
		}
 
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
						<div class="BoxHeader-center MarginTop10">用户注册</div>
					</div>
					<div class="Slot">
                <form name="formAdd" method="post" action="<%=path %>/user?type=userReg">
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                   用户账号：<input style="width: 200px;" maxlength="20" onkeyup="ValidateValue(this)"  name="zhanghao" type="text" />
                                                   
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                  登录密码：<input style="width: 200px;" name="mima"  maxlength="20"   type="password" />
                                       </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                  <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                                                   确认密码：<input style="width: 200px;"  maxlength="20"  name="mima1" type="password" />
                                                </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                     <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                                                 用户姓名：<input style="width: 200px;" name="xingming" type="text" />
                                                </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div>
                                         <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                                                联系电话：<input style="width: 200px;" name="dianhua" type="text" />
                                                </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div> 
                                  </div>
                                             <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 5px;">
                                                                               微信号码：<input style="width: 200px;" name="weixin" type="text" />
                                                </div>
                                       <div class="f-right"></div>
                                       <div class="clear"></div>
                                  </div> 
                                    <div class="c1-bline" style="padding:7px 0px;">
                                       <div class="f-left" style="margin-left: 100px;">
                                        <input type="button" value="注册"  onclick="check()" style="width: 100px;height: 24px;"/>
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