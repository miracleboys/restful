package restful.entity;

import javax.persistence.Entity;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "clothes")
@NamedQueries({
	@NamedQuery(name = "Clothes.findAll", query="SELECT clothes FROM Clothes clothes"),
	@NamedQuery(name = "Clothes.findByCode", query="SELECT clothes FROM Clothes clothes where clothes.code like :code")
	
})

public class Clothes  extends IdEntity{
	private String code;
	private String name;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
