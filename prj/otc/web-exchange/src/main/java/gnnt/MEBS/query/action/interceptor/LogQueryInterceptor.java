package gnnt.MEBS.query.action.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import gnnt.MEBS.base.query.hibernate.QueryConditions;
import gnnt.MEBS.config.constant.ActionConstant;
import gnnt.MEBS.query.service.LogCataLogSearchService;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class LogQueryInterceptor
  extends AbstractInterceptor
{
  private final transient Log logger = LogFactory.getLog(LogQueryInterceptor.class);
  private String type;
  @Autowired
  @Qualifier("logCataLogSearchService")
  private LogCataLogSearchService logCataLogSearchService;
  
  public void setType(String type)
  {
    this.type = type;
  }
  
  public LogCataLogSearchService getLogCataLogSearchService()
  {
    return this.logCataLogSearchService;
  }
  
  public String intercept(ActionInvocation invocation)
    throws Exception
  {
    this.logger.debug("enter   CustomerStatusQueryInterceptor");
    HttpServletRequest request = ServletActionContext.getRequest();
    request.setAttribute(ActionConstant.GNNT_ + "logCataLog.moudleId[=][long]", this.type);
    request.setAttribute(ActionConstant.GNNT_ + "primary.operatorType[=][String]", "E");
    QueryConditions qc = new QueryConditions();
    qc.addCondition("primary.moudleId", "=", Long.valueOf(Long.parseLong(this.type)));
    List logCataLogList = this.logCataLogSearchService.getList(qc, null);
    qc.addCondition("primary.cataLogId", "<", Long.valueOf(Long.parseLong("2200")));
    List bankLogList = this.logCataLogSearchService.getList(qc, null);
    request.setAttribute("logCataLogList", logCataLogList);
    request.setAttribute("bankLogList", bankLogList);
    String result = invocation.invoke();
    return result;
  }
}
