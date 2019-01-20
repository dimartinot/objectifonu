<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head></head>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 360px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
#connection_button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #c81d25;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
}
#connection_button:hover {
  background: #F0454D;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #c81d25; /* fallback for old browsers */
  background: -webkit-linear-gradient(right, #F0454D, #c81d25);
  background: -moz-linear-gradient(right, #F0454D, #c81d25);
  background: -o-linear-gradient(right, #F0454D, #c81d25);
  background: linear-gradient(to left, #F0454D, #c81d25);
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
</style>
<body>
<% if (request.getParameter("error") != null) {  %>
	<div th:if="${param.error}">
		Mot de passe ou nom d'utilisateur invalide
	</div>  
	<% } %> 
  <div class="col-md-12">
    <div class="modal-dialog" style="margin-bottom:0">
        <div class="login-page">
            <h1 style="color:white">INSARAG</h1>
                    <div class="panel-body form">
                        <form name='f' action="login" method='POST' class="login-form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Nom d'utilisateur" name="username" type="username" autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mot de passe" name="password" type="password" value="">
                                </div>
                               <!--  <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div> -->
                                <!-- Change this to a button or input when using this as a form -->
                                <input name="submit" type="submit" value="Connexion" id="connection_button" />
                            </fieldset>
                        </form>
                    </div>
                </div>
    </div>
</div>
</body>

<script type="text/javascript">
function validate() {
    if (document.f.username.value == "" && document.f.password.value == "") {
        alert("Mot de passe et Nom d'utilisateur requis");
        document.f.username.focus();
        return false;
    }
    if (document.f.username.value == "") {
        alert("Nom d'utilisateur requis");
        document.f.username.focus();
        return false;
    }
    if (document.f.password.value == "") {
    alert("Mot de passe requis");
    document.f.password.focus();
        return false;
    }
}
</script>
</html>