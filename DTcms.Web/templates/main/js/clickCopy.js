		function jsCopy(n){ 
        var e=document.getElementById("content"+n);//对象是content 
        e.select(); //选择对象 
        document.execCommand("Copy"); //执行浏览器复制命令
       alert("任务地址已复制好，你可以使用Ctrl+V 贴到任务栏里去了哦！"); 
    } 