<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    
    <head>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
        <title>Forms</title>
        <!-- Bootstrap -->
        <link href="<%=basePath%>/view/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="<%=basePath%>/view/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
        <link href="<%=basePath%>/view/assets/styles.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>/view/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css"></link>
        <link href="<%=basePath%>/view/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="<%=basePath%>/view/assets/styles.css" rel="stylesheet" media="screen">
        <link rel="shortcut icon" href="<%=basePath%>/view/images/title.ico" /> 
        <script src="<%=basePath%>/view/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="vendors/flot/excanvas.min.js"></script><![endif]-->
        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="<%=basePath%>/view/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
    </head>
    
    <body>
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">Admin Panel</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown"> <i class="icon-user"></i> Vincent Gabriel <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Profile</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="login.html">Logout</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="active">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown" class="dropdown-toggle">Settings <b class="caret"></b>

                                </a>
                                <ul class="dropdown-menu" id="menu1">
                                    <li>
                                        <a href="#">Tools <i class="icon-arrow-right"></i>

                                        </a>
                                        <ul class="dropdown-menu sub-menu">
                                            <li>
                                                <a href="#">Reports</a>
                                            </li>
                                            <li>
                                                <a href="#">Logs</a>
                                            </li>
                                            <li>
                                                <a href="#">Errors</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <a href="#">SEO Settings</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                    <li>
                                        <a href="#">Other Link</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Content <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">Blog</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">News</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Custom Pages</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Calendar</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="#">FAQ</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Users <i class="caret"></i>

                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="#">User List</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Search</a>
                                    </li>
                                    <li>
                                        <a tabindex="-1" href="#">Permissions</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row-fluid">
                <div class="span3" id="sidebar">
                    <ul class="nav nav-list bs-docs-sidenav nav-collapse collapse">
						<li>
                            <a href="<%=basePath%>/platform"><i class="icon-chevron-right"></i> 基本信息</a>
                        </li>
                        <li class="active">
                            <a href="<%=basePath%>/platformform"><i class="icon-chevron-right"></i> 撰写博客</a>
                        </li>                          
                    </ul>
                </div>      
                <!--/span-->
                <div class="span9" id="content">
                      <!-- morris stacked chart -->
                    <div class="row-fluid">
                        <!-- block -->
                        <div class="block">
                            <div class="navbar navbar-inner block-header">
                                <div class="muted pull-left">撰写博客</div>
                            </div>
                            <div class="block-content collapse in">
                                <div class="span12">
                                     <form class="form-horizontal" action="<%=basePath%>/admin/updata" method="post" enctype="multipart/form-data">
                                      <fieldset>
                                        <legend>撰写博客</legend>
                                          <div class="control-group">
                                          <div class="controls">                                         	
                                            <input class="input-xlarge focused" id="id" name="id" type="hidden" value="${b.id }">
                                          </div>
                                        </div>
                                        <div class="control-group">
                                          <label class="control-label" for="focusedInput">标题</label>
                                          <div class="controls">                                         	
                                            <input class="input-xlarge focused" id="focusedInput" name="title" type="text" value="${b.title }">
                                          </div>
                                        </div> 
                                         <div class="control-group">
                                          <label class="control-label" for="fileInput">封面</label>
                                          <div class="controls">
                                            <input class="input-file uniform_on" id="fileInput" type="file" name="fileInput">
                                          </div>
                                        </div>
						                <div class="span12" id="content">
						                    <div class="row-fluid">
						                        <!-- block -->
						                        <div class="block">
						                            <div class="navbar navbar-inner block-header">
						                                <div class="muted pull-left">文章简介</div>
						                            </div>
						                            <div class="block-content collapse in">
						                               <textarea id="ckeditor_standard" name="ckeditor_standard" >${b.brief }</textarea>
						                            </div>
						                        </div>
						                        <!-- /block -->
						                    </div>
						                </div>             
						                 <div class="span10">
						                	<div class="row-fluid">
								                <div class="span12" id="content">
								                    <div class="row-fluid">
								                        <!-- block -->
								                        <div class="block">
								                            <div class="navbar navbar-inner block-header">
								                                <div class="muted pull-left">主要内容</div>
								                            </div>
								                            <div class="block-content collapse in">
								                               <textarea id="ckeditor_full" name="content">${b.content }</textarea>
								                            </div>
								                        </div>
								                    </div>
								                </div>
						
						                	</div>
						                </div>                                      
                                          <div class="controls">
                                            <select id="selectError" name="selectError">
                                              <option value="1">html</option>
                                              <option value="2">java</option>
                                              <option value="3">javascript</option>
                                              <option value="4">python</option>
                                              <option value="5">日常</option>
                                            </select>
                                            <span class="help-inline">选择分类</span>
                                          </div>
                                        <div class="control-group">
                                          <label class="control-label" for="optionsCheckbox2">是否置顶：</label>
                                          <div class="controls">
                                            <label>
                                              <input type="checkbox" id="optionsCheckbox2" value="1" name="checkbox">                                                                                                    
                                            </label>
                                          </div>
                                        </div>
                                        <div class="form-actions">
                                          <button type="submit" class="btn btn-primary">保存并发布</button>
                                        </div>
                                      </fieldset>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>  
     		 </div>    
            <hr>
            <footer>
                <p>&copy; Vincent Gabriel 2013 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="cssmoban">cssmoban</a>
            </footer>
        </div>

        <script src="<%=basePath%>/view/vendors/jquery-1.9.1.js"></script>
        <script src="<%=basePath%>/view/bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>/view/vendors/jquery.uniform.min.js"></script>
        <script src="<%=basePath%>/view/vendors/chosen.jquery.min.js"></script>
        <script src="<%=basePath%>/view/vendors/bootstrap-datepicker.js"></script>

        <script src="<%=basePath%>/view/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="<%=basePath%>/view/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

        <script src="<%=basePath%>/view/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

		<script type="text/javascript" src="<%=basePath%>/view/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
		<script src="<%=basePath%>/view/assets/form-validation.js"></script>
     	<script src="<%=basePath%>/view/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="<%=basePath%>/view/vendors/jquery-1.9.1.min.js"></script>
        <script src="<%=basePath%>/view/bootstrap/js/bootstrap.min.js"></script>
		<script src="<%=basePath%>/view/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>

		<script src="<%=basePath%>/view/vendors/ckeditor/ckeditor.js"></script>
		<script src="<%=basePath%>/view/vendors/ckeditor/adapters/jquery.js"></script>

		<script type="text/javascript" src="<%=basePath%>/view/vendors/tinymce/js/tinymce/tinymce.min.js"></script>

        <script src="<%=basePath%>/view/assets/scripts.js"></script>
        <script>
        $(function(){
        	 $("input[type='checkbox']").click(function(){
                 $.ajax({
                     type: "GET",
                     url: "<%=basePath%>/counts",
                     dataType: "text",
                     success: function(data){
                    	 var j = parseInt(data);
                    	 if(data>=3){                    		 
                    		 $("input[type='checkbox']").attr({checked:"false",disabled:"true"}); 
                    	 }
                     }
                 });
            });
        });
        
        $(function() {
            // Bootstrap
            $('#bootstrap-editor').wysihtml5();

            // Ckeditor standard
            $( 'textarea#ckeditor_standard' ).ckeditor({width:'98%', height: '150px', toolbar: [
				{ name: 'document', items: [ 'Source', '-', 'NewPage', 'Preview', '-', 'Templates' ] },	// Defines toolbar group with name (used to create voice label) and items in 3 subgroups.
				[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ],			// Defines toolbar group without name.
				{ name: 'basicstyles', items: [ 'Bold', 'Italic' ] }
			]});
            $( 'textarea#ckeditor_full' ).ckeditor({width:'98%', height: '150px'});
        });

        // Tiny MCE
        tinymce.init({
		    selector: "#tinymce_basic",
		    plugins: [
		        "advlist autolink lists link image charmap print preview anchor",
		        "searchreplace visualblocks code fullscreen",
		        "insertdatetime media table contextmenu paste"
		    ],
		    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
		});

		// Tiny MCE
        tinymce.init({
		    selector: "#tinymce_full",
		    plugins: [
		        "advlist autolink lists link image charmap print preview hr anchor pagebreak",
		        "searchreplace wordcount visualblocks visualchars code fullscreen",
		        "insertdatetime media nonbreaking save table contextmenu directionality",
		        "emoticons template paste textcolor"
		    ],
		    toolbar1: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image",
		    toolbar2: "print preview media | forecolor backcolor emoticons",
		    image_advtab: true,
		    templates: [
		        {title: 'Test template 1', content: 'Test 1'},
		        {title: 'Test template 2', content: 'Test 2'}
		    ]
		});

        </script>   
	<script src="<%=basePath%>/view/assets/scripts.js"></script>
        <script>

	jQuery(document).ready(function() {   
	   FormValidation.init();
	});
	

        $(function() {
            $(".datepicker").datepicker();
            $(".uniform_on").uniform();
            $(".chzn-select").chosen();
            $('.textarea').wysihtml5();

            $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
                var $total = navigation.find('li').length;
                var $current = index+1;
                var $percent = ($current/$total) * 100;
                $('#rootwizard').find('.bar').css({width:$percent+'%'});
                // If it's the last tab then hide the last button and show the finish instead
                if($current >= $total) {
                    $('#rootwizard').find('.pager .next').hide();
                    $('#rootwizard').find('.pager .finish').show();
                    $('#rootwizard').find('.pager .finish').removeClass('disabled');
                } else {
                    $('#rootwizard').find('.pager .next').show();
                    $('#rootwizard').find('.pager .finish').hide();
                }
            }});
            $('#rootwizard .finish').click(function() {
                alert('Finished!, Starting over!');
                $('#rootwizard').find("a[href*='tab1']").trigger('click');
            });
        });
        </script>
    </body>

</html>