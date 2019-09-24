package bean;

public class CommercialDistrictsPerSellCategoriesDTO2 {
	private int year;
	private int quarter;
	private String sellCategoryName;
	private String commercialDistrictName;
	private long sellAmount;
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getQuarter() {
		return quarter;
	}
	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}
	public String getSellCategoryName() {
		return sellCategoryName;
	}
	public void setSellCategoryName(String sellCategoryName) {
		this.sellCategoryName = sellCategoryName;
	}
	public String getCommercialDistrictName() {
		return commercialDistrictName;
	}
	public void setCommercialDistrictName(String commercialDistrictName) {
		this.commercialDistrictName = commercialDistrictName;
	}
	public long getSellAmount() {
		return sellAmount;
	}
	public void setSellAmount(long sellAmount) {
		this.sellAmount = sellAmount;
	}
	
}
