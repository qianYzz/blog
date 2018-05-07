package com.blog.component;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class CommentBase<M extends CommentBase<M>> extends Model<M> implements IBean {
	public void setId(String id) {
		set("id", id);
	}
	public String getId() {
		return get("id");
	}
	public void setComments(String comments) {
		set("comments", comments);
	}
	public String getComments() {
		return get("Comments");
	}
	public void setUserid(String userid) {
		set("userid", userid);
	}
	public String getUserid() {
		return get("userid");
	}
	public void setBlogid(String blogid) {
		set("blogid", blogid);
	}
	public String getBlogid() {
		return get("blogid");
	}
	public void setCreateTime(String string) {
		set("createTime", string);
	}
	public String getCreateTime() {
		return get("createTime");
	}
}
