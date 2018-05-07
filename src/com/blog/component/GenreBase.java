package com.blog.component;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

@SuppressWarnings("serial")
public class GenreBase<M extends GenreBase<M>> extends Model<M> implements IBean {
	public void setId(String id) {
		set("id", id);
	}
	public String getId() {
		return get("id");
	}
	
	public void setGenre(String genre) {
		set("class", genre);
	}
	public String getGenre() {
		return get("genre");
	}
}
