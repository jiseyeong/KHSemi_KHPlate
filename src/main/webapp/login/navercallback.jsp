<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버 로그인</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  </head>
  
  <body>
  <!-- <%
    String clientId = "YOUR_CLIENT_ID";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "YOUR_CLIENT_SECRET";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("YOUR_CALLBACK_URL", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
        + "&client_id=" + clientId
        + "&client_secret=" + clientSecret
        + "&redirect_uri=" + redirectURI
        + "&code=" + code
        + "&state=" + state;
    String accessToken = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuilder res = new StringBuilder();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if (responseCode == 200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      // Exception 로깅
    }
  %> -->
  
  	           <div id="naverIdLogin">
	           		<a id="naverIdLogin_loginButton" href="#null">
	           			<img src="https://static.nid.naver.com/oauth/big_g.PNG" width=320>
	           		</a>
	           </div>
  <script>
	const naverLogin = new naver.LoginWithNaverId(
	        {
	            clientId: "Mm9YQgxstdSEuf5xt0jg",
	            callbackUrl: "http://localhost/login/navercallback.jsp",
	            loginButton: {color: "green", type: 2, height: 40},
	            isPopup: false,
	    	    callbackHandle: true
	        }
	    );
	    naverLogin.init();
	$.ajax({
		url : "/loginByNaver.members",
		type : "post",
		data : {
			naverid : naverLogin.user.id
		}
	}).done(function(resp) {
		if (resp == "1") {
			alert("첫 회원은 회원가입 절차가 필요합니다.");
			let id = naverLogin.user.id;
			location.href="/joinform/joinformWithLoginAPI.jsp?naverid="+id;
		} else if(resp == "2"){
			alert("이메일 인증이 되지 않았습니다.");
			location.reload();
		} else {
			alert("로그인 되었습니다.");
			location.href = "/page/main.jsp";
		}
	})
  </script>
  </body>
</html>
