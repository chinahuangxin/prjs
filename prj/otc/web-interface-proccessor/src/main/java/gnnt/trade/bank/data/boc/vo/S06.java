package gnnt.trade.bank.data.boc.vo;

import java.io.Serializable;

public class S06
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  private String BankNo;
  private String StrandsNo;
  private String TransAddressCode;
  private String TransDate;
  private String MachineAccount;
  private String TransFundAcc;
  private String ClientName;
  private String BusinessMark;
  private String MoneyType;
  private String RemitMark;
  private String DeliveryMoney;
  
  public String getBankNo()
  {
    return this.BankNo;
  }
  
  public void setBankNo(String bankNo)
  {
    this.BankNo = bankNo;
  }
  
  public String getStrandsNo()
  {
    return this.StrandsNo;
  }
  
  public void setStrandsNo(String strandsNo)
  {
    this.StrandsNo = strandsNo;
  }
  
  public String getTransAddressCode()
  {
    return this.TransAddressCode;
  }
  
  public void setTransAddressCode(String transAddressCode)
  {
    this.TransAddressCode = transAddressCode;
  }
  
  public String getTransDate()
  {
    return this.TransDate;
  }
  
  public void setTransDate(String transDate)
  {
    this.TransDate = transDate;
  }
  
  public String getMachineAccount()
  {
    return this.MachineAccount;
  }
  
  public void setMachineAccount(String machineAccount)
  {
    this.MachineAccount = machineAccount;
  }
  
  public String getTransFundAcc()
  {
    return this.TransFundAcc;
  }
  
  public void setTransFundAcc(String transFundAcc)
  {
    this.TransFundAcc = transFundAcc;
  }
  
  public String getClientName()
  {
    return this.ClientName;
  }
  
  public void setClientName(String clientName)
  {
    this.ClientName = clientName;
  }
  
  public String getBusinessMark()
  {
    return this.BusinessMark;
  }
  
  public void setBusinessMark(String businessMark)
  {
    this.BusinessMark = businessMark;
  }
  
  public String getMoneyType()
  {
    return this.MoneyType;
  }
  
  public void setMoneyType(String moneyType)
  {
    this.MoneyType = moneyType;
  }
  
  public String getRemitMark()
  {
    return this.RemitMark;
  }
  
  public void setRemitMark(String remitMark)
  {
    this.RemitMark = remitMark;
  }
  
  public String getDeliveryMoney()
  {
    return this.DeliveryMoney;
  }
  
  public void setDeliveryMoney(String deliveryMoney)
  {
    this.DeliveryMoney = deliveryMoney;
  }
}
