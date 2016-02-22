package gnnt.MEBS.common.model;

import gnnt.MEBS.base.model.Clone;
import gnnt.MEBS.base.model.inner.ClassDiscription;
import java.util.Iterator;
import java.util.Set;

public class Role
  extends Clone
{
  private Long id;
  private String name;
  private String description;
  private String type;
  private Set<Right> rightSet;
  private Set<User> userSet;
  
  public Set<User> getUserSet()
  {
    return this.userSet;
  }
  
  public void setUserSet(Set<User> userSet)
  {
    this.userSet = userSet;
  }
  
  public String getType()
  {
    return this.type;
  }
  
  public void setType(String type)
  {
    this.type = type;
  }
  
  @ClassDiscription(key=true, keyWord=true, name="角色Id")
  public Long getId()
  {
    return this.id;
  }
  
  public void setId(Long id)
  {
    this.id = id;
  }
  
  @ClassDiscription(keyWord=true, name="角色名称")
  public String getName()
  {
    return this.name;
  }
  
  public void setName(String name)
  {
    this.name = name;
  }
  
  public Set<Right> getRightSet()
  {
    return this.rightSet;
  }
  
  public void setRightSet(Set<Right> rightSet)
  {
    this.rightSet = rightSet;
  }
  
  @ClassDiscription(name="角色描述")
  public String getDescription()
  {
    return this.description;
  }
  
  public void setDescription(String description)
  {
    this.description = description;
  }
  
  public void toRightSetIterator()
  {
    if (this.rightSet != null)
    {
      Right localRight;
      for (Iterator localIterator = this.rightSet.iterator(); localIterator.hasNext(); localRight = (Right)localIterator.next()) {}
    }
  }
  
  public void toUserSetIterator()
  {
    if (this.userSet != null)
    {
      User localUser;
      for (Iterator localIterator = this.userSet.iterator(); localIterator.hasNext(); localUser = (User)localIterator.next()) {}
    }
  }
  
  public void setPrimary(String primary)
  {
    this.id = Long.valueOf(Long.parseLong(primary));
  }
}
