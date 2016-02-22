package gnnt.MEBS.announcement.service;

import gnnt.MEBS.announcement.dao.TradeDao;
import gnnt.MEBS.announcement.model.Trade;
import gnnt.MEBS.base.query.hibernate.PageInfo;
import gnnt.MEBS.base.query.hibernate.QueryConditions;
import gnnt.MEBS.packaging.dao.BaseDao;
import gnnt.MEBS.packaging.service.BaseService;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("tradeService")
@Transactional(propagation=Propagation.REQUIRED, readOnly=false)
public class TradeService
  extends BaseService
{
  private final transient Log logger = LogFactory.getLog(TradeService.class);
  @Autowired
  @Qualifier("tradeDao")
  private TradeDao tradeDao;
  
  public BaseDao getDao()
  {
    return this.tradeDao;
  }
  
  public List<Trade> getTradeList(QueryConditions queryConditions, PageInfo pageInfo)
  {
    return this.tradeDao.getTradeList(queryConditions, pageInfo);
  }
}
