document.onreadystatechange = subSomething;// 当页面加载状态改变的时候执行这个方法.
function subSomething() {
	if (document.readyState == "complete") // 当页面加载状态为完全结束时进入
	{
		var regexTests = document.getElementsByTagName("button");
		var len = regexTests.length;

		//		var key = rightMap.keySet();
		//        for (var i in key){
		//           alert(map.get(key[i]));
		//        }
		// 用正则表达式
		// var regex = /^add/;//以add开头
		/**
		 * for (i = 0; i < len; i++) { var str =regexTests[i].id;
		 * if(regex.test(str)) { alert("正则表达式:"+regexTests[i].value); } }
		 */
		// 字符串方法
		for (i = 0; i < len; i++) {
			var str = regexTests[i].id + '';
			//			if (str.substr(0, "add".length) == "add")// 以add开头
			//			{
			//				if (!sessionAdd) {
			//					regexTests[i].disabled = true;
			//				}
			//			}
			//			if (str.substr(0, "delete".length) == "delete")// 以delete开头
			//			{
			//				if (!sessionDelete) {
			//					regexTests[i].disabled = true;
			//				}
			//			}
			//			if (str.substr(0, "update".length) == "update")// 以update开头
			//			{
			//				if (!sessionUpdate) {
			//					regexTests[i].disabled = true;
			//				}
			//			}
			if (rightMap) {
				for ( var o in rightMap) {
					if (str.substr(0, o.length) == o) {
						if (!rightMap[o]) {
							regexTests[i].style.display = 'none';
						}
					}
				}
			}

		}

	}
}
