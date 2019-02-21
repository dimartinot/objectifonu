<html>
	<head>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>
	<body>
		<div class="row">
			<ul class="list-group list-group-horizontal" style="margin: 10%">
				<li class="list-group-item " width="40%" height="40%">
					<textarea id="textArea" oninput="writeInDiv()" class="form-control" placeholder="Entrez le texte à traduire..."></textarea>
				</li>
				<li class="list-group-item list-group-item-light" width="20%" height="40%">
					<img height="100" src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4KPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB2ZXJzaW9uPSIxLjEiIHZpZXdCb3g9IjAgMCAxMjkgMTI5IiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCAxMjkgMTI5IiB3aWR0aD0iNTEycHgiIGhlaWdodD0iNTEycHgiPgogIDxnPgogICAgPHBhdGggZD0ibTQwLjQsMTIxLjNjLTAuOCwwLjgtMS44LDEuMi0yLjksMS4ycy0yLjEtMC40LTIuOS0xLjJjLTEuNi0xLjYtMS42LTQuMiAwLTUuOGw1MS01MS01MS01MWMtMS42LTEuNi0xLjYtNC4yIDAtNS44IDEuNi0xLjYgNC4yLTEuNiA1LjgsMGw1My45LDUzLjljMS42LDEuNiAxLjYsNC4yIDAsNS44bC01My45LDUzLjl6IiBmaWxsPSIjMDAwMDAwIi8+CiAgPC9nPgo8L3N2Zz4K" />
				</li>
				<li class="list-group-item" width="40%" height="40%"> 
					<div id="toTranslate" > Le texte sera traduit ici !</div>
				</li>
			</ul>
		</div>
		<div id="google_translate_element"></div>
		<script> 
			function googleTranslateElementInit() {
				new google.translate.TranslateElement({
						pageLanguage: 'fr'
					}, 'google_translate_element');
				}
			function writeInDiv() {
				  var x = document.getElementById("textArea").value;
				  document.getElementById("toTranslate").innerHTML = x;
				}
		</script>
		<script src="http://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> 
	</body>
</html>