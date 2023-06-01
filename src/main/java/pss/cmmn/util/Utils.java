package pss.cmmn.util;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;

import pss.cmmn.exception.PssException;

public class Utils {

	protected static Log log = LogFactory.getLog(Utils.class);
	
	@SuppressWarnings("rawtypes")
	public static boolean isEmpty(Object obj){
        if( obj instanceof String ) return obj==null || "".equals(obj.toString().trim());
        else if( obj instanceof List ) return obj==null || ((List)obj).isEmpty();
        else if( obj instanceof Map ) return obj==null || ((Map)obj).isEmpty();
        else if( obj instanceof Object[] ) return obj==null || Array.getLength(obj)==0;
        else return obj==null;
    }
     
    public static boolean isNotEmpty(String s){
        return !isEmpty(s);
    }
    
    /**
	 * SHA256 hash얻기
	 * @param input
	 * @return
	 */
	public static String getSHA256(String input) {
		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%064x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toReturn;
	}
	/**
	 * SHA512 hash얻기
	 * @param input
	 * @return
	 */
	public static String getSHA512(String input) {
		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(input.getBytes("utf8"));
			toReturn = String.format("%0128x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return toReturn;
	}
    /**
	 * SHA1 C#에 SHA1Managed 후 UTF-8 인코딩
	 * @param text
	 * @return
	 * @throws Exception
	 */
	public static String SHA1(String text) throws Exception {
	    MessageDigest md;
	    md = MessageDigest.getInstance("SHA-1");
	    byte[] sha1hash = new byte[40];
	    md.update(text.getBytes("UTF-8"), 0, text.length());
	    sha1hash = md.digest();
	    String converted = new String(sha1hash, "UTF-8");
	    return converted;
	}
	/**
	 * String int null 체크
	 * @param data
	 * @param defaultValue
	 * @return
	 */
	public static int checkNull(String data, int defaultValue){
		if(data==null || data.equals("null")){
			return defaultValue;
		}else{
			return Integer.parseInt(data);
		}
	}
	/**
	 * String null 체크
	 * @param data
	 * @param defaultValue
	 * @return
	 */
	public static String checkNull(String data, String defaultValue){
		if(data==null || data.equals("null")){
			return defaultValue;
		}else{
			return data;
		}
	}
	/**
	 * Object null 체크
	 * @param data
	 * @param defaultValue
	 * @return
	 */
	public static String checkNull(Object data, String defaultValue) {
		if(data==null || data.equals("null")){
			return defaultValue;
		}else{
			return String.valueOf(data);
		}
	}
	/**
	 * int int null 체크
	 * @param data
	 * @param defaultValue
	 * @return
	 */
	public static int checkNull(int data, int defaultValue){
		if(Integer.toString(data)==null || Integer.toString(data).equals("null") || Integer.toString(data).trim().length()==0){
			return defaultValue;
		}else{
			return data;
		}
	}
	/**     
     * 문자열대 문자열로 바꿔준다.<BR>
     * @param  
     * @return 
     */
    public static String replace(String line, String oldString, String newString){
        String result=line;
    	for(int index = 0; (index = result.indexOf(oldString, index)) >= 0; index += newString.length())
    		result = result.substring(0, index) + newString + result.substring(index + oldString.length());

        return result;
    }
	/**     
     * 테그를 삭제<BR>
     * @param  
     * @return 
     */
    public static String replaceNoHTML(final String p_str){
        String result="";
    	if ( p_str == null ){
    		result = "";
        }else{
        	result = p_str.trim();
        	result = replace(result,"&","&amp;");
        	result = replace(result,"<","&lt;");
        	result = replace(result,">","&gt;");
        	result = replace(result,"'","&quot;");
        	result = replace(result,"\"","");
        	result = replace(result,"-","&#45;");
            result = replace(result,"--","");
        }
        return result;
    }
    /**
	 * String null 체크 XSS 적용
	 * @param data
	 * @param defaultValue
	 * @return
	 */
	public static String checkNullXSS(String data, String defaultValue){
		if(data==null || data.equals("null")){
			return defaultValue;
		}else{
			return replaceNoHTML(data);
		}
	}
	/**
	 * String null 체크 XSS 적용
	 * @param data
	 * @param defaultValue
	 * @return
	 */
	public static int checkNullXSS(int data, String defaultValue){
		if(Integer.toString(data)==null || Integer.toString(data).equals("null") || Integer.toString(data).trim().length()==0){
			return Integer.parseInt(defaultValue);
		}else{
			return Integer.parseInt(replaceNoHTML(String.valueOf(data)));
		}
	}
	/**
	 * String int null 체크 XSS 적용
	 * @param data
	 * @param defaultValue
	 * @return
	 */
	public static int checkNullXSS(String data, int defaultValue){
		if(data==null || data.equals("null")){
			return defaultValue;
		}else{
			return Integer.parseInt(replaceNoHTML(data));
		}
	}
	/**
	 * 등록후 지정 기간동안 new 표시
	 * @param wDate 등록일 java.util.Date
	 * @param day 지정기간 int
	 * @return "new" String
	 */
	public static String getDateNew(Date wDate, int day){
		long now = System.currentTimeMillis();
		long inputDate = wDate.getTime();
		String mark="";
		int inputDay = checkNull(day, 1);
		/**
		 * 1000*60*60*24(하루를 1/1000초단위 변환)*지정할 기간(3일 3)
		 */
		if(now - inputDate < (1000*60*60*24*inputDay)){
			mark="new";
		}
		return mark;
	}
	/**
	 * 날짜 포멧 <br />1. yyyy-MM-dd<br />2. yyyy-MM-dd HH:mm:ss<br />3. yyyy-MM-dd HH:mm<br />4. yy.MM.dd<br />5. yyyy.MM.dd
	 * @param time
	 * @param type
	 * @return
	 */
	public static String myDate(Timestamp time, int type){
		String result="";
		SimpleDateFormat sdf = null;
		if(type==1){
			sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREAN);
		}else if(type==2){
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREAN);
		}else if(type==3){
			sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.KOREAN);
		}else if(type==4){
			sdf = new SimpleDateFormat("yy.MM.dd", Locale.KOREAN);
		}else if(type==5){
			sdf = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREAN);
		}
		if(sdf != null){
			result = sdf.format(time);
		}
		return result;
	}
	/**
	 * 콤보박스 yyyy
	 * @param today
	 * @return
	 */
	public static String combo_yy(String today){
		StringBuffer buff = new StringBuffer(1024);
		today = today.substring(0, 4);
		int startday = Integer.parseInt(today)-2;
		
		for(;startday<Integer.parseInt(today)+3;startday++){
			buff.append("<option value='"+startday+"' ");
			if(today.equals(""+startday)){
				buff.append(" selected='selected' ");
			}
			buff.append(" >"+startday+"년 </option>\n");
		}
		return buff.toString();
	}
	
	/**
	 * 금액 ￦ 찍기 3자리
	 * @param money
	 * @return
	 */
	public static String myMoney(int money){
		DecimalFormat df = new DecimalFormat("￦###,###,### 원");
		return df.format(money);
	}
	/**
	 * html문서에 active 표시
	 * @param nowPURL 현재파일명
	 * @param checkPURL 체크파일명
	 * @param viewStr 표시할 문자열
	 * @return
	 */
	public static String htmlActive(String nowPURL, String checkPURL, String viewStr) {
		String result = "";
		if(checkPURL.equals(nowPURL)) {
			result = viewStr;
		}
		return result;
	}
	/**
	 * html문서에 active 표시
	 * <pre>
	 * Utils.htmlActiveArr(checkPURL, "/master/system.do,/master/code.do", request.getContextPath()+"/master/index.do", nowPURL, "active")
	 * </pre>
	 * @param nowPURL
	 * @param checkPURL "a, b, c"
	 * @param noneUrl1
	 * @param noneUrl2
	 * @param viewStr
	 * @return
	 */
	public static String htmlActiveArr(String nowPURL, String checkPURL, String noneUrl1, String noneUrl2, String viewStr) {
		String result = "";
		String[] strArr = checkPURL.split(",");
		for(int i=0;i<strArr.length;i++) {
			if(!noneUrl1.equals(noneUrl2)){
				if(strArr[i].equals(nowPURL)) {
					result = viewStr;
				}
			}
			//System.out.println(nowPURL+"::"+strArr[i]+"!="+noneUrl1+"!="+noneUrl2);
		}
		return result;
	}
	
	/**
	 * 날짜 변환 <br />Utils.getDate(EgovDateUtil.getToday(), "") 
	 * @param date
	 * @param dateType
	 * @return
	 */
	public static String getDate(String date, String dateType){
		String return_value = null;
		int year = Integer.parseInt(date.replace(dateType, "").substring(0, 4));
		int month = Integer.parseInt(date.replace(dateType, "").substring(4, 6));
		int day = Integer.parseInt(date.replace(dateType, "").substring(6, 8));

		Calendar cal= Calendar.getInstance ();

		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		cal.set(Calendar.DATE, day);

		return_value = Integer.toString(month) + "/" + Integer.toString(day);
		switch (cal.get(Calendar.DAY_OF_WEEK)){
		case 1:
			return_value += "(일)";
			break;
		case 2:
			return_value += "(월)";
			break;
		case 3:
			return_value += "(화)";
			break;
		case 4:
			return_value += "(수)";
			break;
		case 5:
			return_value += "(목)";
			break;
		case 6:
			return_value += "(금)";
			break;
		case 7:
			return_value += "(토)";
			break;
		}
		return return_value;
	}
	/**
	 * XSS 체크
	 * @param value
	 * @return String value
	 */
	public static String XSSCheck(String value) {
		if(null != value && value.trim().length()>0) {
			value = value.trim();
			value = value.replaceAll("<", "&lt;");
			value = value.replaceAll(">", "&gt;");
			value = value.replaceAll("&", "&amp;");
			value = value.replaceAll("\"", "&quot;");
			value = value.replaceAll("\'", "&apos;");
		}
		return value;
	}
	
	/**
	 * 32글자 랜덤 문자열(숫자포함)
	 * @return
	 */
	public static String getRandomString(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	/**
	 * 6자리 난수발생
	 * @return
	 */
	public static String sixRandom() {
		String result = "";
		while (result.length() < 6) {
			result += (int) (Math.random() * 10);
		}
		log.debug(result);
		return result;
	}
	
	/**
     * 파일의 확장자를 체크하여 필터링된 확장자를 포함한 파일인 경우에 예외를 발생한다.
     * @param file
     * */
    public static void badFileExtIsReturnException(File file) {
        String fileName = file.getName();
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
        
        final String[] BAD_EXTENSION = { "jsp", "php", "asp", "aspx", "html", "perl", "exe", "js", "lnk", "sh" };
 
        try {
            int len = BAD_EXTENSION.length;
            for (int i = 0; i < len; i++) {
                if (ext.equalsIgnoreCase(BAD_EXTENSION[i])) {
                    // 불량 확장자가 존재할떄 IOExepction 발생
                    throw new PssException("BAD EXTENSION FILE UPLOAD");
                }
            }
        } catch (PssException e) {
            e.printStackTrace();
        }
    }
 
    /**
     * 파일의 확장자를 체크하여 필터링된 확장자를 포함한 파일인 경우에 true를 리턴한다.
     * @param file
     * */
    public static boolean badFileExtIsReturnBoolean(File file) {
        String fileName = file.getName();
        String ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
        final String[] BAD_EXTENSION = { "jsp", "php", "asp", "aspx", "html", "perl", "exe", "js", "lnk", "sh" };
 
        int len = BAD_EXTENSION.length;
        for (int i = 0; i < len; i++) {
            if (ext.equalsIgnoreCase(BAD_EXTENSION[i])) {
                return true; // 불량 확장자가 존재할때..
            }
        }
        return false;
    }
	
	/**
	 * 폴더사이즈 구하기 org.apache.commons.io.FileUtils;
	 * @param fPath
	 * @return
	 */
	public static long getFolderSize(String fPath){
		long retVal = FileUtils.sizeOfDirectory(new File(fPath));
		return retVal;
	}
	
	/**
	 * 모바일 체크
	 * @param request
	 * @return String "pc":PC, "mobile":MOBILE
	 */
	public static String userAgentCheck(HttpServletRequest request){
		String mobileCheck = "pc";
		String userAgent = request.getHeader("user-agent");
		log.debug("userAgent="+userAgent);
		String[] browser = {"iPhone", "iPod", "BlackBerry", "Android", "Windows CE", "LG", "MOT", "SAMSUNG", "SonyEricsson"};
		for(int i=0;i<browser.length;i++){
			if(userAgent.matches(".*"+browser[i]+".*")){
				mobileCheck = "mobile";
				break;
			}
		}
		return mobileCheck;
	}
	
	/**
	 * 콤마 찍기
	 * @param money
	 * @return
	 */
	public static String myComma(int money){
		DecimalFormat df = new DecimalFormat("###,###,###");
		return df.format(money);
	}
	/**
	 * 콤마 찍기
	 * @param money
	 * @return
	 */
	public static String myComma(float money){
		DecimalFormat df = new DecimalFormat("###,###,###");
		return df.format(money);
	}
	
	/**
	 * 썸네일 이미지 생성
	 * @param filePath 원본파일
	 * @param destPath 생성될파일
	 * @param imageFormat 이미지확장자
	 * @param destWidth 가로길이
	 * @param destHeight 세로길이
	 * <br />사용법 : 
	 * <br />page import="util.Util" <br />
	 * 
	 * 		Image img = new Image();<br />
	 * 		img.scale("C:/test1.jpg", "D:\\test1.jpg", "jpg", 200, 200);<br />
	 * 
	 * @return
	 * @throws IOException
	 *
	 * 
	 */
	public static boolean scale(String filePath, String destPath, String imageFormat, int destWidth, int destHeight) throws IOException{
	//	FileInputStream fis = new FileInputStream(filePath.replace("/", "\\"+File.separator));
		FileInputStream fis = new FileInputStream(filePath+File.separator);
		BufferedImage srcImage = ImageIO.read(fis);
		boolean result = true;
		try{
			ResampleOp resampleOp = new ResampleOp(destWidth, destHeight);
			resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
			BufferedImage rescaledImage = resampleOp.filter(srcImage, null);
			File destFile = new File(destPath);
			ImageIO.write(rescaledImage, imageFormat, destFile);
		}catch(IOException e){
			/*logger.error("이미지 크기 개선에 실패");
			logger.error(e.getMessage());*/
			result = false;
		}
		return result;
	}
	
	/**
	 * 가로 세로 사이즈에 따른 썸네일 생성
	 * @param source
	 * @throws Exception
	 */
	public static void createThumbnail(String source)throws Exception{
		BufferedImage bi = ImageIO.read(new File(source));
		int width=bi.getWidth();
		int height=bi.getHeight();
		
		if(width > height){
			if(width >1024){
				scale(source, source, "jpg", 1024, 768);
			}
		}else{
			if(height > 768){
				scale(source, source, "jpg", 768, 1024);
			}
		}
	}
	
	/**
	 * 메세지 알림창 띄우고 페이지 이동
	 * @param msg
	 * @param locate
	 * @return
	 */
	public static String popup_go(String msg, String locate){
		StringBuffer sb = new StringBuffer();
		sb.append("<script type='text/javascript'>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+locate+"';");
		sb.append("</script>");
		return sb.toString();
		
	}
	/**
	 * 페이지 이동
	 * @param url
	 * @return
	 */
	public static String redirect(String url){
		StringBuffer sb = new StringBuffer();
		sb.append("<script type='text/javascript'>");
		sb.append("location.href='"+url+"';");
		sb.append("</script>");
		return sb.toString();
	}
	/**
	 * Integer to String
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static int parseInt(String param, int defaultValue){
		try{
			return Integer.parseInt(param);
		}catch(Exception e){
			return defaultValue;
		}
	}
	
	/**
	 * 네이버 단축URL API
	 * @param cid 클라이언트 아이디
	 * @param cscr 클라이언트 시크릿
	 * @param ourl 단축대상 URL
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static String getShorturl(String cid, String cscr, String ourl){
		String result = "";
		String clientId = cid;
		String clientSecret = cscr;
		try{
			String text = ourl;
			String apiURL = "https://openapi.naver.com/v1/util/shorturl.json?url="+text;
			URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            //System.out.println(response.toString());
            Object obj = new JSONParser().parse(response.toString());
            JSONObject jo = (JSONObject) obj;
            Map res = ((Map)jo.get("result"));
            Iterator<Map.Entry> itr1 = res.entrySet().iterator(); 
            while (itr1.hasNext()) { 
                Map.Entry pair = itr1.next(); 
                //System.out.println(pair.getKey() + " : " + pair.getValue());
                if("url".equals(pair.getKey().toString())){
                	result = pair.getValue().toString();
                }
            }
		}catch (Exception e) {
			log.error(e);
		}
		return result;
	}
	
	/**
	 * MD5 암호화
	 * @param str
	 * @return
	 */
	public static String MD5(String str){
		String md5="";
		try{
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte byteData[]=md.digest();
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<byteData.length;i++){
				sb.append(Integer.toString((byteData[i] & 0xff)+0x100, 16).substring(1));
			}
			md5 = sb.toString();
		}catch(NoSuchAlgorithmException e){
			//log.error(e.getMessage(), e);
			md5=null;
		}
		return md5;
	}
	/**
	 * SHA-256 암호화
	 * @param str
	 * @return
	 */
	public static String SHA256(String str){
		String sha = "";
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(str.getBytes());
			byte byteData[]=sh.digest();
			StringBuffer sb = new StringBuffer();
			for(int i=0;i<byteData.length;i++){
				sb.append(Integer.toString((byteData[i] & 0xff)+0x100, 16).substring(1));
			}
			sha = sb.toString();
		}catch(NoSuchAlgorithmException e){
			//log.error(e.getMessage(), e);
			sha = null;
		}
		return sha;
	}
	
	/**
	 * 문자 데이터 원하는 길이만큼 잘라내기
	 * @param value 문자
	 * @param size 허용 길이
	 * @return
	 */
	public static String content_div(String value, int size){
		if(value == null){return "";}
		if(value.length()>size){
			value=value.substring(0, size)+"...";
		}
		return value;
	}
	
	/**
	 * cmd(c, r, u, d) 를 mode(0, 1, 2, 3) 으로 변환
	 * @param map
	 * @return
	 */
	public static int modeToCmd(Map<String, Object> map) {
		int mode= 0;
		if("c".equals(String.valueOf(map.get("cmd")))) {
			mode= 0;
		}else if("r".equals(String.valueOf(map.get("cmd")))) {
			mode = 1;
		}else if("u".equals(String.valueOf(map.get("cmd")))) {
			mode = 2;
		}else if("d".equals(String.valueOf(map.get("cmd")))) {
			mode = 3;
		}
		return mode;
	}
	
	public static String twoRandChars(String src) {
        Random rnd = new Random();
        int index1 = (int) (rnd.nextFloat() * src.length());
        int index2 = (int) (rnd.nextFloat() * src.length());
        return "" + src.charAt(index1) + src.charAt(index2);
    }
	/**
	 * 문자, 숫자, 특수문자 랜덤 생성
	 * @return
	 */
	public static String PasswordGenerator() {
		String chars = "abcdefghijklmnopqrstuvwxyz";
        String CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String NUMS = "1234567890";
        String SPEC = "!@#$%^&~";
        String pass = twoRandChars(chars) + twoRandChars(CHARS) + twoRandChars(NUMS) + twoRandChars(SPEC);
        return pass;
	}
	
	private final static PasswordEncoder delegate = new BCryptPasswordEncoder();
	public static String encode(CharSequence rawPassword) {
		return delegate.encode(rawPassword);
	}
	
	public static boolean matches(CharSequence rawPassword, String encodedPassword) {
		return delegate.matches(rawPassword, encodedPassword);
	}
	
	/**
	 * 쿠키 생성
	 * @param key
	 * @param value
	 * @param time
	 * @return
	 */
	public static Cookie makeCookie(String key, String value, int time) {
		Cookie cookie = new Cookie(key, value);
		cookie.setMaxAge(time);
		cookie.setPath("/");
		return cookie;
	}
	/**
	 * 쿠키 삭제
	 * @param key
	 * @return
	 */
	public static Cookie delCookie(String key) {
		Cookie cookie = new Cookie(key, null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		return cookie;
	}
	/**
	 * 쿠키 값얻기
	 * @param request
	 * @param cookieId
	 * @return
	 */
	public static String getCookie(HttpServletRequest request, String cookieId) {
		Cookie cookie[] = request.getCookies();
		String cookieValue = "";
		if(cookie != null) {
			for(int i=0;i<cookie.length;i++) {
				if(cookie[i].getName().equals(cookieId)) {
					cookieValue = cookie[i].getValue();
				}
			}
		}
		return cookieValue;
	}
	/**
	 * html의 특수문자를 표현하기 위해
	 *
	 * @param srcString
	 * @return String
	 * @exception Exception
	 * @see
	 */
	public static String getHtmlStrCnvr(String srcString) {

		String tmpString = srcString;

		tmpString = tmpString.replaceAll("&lt;", "<");
		tmpString = tmpString.replaceAll("&gt;", ">");
		tmpString = tmpString.replaceAll("&amp;", "&");
		tmpString = tmpString.replaceAll("&nbsp;", " ");
		tmpString = tmpString.replaceAll("&apos;", "'");
		tmpString = tmpString.replaceAll("&quot;", "\"");

		return tmpString;

	}
}