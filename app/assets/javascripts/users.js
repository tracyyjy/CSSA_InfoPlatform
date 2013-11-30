function inbox_mail_select(thisId, className) {
	//alert(thisId);
	var nodeArr = document.getElementById("inbox_group_mail_list").getElementsByTagName("a");
	var contentArr = document.getElementById("inbox_main_content").getElementsByTagName("label");
	//alert(nodeArr.length);
	for (var i = 0; i < nodeArr.length; i++) {
		//alert("here!");
		nodeArr[i].setAttribute("class", className);
		//alert(thisId.substring(thisId.indexOf("#")+1));
		contentArr[i].setAttribute("class", "is_not_display");

	}

	var obj = document.getElementById(thisId);
	obj.setAttribute("class", className + " active");
	var mail_content = document.getElementById("inbox_mail_content#" + thisId.substring(thisId.indexOf("#") + 1));
	mail_content.setAttribute("class", "is_display");
	//alert(document.getElementById(thisId).className);

}

function sent_mail_select(thisId, className) {
	//alert(thisId);
	var nodeArr = document.getElementById("sent_group_mail_list").getElementsByTagName("a");
	var contentArr = document.getElementById("sent_main_content").getElementsByTagName("label");
	//alert(nodeArr.length);
	for (var i = 0; i < nodeArr.length; i++) {
		//alert("here!");
		nodeArr[i].setAttribute("class", className);
		//alert(thisId.substring(thisId.indexOf("#")+1));
		contentArr[i].setAttribute("class", "is_not_display");

	}

	var obj = document.getElementById(thisId);
	obj.setAttribute("class", className + " active");
	var mail_content = document.getElementById("sent_mail_content#" + thisId.substring(thisId.indexOf("#") + 1));
	mail_content.setAttribute("class", "is_display");
	//alert(document.getElementById(thisId).className);

}

function get_options(user_id) {
	var userId = document.getElementById(user_id).id;
	//alert(userId);
	var inbox = document.getElementById("li_inbox");
	var sent = document.getElementById("li_sent");
	var compose = document.getElementById("li_compose");
	
	//alert(inbox.id);
	
	if(inbox.className == "active"|| sent.className == "active"){
		alert("inbox or sent!");
	}else if(compose.className == "active"){
		alert("compose!");
	}
	
	$.ajax({
		type : "POST",
		url : '/users/userId/show?current_groupid=' + group_id,
		data : 'text'

	})
}

