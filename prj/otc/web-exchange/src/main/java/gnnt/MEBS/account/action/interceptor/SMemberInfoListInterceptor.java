package gnnt.MEBS.account.action.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import gnnt.MEBS.account.model.SpecialMember;
import gnnt.MEBS.account.service.SpecialMemberService;
import gnnt.MEBS.base.query.hibernate.PageInfo;
import gnnt.MEBS.config.constant.ActionConstant;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class SMemberInfoListInterceptor
  extends AbstractInterceptor
{
  private final transient Log logger = LogFactory.getLog(SMemberInfoListInterceptor.class);
  @Autowired
  @Qualifier("specialMemberService")
  private SpecialMemberService specialMemberService;
  
  public String intercept(ActionInvocation invocation)
    throws Exception
  {
    this.logger.debug("enter   MemberInfoListInterceptor");
    HttpServletRequest request = ServletActionContext.getRequest();
    PageInfo pageInfo = new PageInfo(ActionConstant.PAGEINFONO, ActionConstant.PAGEINFOSIZE, "primary.name", false);
    List<SpecialMember> memberInfoList = this.specialMemberService.getList(null, pageInfo);
    request.setAttribute("memberInfoList", memberInfoList);
    String result = invocation.invoke();
    return result;
  }
}
