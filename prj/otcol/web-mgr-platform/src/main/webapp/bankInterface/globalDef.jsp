<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.math.BigDecimal" %>

<%@ page import="gnnt.bank.platform.dao.*"%>
<%@ page import="gnnt.trade.bank.vo.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.resave.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.resave.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.sfz.sent.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.gs.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.hx.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.hx.sent.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.jh.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.pf.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.pf.resave.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.sent.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.resave.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.sent.child.*"%>
<%@ page import="gnnt.trade.bank.vo.bankdz.xy.resave.child.*"%>
<%@ page import="gnnt.bank.platform.util.*"%>
<%@ page import="gnnt.bank.platform.vo.*"%>
<%@ page import="gnnt.bank.platform.util.BankCode"%>
<%@ page import="gnnt.bank.platform.util.CardType"%>

<%@ page import="java.rmi.*"%>
<%@ page import="gnnt.trade.bank.processorrmi.*"%>
<%@ page import="gnnt.bank.platform.rmi.*"%>

<%@ page import="gnnt.MEBS.common.security.util.*"%>
<%@ page import="gnnt.MEBS.common.security.*"%>
<%
//�������б���
new BankCode().load();

//����֤�����
new CardType().load();

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
%>
<%!
static final String ICBC_BANKID = "10";//����
static final String CCB_BANKID = "13";//����
static final String SDB_BANKID = "18";//�չ
static final String HXB_BANKID = "17";//����
static final String HRBB_BANKID = "30";//������
static final String CIB_BANKID = "19";//��ҵ
static final String BC_BANKID = "24";//����
static final String SPDB_BANKID = "22";//�ַ�
static final String ABC_BANKID = "86";//ũ��
static final String CEB_BANKID = "31";//���
static final String NBCB_BANKID = "32";//����
// ��ҳĬ��ÿҳ��С
public final int BANKPAGESIZE = 10;
// ����Ϊ�յ��ַ���
public String replaceNull(String s){
  if(s==null||"".equals(s.trim())||"null".equals(s.trim())) return "";
  else return s;
}
//�жϼ�����
public boolean noAdapterBank(String bankID){
	if("aa".equals(bankID)){
		return true;
	}
	return false;
}
//֧���г���ǩԼ
public boolean openAccountBank(String bankID){
	if("05".equals(bankID) || "17".equals(bankID)||"99".equals(bankID)||"79".equals(bankID)){
		return true;
	}
	return false;
}
//֧���г��˽�Լ
public boolean delAccountBank(String bankID){
	if("06".equals(bankID)){
		return true;
	}
	return false;
}
//�жϷ������������
public int sendQSBank(String bankID){
	if(CCB_BANKID.equals(bankID)){//����
		return Tool.strToInt(CCB_BANKID);
	}else if(ICBC_BANKID.equals(bankID)){//����
		return Tool.strToInt(ICBC_BANKID);
	}else if(HXB_BANKID.equals(bankID)){//����
		return Tool.strToInt(HXB_BANKID);
	}else if(SDB_BANKID.equals(bankID)){//�
		return Tool.strToInt(SDB_BANKID);
	}else if(CIB_BANKID.equals(bankID)){//��ҵ
		return Tool.strToInt(CIB_BANKID);
	}else if(HRBB_BANKID.equals(bankID)){//������
		return Tool.strToInt(HRBB_BANKID);
	}
	/*
	else if(SPDB_BANKID.equals(bankID)){ //�ַ�
		return Tool.strToInt(SPDB_BANKID);
	}else if(BC_BANKID.equals(bankID)){ //����
		return Tool.strToInt(BC_BANKID);
	}else if(ABC_BANKID.equals(bankID)){//ũ��
		return Tool.strToInt(ABC_BANKID);
	}else if(CEB_BANKID.equals(bankID)){ //���
		return Tool.strToInt(CEB_BANKID);
	}else if(NBCB_BANKID.equals(bankID)){ //����
		return Tool.strToInt(NBCB_BANKID);
	}
	*/
	return 0;
}
//����Ҫ���������˺ŵ�����
public boolean checkAccount(String bankID){
	if("05".equals(bankID) || "007".equals(bankID)){//ũҵ����
		return true;
	}
	return false;
}
public boolean isOutMoneyBank(String bankID){
	if("66".equals(bankID)){
		return true;
	}
	return false;
}
%>
<%
	String RmiIpAddress = Tool.getConfig("RmiIpAddress");
	String RmiPortNumber = Tool.getConfig("RmiPortNumber");
	String RmiServiceName = Tool.getConfig("RmiServiceName");
	String PTRmiServiceName = Tool.getConfig("PTRmiServiceName");
	String computerIP = request.getRemoteAddr();
%>

<%
//�׼������ơ��������������������Ƽ�������ʡ������
	//��ȡ�����г��б�������
	BankDAO bankDao = BankDAOFactory.getDAO();
	Vector<CityValue> citys = bankDao.getCityNames("");
	CityValue cityForBank = new CityValue();
	Map<String, CityValue> map = new HashMap<String, CityValue>();
	for(int i=0;i<citys.size();i++){
		cityForBank = citys.get(i);
		map.put(cityForBank.getCityCode(), cityForBank);//�Ѷ�Ӧ�Ŀ����г��ж����Գ��б���Ϊkey�ŵ�Map��
	}
	
	//���������б�
	Vector<BankValue> vecBankList = bankDao.getBankList("");
	Map<String, BankValue> banksMap = new HashMap<String, BankValue>();
	for(BankValue bv : vecBankList){
		banksMap.put(bv.bankID, bv);
	}
	
	//��ȡ��½�û��б�
	BankFeeAndOffsetDao _userDao = new BankFeeAndOffsetDaoImpl();
	Set<List<Object>> setUser = _userDao.userQuery();
	
	//���ؽ���ϵͳ�б�
	Vector<SystemMessage> vecSystemList = bankDao.getSystemMessages("");
	Map<String,SystemMessage> systemsMap = new HashMap<String, SystemMessage>();
	for(SystemMessage sm : vecSystemList){
		systemsMap.put(sm.systemID, sm);
	}
%>

<script type="text/javascript">
//�������ʱ����
function gotoBankQS(){
	var bankID = frm.bankID.value;
	if(bankID == ""){
		alert("��ѡ����������");
	}else{
		frm.action="<%=request.getContextPath()%>/bankInterface/compareInfo/"+bankQsPage(bankID);
		frm.submit();
	}
}
//ȷ��ÿ������ҳ���λ��
function bankQsPage(bankID){
	if(bankID == "-1"){//���س�ʼ��ҳ��
		return "qs.jsp";
	}if(bankID == "<%=ICBC_BANKID%>"){//��������
		return "dz/icbc/ICBC.jsp";
	}else if (bankID == "<%=CCB_BANKID%>"){//��������
		return "dz/ccb/CCB.jsp";
	}else if (bankID == "<%=SDB_BANKID%>"){//�չ����
		return "dz/sdb/SDB.jsp";
	}else if (bankID == "<%=HXB_BANKID%>"){//��������
		return "dz/hxb/HXB.jsp";
	}else if (bankID == "<%=CIB_BANKID%>"){//��ҵ����
		return "dz/cib/CIB.jsp";
	}else if(bankID == "<%=HRBB_BANKID%>"){ //����������
		return "dz/hrbb/HRBB.jsp";
	}else if(bankID == "<%=SPDB_BANKID%>"){ //�ַ�
		return "dz/spdb/SPDB.jsp";
	}else if(bankID == "<%=BC_BANKID%>"){ //����
		return "dz/bc/BC.jsp";
	}else if(bankID == "<%=ABC_BANKID%>"){//ũ��
		return "dz/abc/ABC.jsp";
	}else if(bankID == "<%=CEB_BANKID%>"){//���
		return "dz/ceb/CEB.jsp";
	}else if(bankID == "<%=NBCB_BANKID%>"){//����
		return "dz/nbcb/NBCB.jsp";
	}
}
</script>