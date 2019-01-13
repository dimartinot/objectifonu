<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org"
      xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">

<head></head>
<jsp:include page="../utils/header.jsp" />
<body>
	<div th:if="${param.error}">
		Mot de passe ou nom d'utilisateur invalide
	</div>   
  <div class="col-md-12">
    <div class="modal-dialog" style="margin-bottom:0">
        <div class="modal-content">
                    <div class="panel-heading">
                        <h3 class="panel-title">Connexion</h3>
                    </div>
                    <div class="panel-body">
                        <form name='f' action="login" method='POST'>
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
                                <input name="submit" type="submit" value="Connexion" />
                            </fieldset>
                        </form>
                    </div>
                </div>
    </div>
</div>
</body>
<jsp:include page="../utils/header.jsp" />

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