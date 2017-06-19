		function time(){
		    //获得显示时间的div
		    t_div = document.getElementById('dateName');
		   var now=new Date()
		    //替换div内容 
		   t_div.innerHTML = +now.getFullYear()
		    +"年"+(now.getMonth()+1)+"月"+now.getDate()
		    +"日 "+now.getHours()+":"+now.getMinutes()
		    +":"+now.getSeconds()+" "+" 星期"+"日一二三四五六".charAt(new Date().getDay());
		    //等待一秒钟后调用time方法，由于settimeout在time方法内，所以可以无限调用
		   setTimeout(time,1000);
		  }
		  $(function(){
		    time();
		  })