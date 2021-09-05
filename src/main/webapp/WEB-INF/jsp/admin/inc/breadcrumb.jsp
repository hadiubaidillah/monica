<% final boolean isForm = request.getRequestURL().toString().contains("-form.jsp"); %>
<ol class="breadcrumb">
	<% String strMenu = request.getParameter("menu") != null ? request.getParameter("menu") : ""; %>
	<% for(int i = 0 ; i < strMenu.split("\\|").length ; i++) { %>
		<% if((i+1) != strMenu.split("\\|").length) { %> <li class="breadcrumb-item"><a href="#" onclick="return false;"><%= strMenu.split("\\|")[i] %></a></li>
		<% } else { %> 
			<li class="breadcrumb-item <%=isForm?"":"active"%>"><%=isForm?"<a href='#' onclick='location=location.href.replace(\"-form\", \"\")'>":""%><%= strMenu.split("\\|")[i] %><%=isForm?"</a>":""%></li>
			<% if(isForm) { %><li class="breadcrumb-item active"><%= strMenu.split("\\|")[i].replace("Daftar", "Form") %></li><% } %> 
		<% } %>
	<% } %>
</ol>