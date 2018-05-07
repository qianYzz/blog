package com.blog.common;

import com.blog.component.Blog;
import com.blog.component.Genre;
import com.blog.component.Model;
import com.blog.component.User;
import com.blog.component.Comment;
import com.blog.controller.BlogContollor;
import com.blog.controller.CommentController;
import com.blog.controller.MainContollor;
import com.blog.controller.ModelController;
import com.blog.controller.RenderController;
import com.blog.controller.UserController;
import com.blog.intercept.AuthInterceptor;
import com.blog.intercept.DemoHander;
import com.blog.service.RegisterService;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.ModelRecordElResolver;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;



public class WebConfig extends JFinalConfig{

	@Override
	public void configConstant(Constants me) {
		// TODO Auto-generated method stub
		me.setDevMode(true);
		me.setViewType(ViewType.JSP);
		me.setUrlParaSeparator("-");
		me.setBaseDownloadPath("/upload");
	}

	@Override
	public void configRoute(Routes me) {
		me.setBaseViewPath("/view");
		// TODO Auto-generated method stub UserController
		me.add("/login", UserController.class);
		me.add("/upload", ModelController.class);
		me.add("/", MainContollor.class);
		me.add("/render", RenderController.class);
		me.add("/regservice",RegisterService.class);
		me.add("/admin",BlogContollor.class);
		me.add("/comment",CommentController.class);
		
	}

	public void configEngine(Engine me) {
		// TODO Auto-generated method stub
/*		 me.addSharedFunction("/view/common/layout.html");
		 me.addSharedFunction("/view/common/paginate.html");
		 me.addSharedFunction("/view/admin/common/layout.html");*/
		 me.setDevMode(true);
	}

	@Override
	public void configPlugin(Plugins me) {
		// TODO Auto-generated method stub
		ModelRecordElResolver.setResolveBeanAsModel(true);
		PropKit.use("sviewconfig.txt");
		DruidPlugin dp = new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password"));
		me.add(dp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
		arp.addMapping("demo_model", "id" , Model.class);
		arp.addMapping("demo_user", "id" , User.class);
		arp.addMapping("demo_blog", "id" , Blog.class);
		arp.addMapping("demo_class", "id" , Genre.class);
		arp.addMapping("demo_comments","id",Comment.class);
		me.add(arp);
		me.add(new EhCachePlugin());
	}

	@Override
	public void configInterceptor(Interceptors me) {
		// TODO Auto-generated method stub
		/*me.add(new AuthInterceptor());*/
	}

	@Override
	public void configHandler(Handlers me) {
		// TODO Auto-generated method stub
		me.add(new DemoHander());
	}
}
