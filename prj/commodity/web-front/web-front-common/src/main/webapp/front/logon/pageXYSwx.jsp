<%@ page contentType="text/html;charset=GBK"%>
<% request.setAttribute("pageTitle","ȷ������Э����");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="headerwx.jsp" flush="false"></jsp:include>
<%@ include file="/front/public/includefiles/allIncludeFiles.jsp"%>
<link href="${skinPath}/css/mgr/memberadmin/module.css" rel="stylesheet" type="text/css" />
<script src="${publicPath }/js/jquery-1.6.min.js" type="text/javascript"></script>
<script src="${publicPath }/js/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="GBK"></script>
<script src="${publicPath }/js/validationengine/jquery.validationEngine.js" type="text/javascript" charset="GBK"></script>
<script type="text/javascript" src="${publicPath}/js/autocomplete/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${publicPath}/js/PasswordMode.js"></script>

		<script type="text/javascript">
			function isRead(){
				if(document.getElementById("myCheck").checked){
					document.getElementById("myConfirm").disabled="";
				}else{
					document.getElementById("myConfirm").disabled="disabled";
				}
			}
			function mysubmit(){
				registtemp.submit();
			}
		</script>
		<!-------------------------State Begin------------------------->
		<div class="state stateBg">
			<div class="step">
				ע�Ჽ�裺
				<span>1.ȷ������Э����</span>2.��дע����Ϣ 3.ע��ɹ� 4.��������˲����佻���̴��롣
			</div>
		</div>
		<div class="clear">
		</div>
		<form id="registtemp" action="${basePath}/checkneedless/firmapply/registerforwardwx.action" method="post"  >
			<div class="bodyStep2">
				<h3>���Ķ�����������֪����</h3>
				<div align="center"><font size="4" color="#e73a49">��������֪</font></div>
				<fieldset>
					<div>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color:#e73a49">һ�� �����̵Ŀ�������</strong>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ϸ�ķ��˽�����Ӧ�Ǿ��з����ʸ����Ӧ������֯�ʸ��ܶ������´�����Ʒ���׻�������е��������εľ�����֯���ϸ����Ȼ�˽�������������ʮ�����꣬������ȫ������Ϊ�����Ҿ���һ���ľ��ó������������տ��������ͽ�����Ʒ���֪ʶ�Ĺ���
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������������ʵ����Ч�����ݿ������������뱣֤�ʽ���Դ�ĺϷ��Լ����ṩ���ϵ���ʵ�ԡ��Ϸ��ԡ���Ч�ԡ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color:#e73a49">���������ļ���ǩ��</strong>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ϸ����Ȼ�˽����̿����������ɽ����̱�������ǩ�𿪻��ļ���
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���˽����̿����������䷨�������ˣ������ˣ���ί�д�����ǩ�𿪻��ļ����������ڿ����ļ��ϼӸǷ��˽����̹��»��ͬר���¡�ί�д����˰������������ģ����˽�����Ӧ�ṩ�Ӹǻ������²������������ˣ������ˣ�ǩ������ʵ���Ϸ�����Ч�ġ���Ȩί���顷ԭ����
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong style="color:#e73a49">���� ������ ����</strong>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��һ��֪����Ʒ���׷���
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ӧ֪��������Ʒ���׾��з��գ�Ӧ��ϸ�Ķ������ո�֪�顷��ǩ��ȷ�ϡ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����������������Ȩ�������(��Ա)���ý��ܽ����̵�ȫȨί�С�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ӧ֪����Ȩ�������(��Ա)���乤����Ա���ý��ܽ����̵�ȫȨί�У�������Ҳ����Ҫ����Ȩ�������(��Ա)���乤����Ա��ȫȨί�еķ�ʽ���д�����Ʒ���ס�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������Ȩ�������(��Ա)��ʾ��ַ
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�йس�������Ʒ��������Ȩ�������(��Ա)����Ϣ����ͨ���ٷ�����www.yrdce.cn���Ĺ�ʾ��Ϣ���в�ѯ�ͺ�ʵ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ģ�֪����Ȩ�������(��Ա)���йع涨
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������Ӧ֪��ֻ�еõ���������Ȩ��ȡ����Ӧ�ʸ����Ȩ�������(��Ա)�����֧�������ܸ��ݡ���������Ʒ�������ֻ�������Ȩ�������(��Ա)�����취(����)��������Э���������������ҵ��
					</div>
				</fieldset>
				<h3></h3>
				<h3>���Ķ������ո�֪�顷��</h3>
				<div align="center"><font size="4" color="#e73a49">���ո�֪��</font></div>
				<fieldset>
					<div>
<br/><strong style="color:#e73a49">�𾴵Ľ����̣�</strong>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���������ϸ�Ķ��������ո�֪�顷�����ݣ�����Ҫ���Ⲣǩ�𱾡����ո�֪�顷�󷽿��ڳ�������Ʒ�����������¼�ơ��������� �������Ͳ��뽻�ס�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��Ʒ�������з��յģ�����Ͷ�ʿ��ܻ�����ʧ���������ܳ�����ʼͶ�ʶ��ˣ���������������������״���ͷ��ճ����������ڽ��н���֮ǰ��������ȷ�������ݣ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;һ�������������Ķ������ؽ���������ع���������޷����㽻������ع����Ҫ���������еĹ�����Ʒ�����ܸ����йع��򱻴�Ϊת�ã������е��ɴ˲����ĺ����
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ڹ��ҷ��ɷ��漰���ߵı仯����������ع�����޸ġ�������ʩ�ĳ�̨��ԭ�������еĹ�����Ʒ�����޷��������У������е��ɴ˵��µ���ʧ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����ڲ����Ͻ����������׹���涨�����������£��������޷��������������Ʒ������������������Ľ����ʽ��п����޷��ֲ�ȫ����ʧ�������е��ɴ˵��µ�ȫ����ʧ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ġ����ڵ���ˮ�֡����ֵȲ��ɿ������ػ��߼����ϵͳ��ͨѶϵͳ���ϵȽ���������Ԥ�������ܱ��Ⲣ���ܿ˷���ԭ�򣬿����������ָ���޷��ɽ������޷�ȫ���ɽ��������е��ɴ˵��µ���ʧ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�塢�������������Ʒ����ʱ�����ڣ������������ڣ����·��գ������е��ɴ˵��µ���ʧ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.�����ȱ�����Ͻ��׾��飬���������������ɽ���ʧ�ܻ���ʧ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.���Ľ������붪ʧ�����˵��ã�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3.�����޷����ƺͲ���Ԥ���ϵͳ���ϡ��豸���ϡ�ͨѶ���ϡ��������ϡ�������ϵ����أ����ܵ���ϵͳ��������������̱����ʹ���Ľ���ָ������ӳ١��жϡ����ݴ���������
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4.�������Ͻ���ϵͳ���ڱ�����ڿͺͼ�������������Ŀ����ԣ��ɴ˿��ܵ���ϵͳ���ϣ�ʹ�����޷����м�������Ϣ���ִ�����ӳ٣�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5.�������ϵ����ݴ��������ͨ�ŷ�æ��ԭ������ӳ١��жϡ����ݴ������ȫ���Ӷ�ʹ���Ͻ��׳����ӳ١��жϵ��쳣���Ρ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ո�֪�顷�޷���ʾ������Ʒ���׵����з��պͽ�����ȫ���޷����ƺͲ���Ԥ������Ρ����������н���֮ǰ��ȫ���˽⽻��������ع��򼰹涨���������ľ��ó������������տ������������弰�����������������͹�������
						
					</div>
				</fieldset>
				<h3></h3>
				<h3>���Ķ�����������Ʒ�������ֻ����ƽ���������Э�顷��</h3>
				<div align="center"><font size="4" color="#e73a49">��������Ʒ�������ֻ����ƽ���������Э��</font></div>
				<fieldset>
					<div>
<br/><strong style="color:#e73a49">�𾴵Ľ����̣�</strong>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�׷�����������Ʒ���������޹�˾
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ҷ����ߣߣߣߣ� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������˺ţ��ߣߣߣߣ� ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�������ߣߣߣߣ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���ݡ��л����񹲺͹���ͬ��������ط��ɡ����棬�ס��ҡ�����������ƽ��Э�̣����ҷ�����׷������µ���Ʒ���ס�����������Э���׷�Ϊ�ҷ��ṩ�׷���Ȩ��Χ�ڵķ�����й��������Э�顣
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��һ�� �����õ��׷�����Ȩ��Ϊ�ҷ��ṩ����ָ������ѵ�Լ���Ϣ����Э���׷����з��տ��ơ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڶ��� ��ǩ��Э��ǰ���ҷ�����ϸ�Ķ������Ⲣ�Ͽ��ˡ����ո�֪�顷������������֪�� �� �����ո�֪�顷������������֪�����ҷ�ǩ�����Ϊ��Э��ĸ�����ϵ��Э�鲻�ɷָ����ɲ��֡�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ �ס���˫��һ��ȷ�ϲ�ͬ�⣬�׷�����������Ʒ����������ع������й������׷���Ȩ����Ϊȷ�������������кͿ��Ʒ����������������
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>�ҷ���Ը���ܼ׷��Ĺ����ͼල��顣�ҷ���ŵ�����ҷ��ڽ����г���Υ����ع���涨�����Σ��ҷ�ͬ��׷�������ع�����д�����������������ʵ�С���Ϊת�á��ȴ�ʩ�� ������Ը�е���˲�������ʧ��</u>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ �ҷ���ŵ�������㹻��ֵ�������ȫ�桢��ʱ���ʵ���������Ʒ��������
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ �ҷ���Ը���ü׷��ṩ�ĵ��ӽ���ƽ̨������Ʒ���ף��׷�Ϊ�ҷ��ṩ����ϵͳ��������λ�������й���Ʒ���ס����յ���ʩ�ͷ��񣬲�Ϊ�ҷ����ա������йؿ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ �ҷ�Ӧ���ռ׷���ع���Ĺ涨ͨ��������׷����뽻�״��룬�����á�������޸Ľ������롣�����ҷ���������������ƻ����׷�ԭ����ɵ���ʧ��Ӧ���ҷ��е���
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ <u> �׷���Ȩ����ʵ���������ع涨�����޶�����ʱ�ڹٷ���վ���Թ������ҷ��Դ������Ͽɣ�����ŵ��ʱ��ע�׷��ٷ���վ�������޶���Ĺ���ִ�С�����˫��ȷ�ϼ׷���ع��򹹳ɱ�Э�����Ч��ɲ��֣��ҷ�Ӧ��ʱ�˽�׷����µġ����õ���ع������ҷ�����ع������κ����ʣ�Ӧ��ʱ��ϵ�׷������Ա���Խ���κ����ҷ�δ��ʱ�˽�������ع�������ع�����������µ����Σ����ҷ����ге���</u>>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ڰ��� �ҷ�Ӧ�ϸ�����ع����������񣬰����������ڽ����ʽ𡢴���������õ�֧��������ͻ��ｻ�յȡ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ھ��� ��Э�����й����У������ط��ɡ����桢���¡����߼��׷���ع������仯���׷���Ȩ���������仯ֱ�ӱ���򲹳䱾Э������������򲹳������������á�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>������������ı仯���׷���Ȩ�Ա�Э�����������б���򲹳䣬һ������򲹳���Լ����֪ͨ��ʽ���ڼ׷�Ӫҵ������ ��վ����ȷ�ʽ���ҷ���������õȱ���򲹳������֪ͨ�����ҷ��򹫸淢��֮ʱ������Ч��</u>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>���ҷ���ͬ��׷����ݱ��������ı���򲹳䣬 ������֪ͨ�׷��������ֹ��Э�飻�׷���������յ��ҷ�֪ͨ�������������Ϊ�ҷ���������������</u>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮ�� �򲻿ɿ������µ�ϵͳ���ϡ��豸���ϡ�ͨѶ���ϡ��������ϵ�ͻ���¹ʸ��ҷ���ɵ���ʧ���׷����е����Ρ��������¹���ɽ��׻��������жϣ��ָ�����ʱ�Թ��Ϸ���ǰϵͳ���ռ�¼�Ľ�������Ϊ��Ч���ݡ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮһ�� ���ɿ�����ָ˫������Ԥ�������ܱ����Ҳ��ܿ˷��Ŀ͹�����������������ڻ��֡���ը��̨�硢��ˮ�����𡢳�ϫ���׵硢ս�������硢���ż�ͨ���豸�жϡ��չ����������ơ��������߱������������ͣ���ס����������׹����й涨�Ľ����쳣���豸���ϡ�ͨѶ���ϡ�������ϵͳ���ϼ�ͨ��������δ�����ɵĴ�ȡ�����Խ������������ݡ����˶���ض���վ������������������ǿɹ������κ�һ������Ϣ�����жϡ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮ���� �׷��ͱ������ҷ��ṩ�ĸ�����Ϣ�����Ͻ���Ϊ���ײο����ҷ��ݴ˽��н��׵ģ������Ե���
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮ���� �ҷ��������μӽ��ס�Ӧͨ��������׷�����������룬�ڰ����������������������ط��ú�Э����ֹ��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮ���� ��Э�������һ�����飬�ɼס��ҡ�������Э�̽������Э�̲��ɻ�ԸЭ�̵ģ�ͬ�⽫��������ʡ�����б���������Ժ�������ϡ�
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮ���� ��Э���ڼס��ҡ�������ǩ����Ȼ�˵�����ǩ�֡����˵����˼Ӹǹ��»��ͬ�¡��׷��Ӹǿ���ר���£�����Ч��<u> ����Э�������Ͽ���������ʹ�õ���ǩԼ��ʽ����Э�龭���ұ����������Ͽ���ϵͳ�е��ȷ�Ϻ���Ч��</u>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮ���� ��Э��δ�����ˣ��ס��ҡ�������һ��ͬ�ⰴ�ռ׷���ع���ִ�С��׷���ع����Ǳ�Э�鲻�ɷָ����ɲ��֣����߾���ͬ�ȷ���Ч��������Э������ȷԼ��������ǩ��ȷ���⣬�Ա�Э����κ���д�޸ľ�Ϊ��Ч��
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��ʮ���� ��Э��Ҽʽ���ݣ��ס��ҡ�����������һ�ݣ�����ͬ��Ч����
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u>����/ ��ҵ �������Ķ� ����������֪�� �� �����ո�֪�顷�� ������������Э�顷����ȫ�����ͬ�⣬��Ը�е������еķ��ռ��ɴ˴�����һ�п��ܵ���ʧ��</u>
<br/>�����̳�д���ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�<u>���볭д���ϻ��߲��֣��ҷ������Ͽ���ϵͳ�е��ȷ�ϼ���Ϊ�ҷ���д���ϲ��֣�</u>
<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br/>�׷�����������Ʒ���������޹�˾�����£�
<br/>��Ȩ������
<br/>
<br/>�ҷ���
<br/>���˽����̣����£� ��
<br/>��Ȩ������ǩ���� ��
<br/>��Ȼ�˽����̣�ǩ�֣� ��
<br/>
<br/>���������£� ��
<br/>��Ȩ������
<br/>ǩ�����ڣ�
						
					</div>
				</fieldset>
				<h3></h3>
			</div>
		</form>
		<div align="center">
			<input id="myCheck" type="checkbox" onClick="isRead()"/>���������Ķ�����ȫ���⡶��������֪���������ո�֪�顷������������Ʒ����������������Э�顷��
			<br/>���ѶԽ�������ؽ����ƶȺ͹�������ȫ���˽⣬ͬ�����ؽ����������ƶȺ͹�����Ը�����Ϊ��������Ʒ������������<br/>
			<input id="myConfirm" type="button" value="��һ��" disabled="disabled" onClick="mysubmit()"/>
		</div>