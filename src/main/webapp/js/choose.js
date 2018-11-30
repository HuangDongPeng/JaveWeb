window.onload=function(){
	var backg=document.getElementById("background");
	var check=document.getElementById('check');
	var detail=document.getElementById("detail");
	var add=document.getElementById("add");
	var member=document.getElementById("member");
	var search=document.getElementById("search");
	check.onmouseover=function(){
		backg.setAttribute("src","img/checkBac.jpg");
		check.setAttribute("src","img/anotherCheck.png");
	}
	check.onmouseout=function(){
		backg.setAttribute("src","img/firstBackg.jpg");
		check.setAttribute("src","img/check.png");
	}
	detail.onmouseover=function(){
		backg.setAttribute("src","img/BacDetail.jpg");
		detail.setAttribute("src","img/anotherDetail.png");
	}
	detail.onmouseout=function(){
		backg.setAttribute("src","img/firstBackg.jpg");
		detail.setAttribute("src","img/detail.png");
	}
	add.onmouseover=function(){
		backg.setAttribute("src","img/add .jpg");
		add.setAttribute("src","img/anotherAdd.png");
	}
	add.onmouseout=function(){
		backg.setAttribute("src","img/firstBackg.jpg");
		add.setAttribute("src","img/add.png");
	}
	member.onmouseover=function(){
		backg.setAttribute("src","img/member.jpg");
		member.setAttribute("src","img/anotherMember.png");
	}
	member.onmouseout=function(){
		backg.setAttribute("src","img/firstBackg.jpg");
		member.setAttribute("src","img/member.png");
	}
	search.onmouseover=function(){
		backg.setAttribute("src","img/search.jpg");
		search.setAttribute("src","img/anotherSearch.png");
	}
	search.onmouseout=function(){
		backg.setAttribute("src","img/firstBackg.jpg");
		search.setAttribute("src","img/search.png");
	}
}
