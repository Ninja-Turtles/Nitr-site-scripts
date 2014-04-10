#! D:/LuaRocks/systree/bin/cgilua.cgi.exe
<!doctype html>
<html>
<head><meta charset="ISO-8859-1">
<title>Software Releases</title>
<script type="text/javascript" src="../scripts/jquery-2.1.0.js"></script>
<script type="text/javascript" src="../scripts/tsort.js"></script>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
<script type="text/javascript">
$(document).ready(function() {
	$('table.tableSorter').tableSort( {
		sortBy: ['numeric', 'text', 'text', 'text', 'numeric'],
		animation: 'fade',
		speed: 300,
		distance: '200px',
		delay: 75
	} );
});
</script>
</head>
<body bgcolor="#343838" text="#CCCCCC" link="#00CC99" >
<h2 align="center">Welcome to the software releases section!!</h2>
<form action="../cgi-bin/test.lua" target="_blank" >
<table width="100%">
  <tr>
    <td>&nbsp;Filter by Filename: <input name="Filename" type="text" ></td>
    <td align="center">&nbsp;Filter by Sharer: <input name="Sharer" type="text" ></td>
    <td align="right">&nbsp;Filter by Date: <input name="Date" type="text" ></td>
  </tr>
</table>
<input name="Category" type="hidden" value="softy" >
<br />
<p align="center"><input name="Search" type="submit" value="Search!" ></p>
</form>
<table class="tableSorter" width=98% border="1" align="center" cellpadding="2" cellspacing="0.5">
<tr>
	<th scope="col">&nbsp;Index</th>
	<th scope="col">&nbsp;File Name</th>
	<th scope="col">&nbsp;Added By</th>
	<th scope="col">&nbsp;Date</th>
</tr>
<%
dofile("C:/Users/Skylight/My Documents/dependencies/update.lua")
file=loadfile("C:/Users/Skylight/My Documents/dependencies/Releases.lua")
file()
index=1
for i,v in ipairs(Releases.softy) do
%>
<tr>
	<td>&nbsp;<%= index %></td>
    <td>&nbsp;<a href="<%= v.Magnet %>"> <%= v.File %></a></td>
    <td>&nbsp;<%= v.Nick %></td>
    <td>&nbsp;<%= v.Date %></td>
</tr>
<%
index=index+1
end
%>
</table>
</body>
</html>