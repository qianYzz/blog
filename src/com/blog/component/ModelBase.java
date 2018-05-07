package com.blog.component;

import java.util.Date;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings({"serial"})
public class  ModelBase<M extends ModelBase<M>> extends Model<M> implements IBean {
	public void setId(String id) {
		set("id", id);
	}
	public String getId() {
		return get("id");
	}
	public void setUserId(String id) {
		set("userId", id);
	}
	public String getUserId() {
		return get("userId");
	}
	public void setPath(String path) {
		set("path", path);
	}
	public String getPath() {
		return get("path");
	}
	public void setCreateTime(String string) {
		set("createTime", string);
	}
	public Date getCreateTime() {
		return get("createTime");
	}
	public void setFileName(String filename) {
		set("fileName", filename);
	}
	public Date getFileName() {
		return get("filename");
	}
	public void setType(String type) {
		set("type", type);
	}
	public Date getType() {
		return get("type");
	}	
}
