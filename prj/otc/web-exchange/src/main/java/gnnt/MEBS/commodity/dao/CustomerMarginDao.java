package gnnt.MEBS.commodity.dao;

import gnnt.MEBS.base.query.hibernate.PageInfo;
import gnnt.MEBS.base.query.hibernate.QueryConditions;
import gnnt.MEBS.commodity.model.Margin;
import gnnt.MEBS.packaging.dao.BaseDao;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Repository;

@Repository("customerMarginDao")
public class CustomerMarginDao
  extends BaseDao
{
  private final transient Log logger = LogFactory.getLog(CustomerMarginDao.class);
  
  public Class getEntityClass()
  {
    return new Margin().getClass();
  }
  
  public List<Margin> getList(QueryConditions conditions, PageInfo pageInfo)
  {
    String hql = "select new Margin(primary.commodityId,commodity.name,primary.firmId,customerinfo.firmId,primary.marginAlgr,primary.tradeMargin) from Margin as primary,Commodity as commodity,FirmVO as customerinfo where primary.commodityId=commodity.id and primary.firmId=customerinfo.firmId and customerinfo.firmType='C'";
    
    Object[] values = (Object[])null;
    String[] names = (String[])null;
    if ((conditions != null) && (conditions.getFieldsSqlClause() != null))
    {
      values = conditions.getValueArray();
      names = conditions.getNameArray();
      hql = hql + " and " + conditions.getFieldsSqlClause();
    }
    return queryByHQL(hql, names, values, pageInfo, null);
  }
}
