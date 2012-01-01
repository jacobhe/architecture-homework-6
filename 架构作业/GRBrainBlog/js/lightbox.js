//扩展Element的方法
Object.extend(Element, {
	getWidth: function(element) {
	   	element = $(element);
	   	return element.offsetWidth; 
	},//获得元素宽度
	setWidth: function(element,w) {
	   	element = $(element);
    	element.style.width = w +"px";
	},//设置元素宽度
	setHeight: function(element,h) {
   		element = $(element);
    	element.style.height = h +"px";
	},//设置元素高度
	setTop: function(element,t) {
	   	element = $(element);
    	element.style.top = t +"px";
	},//设置元素的y坐标
	setSrc: function(element,src) {
    	element = $(element);
    	element.src = src; 
	},//设置元素的src属性
	setHref: function(element,href) {
    	element = $(element);
    	element.href = href; 
	},//设置元素的href属性
	setInnerHTML: function(element,content) {
		element = $(element);
		element.innerHTML = content;
	}//设置元素的innerHTML属性
});
//扩展 Array 对象的方法
//删除数组中的重复元素
Array.prototype.removeDuplicates = function () {
	for(i = 1; i < this.length; i++){
		if(this[i][0] == this[i-1][0]){
			this.splice(i,1);
		}
	}
}
//清空数组的所有元素
Array.prototype.empty = function () {
	for(i = 0; i <= this.length; i++){
		this.shift();
	}
}
//获取页面当前的滚动位置
function getPageScroll(){
	var yScroll;
	if (self.pageYOffset) {
		yScroll = self.pageYOffset;
	} else if (document.documentElement && document.documentElement.scrollTop){	 // ie6
		yScroll = document.documentElement.scrollTop;
	} else if (document.body) {// 其他浏览器
		yScroll = document.body.scrollTop;
	}
	arrayPageScroll = new Array('',yScroll) 
	return arrayPageScroll;
}
//获取页面（page）的高和宽以及窗口（window）的高和宽。
function getPageSize(){
	var xScroll, yScroll;
	if (window.innerHeight && window.scrollMaxY) {	
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight){ //Mac以外的浏览器
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else { // ie等浏览器
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	}
	var windowWidth, windowHeight;
	if (self.innerHeight) {	
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) { // ie6
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) { // 其他浏览器
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}	
	// 如果页面高度小于window
	if(yScroll < windowHeight){
		pageHeight = windowHeight;
	} else { 
		pageHeight = yScroll;
	}
    //页面宽度小于window
	if(xScroll < windowWidth){	
		pageWidth = windowWidth;
	} else {
		pageWidth = xScroll;
	}
    //返回的数组	
    arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight) 
	return arrayPageSize;
}
//操作停顿数毫秒
function pause(numberMillis) {
	var now = new Date();
	var exitTime = now.getTime() + numberMillis;
	while (true) {//循环一个无用操作，等待时间的延续
		now = new Date();
		if (now.getTime() > exitTime)
			return;
	}
}
//显示select元素
function showSelectBoxes(){
	selects = document.getElementsByTagName("select");
	for (i = 0; i != selects.length; i++) {
		selects[i].style.visibility = "visible";
	}
}
//隐藏select元素
function hideSelectBoxes(){
	selects = document.getElementsByTagName("select");
	for (i = 0; i != selects.length; i++) {
		selects[i].style.visibility = "hidden";
	}
}
//显示哪组图片
function showgroup(id)
{
var obj = $(id);
obj.style.display==''?obj.style.display='none':obj.style.display='';
}

var fileLoadingImage = "img/loading.gif";	//加载数据时显示的图标	
var fileBottomNavCloseImage = "img/closelabel.gif";//关闭图标
var resizeSpeed = 7;	// 图片展示大小逐步变化时的速度(1表示最慢，10表示最快)
var borderSize = 10;	//显示图片的区域边框的大小
var imageArray = new Array;//图片数组
var activeImage;//当前图片
if(resizeSpeed > 10){ resizeSpeed = 10;}//控制此速度在1和10之间
if(resizeSpeed < 1){ resizeSpeed = 1;}
resizeDuration = (11 - resizeSpeed) * 0.15;//图片展开的时间
//lightbox对象
var Lightbox = Class.create();
//扩展此对象的方法
Lightbox.prototype = {
	//初始化，创建所有将用到的元素
	initialize: function() {	
		if (!document.getElementsByTagName){ return; }
		var anchors = document.getElementsByTagName('a');//所有超链接
		// 遍历所有超链接
		for (var i=0; i<anchors.length; i++){
			var anchor = anchors[i];
			var relAttribute = String(anchor.getAttribute('rel'));//取得rel属性
			// 如果是lightbox性质的超链接，则赋予其lightbox事件
			if (anchor.getAttribute('href') && (relAttribute.toLowerCase().match('lightbox'))){
				anchor.onclick = function () {myLightbox.start(this); return false;}
			}
		}
		var objBody = document.getElementsByTagName("body").item(0);//页面的最外层元素
		//创建遮罩层
		var objOverlay = document.createElement("div");
		objOverlay.setAttribute('id','overlay');
		objOverlay.style.display = 'none';
		objOverlay.onclick = function() { myLightbox.end(); return false; }//单击则遮罩层中止
		objBody.appendChild(objOverlay);
		//高亮层
		var objLightbox = document.createElement("div");
		objLightbox.setAttribute('id','lightbox');
		objLightbox.style.display = 'none';
		objBody.appendChild(objLightbox);
	    //图片显示层的外层
		var objOuterImageContainer = document.createElement("div");
		objOuterImageContainer.setAttribute('id','outerImageContainer');
		objLightbox.appendChild(objOuterImageContainer);
        //图片显示层内层
		var objImageContainer = document.createElement("div");
		objImageContainer.setAttribute('id','imageContainer');
		objOuterImageContainer.appendChild(objImageContainer);
	    //需要显示的图片
		var objLightboxImage = document.createElement("img");
		objLightboxImage.setAttribute('id','lightboxImage');
		objImageContainer.appendChild(objLightboxImage);
	    //图片的导航
		var objHoverNav = document.createElement("div");
		objHoverNav.setAttribute('id','hoverNav');
		objImageContainer.appendChild(objHoverNav);
	    //上一个图片的按钮
		var objPrevLink = document.createElement("a");
		objPrevLink.setAttribute('id','prevLink');
		objPrevLink.setAttribute('href','#');
		objHoverNav.appendChild(objPrevLink);
		//下一个图片的按钮
		var objNextLink = document.createElement("a");
		objNextLink.setAttribute('id','nextLink');
		objNextLink.setAttribute('href','#');
		objHoverNav.appendChild(objNextLink);
	    //加载数据时显示图片的div
		var objLoading = document.createElement("div");
		objLoading.setAttribute('id','loading');
		objImageContainer.appendChild(objLoading);
	    //关闭加载
		var objLoadingLink = document.createElement("a");
		objLoadingLink.setAttribute('id','loadingLink');
		objLoadingLink.setAttribute('href','#');
		objLoadingLink.onclick = function() { myLightbox.end(); return false; }
		objLoading.appendChild(objLoadingLink);
	    //加载数据时的图片
		var objLoadingImage = document.createElement("img");
		objLoadingImage.setAttribute('src', fileLoadingImage);
		objLoadingLink.appendChild(objLoadingImage);
        //图片容器的容器
		var objImageDataContainer = document.createElement("div");
		objImageDataContainer.setAttribute('id','imageDataContainer');
		objImageDataContainer.className = 'clearfix';
		objLightbox.appendChild(objImageDataContainer);
        //图片容器
		var objImageData = document.createElement("div");
		objImageData.setAttribute('id','imageData');
		objImageDataContainer.appendChild(objImageData);
	    //图片的详情即摘要
		var objImageDetails = document.createElement("div");
		objImageDetails.setAttribute('id','imageDetails');
		objImageData.appendChild(objImageDetails);
	    //图片标题
		var objCaption = document.createElement("span");
		objCaption.setAttribute('id','caption');
		objImageDetails.appendChild(objCaption);
	    //当前显示的是第几张图片
		var objNumberDisplay = document.createElement("span");
		objNumberDisplay.setAttribute('id','numberDisplay');
		objImageDetails.appendChild(objNumberDisplay);
		//底部导航
		var objBottomNav = document.createElement("div");
		objBottomNav.setAttribute('id','bottomNav');
		objImageData.appendChild(objBottomNav);
	    //关闭按钮的超链接
		var objBottomNavCloseLink = document.createElement("a");
		objBottomNavCloseLink.setAttribute('id','bottomNavClose');
		objBottomNavCloseLink.setAttribute('href','#');
		objBottomNavCloseLink.onclick = function() { myLightbox.end(); return false; }
		objBottomNav.appendChild(objBottomNavCloseLink);
	    //关闭的图片
		var objBottomNavCloseImage = document.createElement("img");
		objBottomNavCloseImage.setAttribute('src', fileBottomNavCloseImage);
		objBottomNavCloseLink.appendChild(objBottomNavCloseImage);
	},
	//lightbox效果开始显示
	start: function(imageLink) {	
		hideSelectBoxes();//隐藏select元素，因为select元素的显示级别高于div元素，所以div无法遮罩select
		// 伸缩遮罩层以适应图片大小
		var arrayPageSize = getPageSize();
		Element.setHeight('overlay', arrayPageSize[1]);
		new Effect.Appear('overlay', { duration: 0.2, from: 0.0, to: 0.8 });//延时展开效果
		imageArray = [];//图片数组
		imageNum = 0;		
		if (!document.getElementsByTagName){ return; }
		var anchors = document.getElementsByTagName('a');
		// 如果此图片没在图片数组中，则加入数组
		if((imageLink.getAttribute('rel') == 'lightbox')){
			// 加入数组
			imageArray.push(new Array(imageLink.getAttribute('href'), imageLink.getAttribute('title')));			
		} else {
		// 如果在数组中，则遍历其他lightbox超链接，加入数组中
			for (var i=0; i<anchors.length; i++){
				var anchor = anchors[i];
				//加入数组
				if (anchor.getAttribute('href') && (anchor.getAttribute('rel') == imageLink.getAttribute('rel'))){
					imageArray.push(new Array(anchor.getAttribute('href'), anchor.getAttribute('title')));
				}
			}
			imageArray.removeDuplicates();//清除数组中重复数据
			while(imageArray[imageNum][0] != imageLink.getAttribute('href')) { imageNum++;}//图片数目
		}
		// top位置
		var arrayPageSize = getPageSize();
		var arrayPageScroll = getPageScroll();
		var lightboxTop = arrayPageScroll[1] + (arrayPageSize[3] / 15);
		Element.setTop('lightbox', lightboxTop);//设置top
		Element.show('lightbox');//显示
		this.changeImage(imageNum);//显示待播图片
	},
	//显示图片
	changeImage: function(imageNum) {	
		activeImage = imageNum;	// 要显示的图片
		// 隐藏元素
		Element.show('loading');
		Element.hide('lightboxImage');
		Element.hide('hoverNav');
		Element.hide('prevLink');
		Element.hide('nextLink');
		Element.hide('imageDataContainer');
		Element.hide('numberDisplay');		
		//预先加载的图片
		imgPreloader = new Image();
		// 图片容器大小自适应
		imgPreloader.onload=function(){
			Element.setSrc('lightboxImage', imageArray[activeImage][0]);
			myLightbox.resizeImageContainer(imgPreloader.width, imgPreloader.height);
		}
		imgPreloader.src = imageArray[activeImage][0];
	},
	//使图片容器的大小适合图片
	resizeImageContainer: function( imgWidth, imgHeight) {
		// 当前的长宽
		this.wCur = Element.getWidth('outerImageContainer');
		this.hCur = Element.getHeight('outerImageContainer');
		this.xScale = ((imgWidth  + (borderSize * 2)) / this.wCur) * 100;
		this.yScale = ((imgHeight  + (borderSize * 2)) / this.hCur) * 100;
		// 当前长宽和以前的差异大小
		wDiff = (this.wCur - borderSize * 2) - imgWidth;
		hDiff = (this.hCur - borderSize * 2) - imgHeight;
		if(!( hDiff == 0)){ new Effect.Scale('outerImageContainer', this.yScale, {scaleX: false, duration: resizeDuration, queue: 'front'}); }
		if(!( wDiff == 0)){ new Effect.Scale('outerImageContainer', this.xScale, {scaleY: false, delay: resizeDuration, duration: resizeDuration}); }
        //如果前后图片的大小一样，停顿片刻
		if((hDiff == 0) && (wDiff == 0)){
			if (navigator.appVersion.indexOf("MSIE")!=-1){ pause(250); } else { pause(100);} 
		}
        //设置属性    
		Element.setHeight('prevLink', imgHeight);
		Element.setHeight('nextLink', imgHeight);
		Element.setWidth( 'imageDataContainer', imgWidth + (borderSize * 2));
		this.showImage();//显示图片
	},
	//显示图片，并且预先加载邻近图片
	showImage: function(){
		Element.hide('loading');
		new Effect.Appear('lightboxImage', { duration: 0.5, queue: 'end', afterFinish: function(){	myLightbox.updateDetails(); } });
		this.preloadNeighborImages();
	},
	//更新显示图片的标题，个数，和底部导航
	updateDetails: function() {
		Element.show('caption');
		Element.setInnerHTML( 'caption', imageArray[activeImage][1]);//标题内容
		// 如果存在图片数组则显示：Image x of x 
		if(imageArray.length > 1){
			Element.show('numberDisplay');//显示图片
			Element.setInnerHTML( 'numberDisplay', " " + eval(activeImage + 1) + " of " + imageArray.length + "&nbsp;&nbsp;");
		}
        //新效果
		new Effect.Parallel(
			[ new Effect.SlideDown( 'imageDataContainer', { sync: true, duration: resizeDuration + 0.25, from: 0.0, to: 1.0 }), 
			  new Effect.Appear('imageDataContainer', { sync: true, duration: 1.0 }) ], 
			{ duration: 0.65, afterFinish: function() { myLightbox.updateNav();} } 
		);
	},
    //更新上一个、下一个的导航
	updateNav: function() {
		Element.show('hoverNav');				
		// 如果不是第一个图片则显示上一个的导航
		if(activeImage != 0){
			Element.show('prevLink');
			document.getElementById('prevLink').onclick = function() {
				myLightbox.changeImage(activeImage - 1); return false;
			}
		}
        //如果不是最后一个则显示下一个的导航
		if(activeImage != (imageArray.length - 1)){
			Element.show('nextLink');
			document.getElementById('nextLink').onclick = function() {
				myLightbox.changeImage(activeImage + 1); return false;
			}
		}
		//开启键盘操作监听
		this.enableKeyboardNav();
	},
	//监听键盘操作
	enableKeyboardNav: function() {
		document.onkeydown = this.keyboardAction; 
	},
    //关闭键盘操作监听
	disableKeyboardNav: function() {
		document.onkeydown = '';
	},
	//控制键盘操作
	keyboardAction: function(e) {
		if (e == null) { // ie
			keycode = event.keyCode;
		} else { // mozilla
			keycode = e.which;
		}
        //被按下哪个键
		key = String.fromCharCode(keycode).toLowerCase();
		//关闭lightbox
		if((key == 'x') || (key == 'o') || (key == 'c')){	
			myLightbox.end();
		} else if(key == 'p'){	//显示上一个图片
			if(activeImage != 0){
				myLightbox.disableKeyboardNav();
				myLightbox.changeImage(activeImage - 1);
			}
		} else if(key == 'n'){	// 显示下一个图片
			if(activeImage != (imageArray.length - 1)){
				myLightbox.disableKeyboardNav();
				myLightbox.changeImage(activeImage + 1);
			}
		}
	},
	//预先加载上一个和下一个图片，以备显示
	preloadNeighborImages: function(){
        //如果存在下一个图片，则预先加载
		if((imageArray.length - 1) > activeImage){
			preloadNextImage = new Image();
			preloadNextImage.src = imageArray[activeImage + 1][0];
		}
		//如果不是第一个图片，则加载上一个图片
		if(activeImage > 0){
			preloadPrevImage = new Image();
			preloadPrevImage.src = imageArray[activeImage - 1][0];
		}
	},
    //lightbox结束
	end: function() {
		this.disableKeyboardNav();//关闭键盘监听
		Element.hide('lightbox');//隐藏lightbox
		new Effect.Fade('overlay', { duration: 0.2});//渐变关闭lightbox
		showSelectBoxes();//显示select元素
	}
}
//如果x键被按下，lightbox效果结束
function getKey(e){
	if (e == null) { // ie
		keycode = event.keyCode;
	} else { // mozilla
		keycode = e.which;
	}
	key = String.fromCharCode(keycode).toLowerCase();
	
	if(key == 'x'){
	}
}
//监听按键操作
function listenKey () {	document.onkeypress = getKey; }
//页面加载时初始化lightbox
function initLightbox() { myLightbox = new Lightbox(); }
Event.observe(window, 'load', initLightbox, false);




