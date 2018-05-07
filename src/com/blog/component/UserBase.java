package com.blog.component;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public abstract class UserBase<M extends UserBase<M>> extends Model<M> implements IBean {
	public void setId(String id) {
		set("id", id);
	}
	public String getId() {
		return get("id");
	}
	public void setName(String name) {
		set("name", name);
	}
	public String getName() {
		return get("name");
	}
	public void setPassword(String password) {
		set("password", password);
	}
	public String getPassword() {
		return get("password");
	}
	  
	public void setPhoneOrEmail(String phoneoremail) {
		set("phoneoremail", phoneoremail);
	}
	public String getPhoneOrEmail() {
		return get("phoneoremail");
	}
	public void setType(String type) {
		set("phoneoremail", type);
	}
	public String getType() {
		return get("type");
	}
}
