package com.blog.component;

import java.util.Date;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class BlogBase<M extends BlogBase<M>> extends Model<M> implements IBean {
	public void setId(String id) {
		set("id", id);
	}
	public String getId() {
		return get("id");
	}
	public void setTitle(String title) {
		set("title", title);
	}
	public String getTitle() {
		return get("title");
	}
	public void setContent(String content) {
		set("content", content);
	}
	public String getContent() {
		return get("content");
	}
	public void setCoverimagpath(String coverimagpath) {
		set("coverimagpath", coverimagpath);
	}
	public String getCoverimagpath() {
		return get("coverimagpath");
	}
	public void setImagename(String imagename) {
		set("imagename", imagename);
	}
	public String getImagename() {
		return get("imagename");
	}
	public void setCreateTime(String string) {
		set("createTime", string);
	}
	public String getCreateTime() {
		return get("createTime");
	}
	public void setClassid(String classid) {
		set("classid", classid);
	}
	public String getClassid() {
		return get("classid");
	}
	public void setBrief(String brief) {
		set("brief", brief);
	}
	public String getBrief() {
		return get("brief");
	}
	public void setViewcount(int viewcount) {
		set("viewcount", viewcount);
	}
	public int getViewcount() {
		return getInt("viewcount");
	}
	public void setTop(String top) {
		set("top", top);
	}
	public String getTop() {
		return get("top");
	}
}
