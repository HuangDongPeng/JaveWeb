window.onload=function(){
	var img=document.getElementById("img");
	var timer=setInterval(clock,4000);
	var Pic=new Array(9);
			Pic[0]="img/1.jpg";
			Pic[1]="img/2.jpg";
			Pic[2]="img/3.jpg";
			Pic[3]="img/4.jpg";
			Pic[4]="img/5.jpg";
			Pic[5]="img/6.jpg";
			Pic[6]="img/7.jpg";
			Pic[7]="img/8.jpg";
			Pic[8]="img/9.jpg";
			Pic[9]="img/10.jpg";
	function clock(){
			var i=Math.floor(Math.random()*10);
 	       img.setAttribute("src",Pic[i]);
           
		}
	 
}
