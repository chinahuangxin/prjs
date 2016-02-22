package gnnt.MEBS.account.service;

import gnnt.MEBS.account.dao.MemberInfoDao;
import gnnt.MEBS.account.model.MemberInfo;
import gnnt.MEBS.packaging.dao.BaseDao;
import gnnt.MEBS.packaging.service.BaseService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("memberInfoService")
@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
public class MemberInfoService
  extends BaseService<MemberInfo>
{
  private final transient Log logger = LogFactory.getLog(MemberInfoService.class);
  @Autowired
  @Qualifier("memberInfoDao")
  private MemberInfoDao memberInfoDao;
  
  public BaseDao<MemberInfo> getDao()
  {
    return this.memberInfoDao;
  }
}
