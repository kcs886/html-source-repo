/*****************************************************************************
 * 윈도우 팝업창 처리 구현
 * @param1:화면에 띄울 페이지 URL
 * @param2:팝업창의 가로 길이 
 * @param3:팝업창의 세로 길이 
 * @param4:팝업창의 이름 
 *****************************************************************************/
function cmm_window_popup(url,popupwidth,popupheight,popupname)
{	//해상도(1600*1024) , 팝업창 크기(700*450)
	Top = (window.screen.height-popupheight)/3;//(1024-450)/3 => 191
	Left = (window.screen.width-popupwidth)/2;//(1600-700)/2 => 450
	if(Top<0) Top = 0;
	if(Left<0) Left = 0;
	options = "location=yes, fullscreen=no, status=no";
	options +=", left="+Left+", top="+Top;
	options +=", width="+popupwidth+", height="+popupheight;
	popupname = window.open(url,popupname, options);
}