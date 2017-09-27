<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<!-- Basic Page Needs -->
	<meta charset="utf-8">
	<title>Ask me – Responsive Questions and Answers Template</title>
	<meta name="description" content="Ask me Responsive Questions and Answers Template">
	<meta name="author" content="vbegy">
	
	<!-- Mobile Specific Metas -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Main Style -->
	<link rel="stylesheet" href="./resources/css/style.css">
	
	<!-- Skins -->
	<link rel="stylesheet" href="./resources/css/purple.css">
	
	<!-- Responsive Style -->
	<link rel="stylesheet" href="./resources/css/responsive.css">
	
	<!-- Favicons -->
	<link rel="shortcut icon" href="./resources/images/favicon_qs.png">
  
</head>
<body>
<jsp:include page="header.jsp" flush="false" />

	<div class="breadcrumbs">
		<section class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Shortcodes</h1>
				</div>
				<div class="col-md-12">
					<div class="crumbs">
						<a href="#">Home</a>
						<span class="crumbs-span">/</span>
						<span class="current">Shortcodes</span>
					</div>
				</div>
			</div><!-- End row -->
		</section><!-- End container -->
	</div><!-- End breadcrumbs -->
	
	<section class="container main-content page-left-sidebar">
		<div class="row">
			<div class="col-md-9">
				
				<div id="accordions" class="row">
					<div class="col-md-6">
						<div class="page-content page-shortcode">
							<div class="boxedtitle page-title"><h2>Accordions</h2></div>
							<div class="accordion">
							    <h4 class="accordion-title"><a href="#">Unlimited Colors</a></h4>
							    <div class="accordion-inner">
							        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
							    </div>
							    <h4 class="accordion-title"><a href="#">Responsive</a></h4>
							    <div class="accordion-inner">
							        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
							    </div>
							    <h4 class="accordion-title"><a href="#">Easy To Use</a></h4>
							    <div class="accordion-inner">
							        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
							    </div>
							</div>
						</div><!-- End page-content -->
					</div><!-- End Accordions -->
					<div class="col-md-6">
						<div class="page-content page-shortcode">
							<div class="boxedtitle page-title"><h2>Toggle</h2></div>
							<div class="accordion toggle-accordion">
							    <h4 class="accordion-title"><a href="#">Unlimited Colors</a></h4>
							    <div class="accordion-inner">
							        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
							    </div>
							    <h4 class="accordion-title"><a href="#">Responsive</a></h4>
							    <div class="accordion-inner">
							        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
							    </div>
							    <h4 class="accordion-title"><a href="#">Easy To Use</a></h4>
							    <div class="accordion-inner">
							        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
							    </div>
							</div>
						</div><!-- End page-content -->
					</div><!-- End Toggle -->
					
					<div class="col-md-12">
						<div class="gap"></div>
						<div class="divider"><span></span></div>
					</div>
					
					<div class="col-md-6">
						<div class="page-content page-shortcode">
							<div class="boxedtitle page-title"><h2>Tabs horizontal</h2></div>
							<div class="tabs-warp">
							    <ul class="tabs">
							        <li class="tab"><a href="#">Tab one</a></li>
							        <li class="tab"><a href="#">Tab two</a></li>
							        <li class="tab"><a href="#">Tab three</a></li>
							    </ul>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							            <p>1 - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.</p>
							        </div>
							    </div>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							            <p>2 - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.</p>
							        </div>
							    </div>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							            <p>3 - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.</p>
							        </div>
							    </div>
							</div>
						</div><!-- End page-content -->
					</div><!-- Tabs horizontal -->
					<div class="col-md-6">
						<div class="page-content page-shortcode">
							<div class="boxedtitle page-title"><h2>Tabs Vertical</h2></div>
							<div class="tabs-warp tabs-vertical">
							    <ul class="tabs">
							        <li class="tab"><a href="#">Tab one</a></li>
							        <li class="tab"><a href="#">Tab two</a></li>
							        <li class="tab"><a href="#">Tab three</a></li>
							    </ul>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							            <p>1 - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.</p>
							        </div>
							    </div>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							            <p>2 - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.</p>
							        </div>
							    </div>
							    <div class="tab-inner-warp">
							    	<div class="tab-inner">
							            <p>3 - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.</p>
							        </div>
							    </div>
							</div>
						</div><!-- End Tabs Vertical -->
					</div><!-- End page-content -->
				</div><!-- End #accordions -->
				
				<div class="gap"></div>
				<div class="divider"><span></span></div>
				
				<div id="alert" class="row">
					<div class="col-md-12">
						<div class="page-content page-shortcode">
							<div class="boxedtitle page-title"><h2>Alert Boxes</h2></div>
							<div class="alert-message success">
							    <i class="icon-ok"></i>
							    <p><span>success message</span><br>
							    You successfully read this important message.</p>
							</div>
							
						    <div class="alert-message info">
						        <i class="icon-bullhorn"></i>
						        <p><span>success message</span><br>
						        This alert needs your attention.</p>
						    </div>
						    <div class="alert-message warning">
						        <i class="icon-exclamation-sign"></i>
						        <p><span>success message</span><br>
						        Warning! Best check yo self.</p>
						    </div>
						    
						    <div class="alert-message error">
						        <i class="icon-flag"></i>
						        <p><span>success message</span><br>
						        Oh snap! Change a few things up.</p>
						    </div>
						</div><!-- End page-content -->
					</div>
				</div><!-- End #alert -->
				
				<div class="gap"></div>
				<div class="divider"><span></span></div>
				
				<div id="buttons" class="row t_center">
					
					<div class="col-md-12"><div class="boxedtitle page-title"><h2 class="t_left">Buttons</h2></div></div>
					
					<div class="col-md-3">
						<a href="#" class="button large green-button">Large button</a>
						<a href="#" class="button medium green-button">Medium button</a>
						<a href="#" class="button small green-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large lime-green-button">Large button</a>
						<a href="#" class="button medium lime-green-button">Medium button</a>
						<a href="#" class="button small lime-green-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large orange-button">Large button</a>
						<a href="#" class="button medium orange-button">Medium button</a>
						<a href="#" class="button small orange-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large dark-blue-button">Large button</a>
						<a href="#" class="button medium dark-blue-button">Medium button</a>
						<a href="#" class="button small dark-blue-button">Small button</a>
					</div>
					
					<div class="clearfix"></div>
					<div class="gap"></div>
					
					<div class="col-md-3">
						<a href="#" class="button large blue-button">Large button</a>
						<a href="#" class="button medium blue-button">Medium button</a>
						<a href="#" class="button small blue-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large red-button">Large button</a>
						<a href="#" class="button medium red-button">Medium button</a>
						<a href="#" class="button small red-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large yellow-button">Large button</a>
						<a href="#" class="button medium yellow-button">Medium button</a>
						<a href="#" class="button small yellow-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large gray-button">Large button</a>
						<a href="#" class="button medium gray-button">Medium button</a>
						<a href="#" class="button small gray-button">Small button</a>
					</div>
					
					<div class="clearfix"></div>
					<div class="gap"></div>
					
					<div class="col-md-12"><div class="boxedtitle page-title"><h2 class="t_left">Buttons ( Custom Color )</h2></div></div>
					
					<div class="col-md-3">
						<a href="#" class="button large green-button custom-button">Large button</a>
						<a href="#" class="button medium green-button custom-button">Medium button</a>
						<a href="#" class="button small green-button custom-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large lime-green-button custom-button">Large button</a>
						<a href="#" class="button medium lime-green-button custom-button">Medium button</a>
						<a href="#" class="button small lime-green-button custom-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large orange-button custom-button">Large button</a>
						<a href="#" class="button medium orange-button custom-button">Medium button</a>
						<a href="#" class="button small orange-button custom-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large dark-blue-button custom-button">Large button</a>
						<a href="#" class="button medium dark-blue-button custom-button">Medium button</a>
						<a href="#" class="button small dark-blue-button custom-button">Small button</a>
					</div>
					
					<div class="clearfix"></div>
					<div class="gap"></div>
					
					<div class="col-md-3">
						<a href="#" class="button large blue-button custom-button">Large button</a>
						<a href="#" class="button medium blue-button custom-button">Medium button</a>
						<a href="#" class="button small blue-button custom-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large red-button custom-button">Large button</a>
						<a href="#" class="button medium red-button custom-button">Medium button</a>
						<a href="#" class="button small red-button custom-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large yellow-button custom-button">Large button</a>
						<a href="#" class="button medium yellow-button custom-button">Medium button</a>
						<a href="#" class="button small yellow-button custom-button">Small button</a>
					</div>
					<div class="col-md-3">
						<a href="#" class="button large gray-button custom-button">Large button</a>
						<a href="#" class="button medium gray-button custom-button">Medium button</a>
						<a href="#" class="button small gray-button custom-button">Small button</a>
					</div>
					
					<div class="clearfix"></div>
					<div class="gap"></div>
					
				</div><!-- End #Buttons -->
				
				<div class="divider"><span></span></div>
				
				<div id="testimonial" class="row">
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Testimonial</h2></div></div>
					<div class="col-md-4">
						<div class="carousel-all testimonial-carousel" carousel_auto="true" carousel_responsive="false" carousel_effect="scroll">
							<div class="slides">
								<div class="testimonial-warp">
									<div class="testimonial">
										Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
										<span class="testimonial-f-arrow"></span>
										<span class="testimonial-l-arrow"></span>
									</div>
									<div class="testimonial-client">
										<span>Ahmed Hassan<span> , Developer</span></span>
									</div>
								</div>
								<div class="testimonial-warp">
									<div class="testimonial">
										Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
										<span class="testimonial-f-arrow"></span>
										<span class="testimonial-l-arrow"></span>
									</div>
									<div class="testimonial-client">
										<span>Ahmed Hassan<span> , Developer</span></span>
									</div>
								</div>
								<div class="testimonial-warp">
									<div class="testimonial">
										Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
										<span class="testimonial-f-arrow"></span>
										<span class="testimonial-l-arrow"></span>
									</div>
									<div class="testimonial-client">
										<span>Ahmed Hassan<span> , Developer</span></span>
									</div>
								</div>
						    </div>
						    <div class="carousel-pagination"></div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="carousel-all testimonial-carousel testimonial-warp-2" carousel_responsive="false" carousel_auto="false" carousel_effect="scroll">
							<div class="slides">
								<div class="testimonial-warp">
									<div class="testimonial">
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.
										<span class="testimonial-f-arrow"></span>
										<span class="testimonial-l-arrow"></span>
									</div>
									<div class="testimonial-client">
										<img src="http://placehold.it/60x60/222/FFF" alt="">
										<span>Ahmed Hassan<span> , Developer</span></span>
									</div>
								</div>
								<div class="testimonial-warp">
									<div class="testimonial">
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.
										<span class="testimonial-f-arrow"></span>
										<span class="testimonial-l-arrow"></span>
									</div>
									<div class="testimonial-client">
										<img src="http://placehold.it/60x60/222/FFF" alt="">
										<span>Ahmed Hassan<span> , Developer</span></span>
									</div>
								</div>
								<div class="testimonial-warp">
									<div class="testimonial">
										Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi.
										<span class="testimonial-f-arrow"></span>
										<span class="testimonial-l-arrow"></span>
									</div>
									<div class="testimonial-client">
										<img src="http://placehold.it/60x60/222/FFF" alt="">
										<span>Ahmed Hassan<span> , Developer</span></span>
									</div>
								</div>
						    </div>
						    <div class="carousel-pagination"></div>
						</div>
					</div>
				</div><!-- End #testimonial -->
				
				<div class="divider"><span></span></div>
				
				<div id="audio" class="row">
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Audio</h2></div></div>
					<div class="col-md-4">
						<div class="audio-soundcloud">
							<iframe width="100%" height="175" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https://soundcloud.com/abdelmagidelfrargy/yasser-aldosari-www-tvquran&amp;auto_play=false&amp;show_artwork=true&amp;color=21bc84&amp;theme_color=eef2f6"></iframe>
						</div>
					</div>
					<div class="col-md-8">
						<div class="audio-soundcloud">
							<iframe width="100%" height="175" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?url=https://soundcloud.com/abdelmagidelfrargy/yasser-aldosari-www-tvquran&amp;auto_play=false&amp;show_artwork=true&amp;color=354662&amp;theme_color=eef2f6"></iframe>
						</div>
					</div>
				</div><!-- End #audio -->
				
				<div class="divider"><span></span></div>
				
				<div id="dropcaps" class="row">
					<div class="col-md-12">
						<div class="page-content page-shortcode">
							<div class="boxedtitle page-title"><h2>Dropcaps</h2></div>
							<p><span class="dropcap">D</span>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Vivamus vulputate posuere nisl quis consequat. Donec congue commodo mi, sed commodo velit fringilla ac. Fusce placerat venenatis mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
						</div><!-- End page-content -->
					</div>
				</div><!-- End #dropcaps -->
				
				<div class="gap"></div>
				<div class="divider"><span></span></div>
				
				<div id="blockquote" class="row">
					<div class="col-md-12">
						<div class="boxedtitle page-title"><h2>Blockquote</h2></div>
						<blockquote>
							<p>Quisque ligulas ipsum, euismod atras vulputate iltricies etri elit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nulla nunc dui, tristique in semper vel, congue sed ligula.</p>
						</blockquote>
					</div>
				</div><!-- End #blockquote -->
				
				<div class="divider"><span></span></div>
				
				<div id="icons" class="row">
					<div class="col-md-12">
						<div class="boxedtitle page-title"><h2>Icons</h2></div>
						
						<div class="row icon_shortcode">
							<div class="col-md-3">
								<ul class="ul_icons">
									<li><i class="icon-cloud-download"></i> icon-cloud-download</li>
									<li><i class="icon-cloud-upload"></i> icon-cloud-upload</li>
									<li><i class="icon-lightbulb"></i> icon-lightbulb</li>
									<li><i class="icon-exchange"></i> icon-exchange</li>
									<li><i class="icon-bell-alt"></i> icon-bell-alt</li>
									<li><i class="icon-file-alt"></i> icon-file-alt</li>
									<li><i class="icon-beer"></i> icon-beer</li>
									<li><i class="icon-coffee"></i> icon-coffee</li>
									<li><i class="icon-food"></i> icon-food</li>
									<li><i class="icon-fighter-jet"></i> icon-fighter-jet</li>
								</ul>
							</div>
							<div class="col-md-3">
								<ul class="ul_icons">
									<li><i class="icon-user-md"></i> icon-user-md</li>
									<li><i class="icon-stethoscope"></i> icon-stethoscope</li>
									<li><i class="icon-suitcase"></i> icon-suitcase</li>
									<li><i class="icon-building"></i> icon-building</li>
									<li><i class="icon-hospital"></i> icon-hospital</li>
									<li><i class="icon-ambulance"></i> icon-ambulance</li>
									<li><i class="icon-medkit"></i> icon-medkit</li>
									<li><i class="icon-h-sign"></i> icon-h-sign</li>
									<li><i class="icon-plus-sign-alt"></i> icon-plus-sign-alt</li>
									<li><i class="icon-spinner"></i> icon-spinner</li>
								</ul>
							</div>
							<div class="col-md-3">
								<ul class="ul_icons">
									<li><i class="icon-angle-left"></i> icon-angle-left</li>
									<li><i class="icon-angle-right"></i> icon-angle-right</li>
									<li><i class="icon-angle-up"></i> icon-angle-up</li>
									<li><i class="icon-angle-down"></i> icon-angle-down</li>
									<li><i class="icon-double-angle-left"></i> icon-double-angle-left</li>
									<li><i class="icon-double-angle-right"></i> icon-double-angle-right</li>
									<li><i class="icon-double-angle-up"></i> icon-double-angle-up</li>
									<li><i class="icon-double-angle-down"></i> icon-double-angle-down</li>
									<li><i class="icon-circle-blank"></i> icon-circle-blank</li>
									<li><i class="icon-circle"></i> icon-circle</li>
								</ul>
							</div>
							<div class="col-md-3">
								<ul class="ul_icons">
									<li><i class="icon-desktop"></i> icon-desktop</li>
									<li><i class="icon-laptop"></i> icon-laptop</li>
									<li><i class="icon-tablet"></i> icon-tablet</li>
									<li><i class="icon-mobile-phone"></i> icon-mobile-phone</li>
									<li><i class="icon-quote-left"></i> icon-quote-left</li>
									<li><i class="icon-quote-right"></i> icon-quote-right</li>
									<li><i class="icon-reply"></i> icon-reply</li>
									<li><i class="icon-folder-close-alt"></i> icon-folder-close-alt</li>
									<li><i class="icon-folder-open-alt"></i> icon-folder-open-alt</li>
								</ul>
							</div>
						</div><!-- End row -->
						<div class="clearfix gap"></div>
						<blockquote>
							<p class="f_left padding_t_4">An easy use the icons at any style ( 350+ vector icons , 94 image icons ) .</p>
							<a class="color small button f_right margin_0" href="icons.html">Explorer All</a>
							<div class="clearfix"></div>
						</blockquote>
					</div>
					
					<div class="clearfix gap"></div>
					
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Icon Box</h2></div></div>
					<div class="col-md-4">
						<div class="page-content page-shortcode">
						    <div class="box_icon">
						        <span class="t_center icon_i"><span icon_size="120"><i i_color="#ff7361" i_hover="#34495e" class="icon-tint color_default"></i></span></span>
						        <div class="t_center">
						            <h3>Unlimited Colors</h3>
						            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio.</p>
						        </div>
						    </div>
					    </div>
					</div>
					<div class="col-md-4">
					    <div class="page-content page-shortcode">
					        <div class="box_icon">
						        <span class="t_center icon_i"><span icon_size="50" span_bg="#ff7361" span_hover="#34495e" class="icon_square"><i class="icon-desktop"></i></span></span>
						        <div class="t_center">
						            <h3>Responsive</h3>
						            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio.</p>
						        </div>
						    </div>
					    </div>
					</div>
					<div class="col-md-4">
					    <div class="page-content page-shortcode">
					        <div class="box_icon">
						        <span class="t_center icon_i"><span class="icon_circle" icon_size="50" span_bg="#ff7361" span_hover="#34495e"><i class="icon-bullhorn"></i></span></span>
						        <div class="t_center">
						            <h3>Easy To Use</h3>
						            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio.</p>
						        </div>
						    </div>
					    </div>
					    <div class="clearfix gap"></div>
					</div>
					
					<div class="col-md-6">
					    <div class="page-content page-shortcode">
					        <div class="box_icon">
						        <span class="icon_i"><span icon_align="left"><span class="icons icons-color"></span></span></span>
						        <div class="box_text">
						            <h3>Unlimited Colors</h3>
						            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio.</p>
						        </div>
						    </div>
					    </div>
					</div>
					<div class="col-md-6">
					    <div class="page-content page-shortcode">
					        <div class="box_icon">
						        <span class="icon_i"><span icon_align="left"><span class="icons icons-mac-alternative"></span></span></span>
						        <div class="box_text">
						            <h3>Responsive</h3>
						            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio.</p>
						        </div>
						    </div>
					    </div>
					</div>
				</div><!-- End #icons -->
				
				<div class="gap"></div>
				<div class="divider"><span></span></div>
				
				<div id="contact" class="row">
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Contact Forms</h2></div></div>
					<div class="col-md-8">
						<div class="page-content">
						    <form class="form-style form-style-3 form-style-5">
								<div class="form-inputs clearfix">
									<p>
										<label class="required">Name<span>*</span></label>
										<input type="text" value="" aria-required="true">
									</p>
									<p>
										<label class="required">E-Mail<span>*</span></label>
										<input type="text" value="" aria-required="true">
									</p>
									<p>
										<label>Website</label>
										<input type="text" value="">
									</p>
								</div>
								<div class="form-textarea">
									<p>
										<label class="required">Message<span>*</span></label>
										<textarea aria-required="true" cols="58" rows="5"></textarea>
									</p>
								</div>
								<p class="form-submit">
									<input name="submit" type="submit" value="Submit" class="submit button medium color">
								</p>
							</form>
						</div>
					</div>
					<div class="col-md-4">
						<div class="page-content">
						    <form class="form-style form-style-3">
								<div class="form-inputs clearfix">
									<p>
										<input type="text" aria-required="true" value="Name" onfocus="if(this.value=='Name')this.value='';" onblur="if(this.value=='')this.value='Name';">
									</p>
									<p>
										<input type="text" aria-required="true" value="E-Mail" onfocus="if(this.value=='E-Mail')this.value='';" onblur="if(this.value=='')this.value='E-Mail';">
									</p>
									<p>
										<input type="text" value="Website" onfocus="if(this.value=='Website')this.value='';" onblur="if(this.value=='')this.value='Website';">
									</p>
								</div>
								<div class="form-textarea">
									<p>
										<textarea aria-required="true" cols="58" rows="5" onfocus="if(this.value=='Message')this.value='';" onblur="if(this.value=='')this.value='Message';">Message</textarea>
									</p>
								</div>
								<p class="form-submit">
									<input name="submit" type="submit" value="Submit" class="submit button medium color">
								</p>
							</form>
						</div>
						<div class="cleaffix gap"></div>
					</div>
				</div><!-- End #contact -->
				
				<div class="divider"><span></span></div>
				
				<div id="bullet" class="row">
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Bullet and Lists</h2></div></div>
					<div class="col-md-4">
						<div class="ul_list">
						    <ul>
						        <li>Unlimited Colors</li>
						        <li>Responsive</li>
						        <li>Easy To Use</li>
						        <li>Retina ready</li>
						        <li>Excellent Support</li>
							</ul>
						</div>
					</div>
					<div class="col-md-4">
						<div class="ul_list_default">
						    <ol>
						        <li><i></i>Unlimited Colors</li>
						        <li><i></i>Responsive</li>
						        <li><i></i>Easy To Use</li>
						        <li><i></i>Retina ready</li>
						        <li><i></i>Excellent Support</li>
							</ol>
						</div>
					</div>
					<div class="col-md-4">
						<div class="ul_list ul_list-icon-ok ul_list_circle" list_background="#1abc9c" list_background_hover="#34495E" list_color="#FFF">
							<ul>
								<li><i l_background="#ff7361" l_background_hover="#34495E" class="icon-ok ul_l_circle"></i>Unlimited Colors</li>
								<li><i l_background="#f39c12" l_background_hover="#34495E" class="icon-thumbs-up ul_l_circle"></i>Responsive</li>
								<li><i l_background="#3498db" l_background_hover="#34495E" class="icon-ok-sign ul_l_circle"></i>Easy To Use</li>
								<li><i l_background="#e74c3c" l_background_hover="#34495E" class="icon-star ul_l_circle"></i>Retina ready</li>
								<li><i l_background="#f1c40f" l_background_hover="#34495E" class="icon-star-empty ul_l_circle"></i>Excellent Support</li>
							</ul>
						</div>
					</div>
				</div><!-- End #bullet -->
				
				<div class="divider"><span></span></div>
				
				<div id="progess" class="row">
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Progess Bars</h2></div></div>
					<div class="col-md-6">
						<div class="progressbar-warp">
						    
						    <span class="progressbar-title">PHP 90%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" attr-percent="90"></div>
						    </div>
						    
						    <span class="progressbar-title">WordPress 95%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" attr-percent="95"></div>
						    </div>
						    
						    <span class="progressbar-title">HTML 95%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" attr-percent="95"></div>
						    </div>
						    
						    <span class="progressbar-title">CSS 80%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" attr-percent="80"></div>
						    </div>
						    
						    <span class="progressbar-title">JavaScript 50%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" attr-percent="50"></div>
						    </div>
						    
						</div><!-- End progressbar-warp -->
					</div>
					<div class="col-md-6">
						<div class="progressbar-warp">
						    
						    <span class="progressbar-title">PHP 90%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" style="background-color: #C54133;" attr-percent="90"></div>
						    </div>
						    
						    <span class="progressbar-title">WordPress 95%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" style="background-color: #81519c;" attr-percent="95"></div>
						    </div>
						    
						    <span class="progressbar-title">HTML 95%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" style="background-color: #37b8eb;" attr-percent="95"></div>
						    </div>
						    
						    <span class="progressbar-title">CSS 80%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" style="background-color: #ee7e2a;" attr-percent="80"></div>
						    </div>
						    
						    <span class="progressbar-title">JavaScript 50%</span>
						    <div class="progressbar">
						        <div class="progressbar-percent" style="background-color: #4b4c4d;" attr-percent="50"></div>
						    </div>
						    
						</div><!-- End progressbar-warp -->
					</div>
				</div><!-- End #progess -->
				
				<div class="divider"><span></span></div>
				
				<div id="slideShow" class="row">
					<div class="col-md-12">
						<div class="boxedtitle page-title"><h2>SlideShow</h2></div>
						<div class="flexslider flex-slider">
						    <ul class="slides">
						        <li>
						        	<img src="http://placehold.it/810x500/222/FFF" alt="">
						        	<div class="flex-caption">
						        		<div class="text">
						        			<div class="flex_title"><h2>Lorem Ipsum</h2></div>
						        			<div class="flex_subtitle"><h3>simply dummy text of the printing and
						        			typesetting industry</h3></div>
						        		</div>
						        	</div>
						        </li>
						        <li>
						        	<img src="http://placehold.it/810x500/555/FFF" alt="">
						        	<div class="flex-caption">
						        		<div class="text">
						        			<div class="flex_title"><h2>Lorem Ipsum</h2></div>
						        			<div class="flex_subtitle"><h3>simply dummy text of the printing and
						        			typesetting industry</h3></div>
						        		</div>
						        	</div>
						        </li>
						    </ul>
						</div><!-- End flexslider -->
						
						<div class="clearfix gap"></div>
						
						<div class="bxslider">
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
							<div class="slide">
								<div class="grid-bxslider">
									<div class="bxslider-overlay t_center">
								        <a href="#" class="bxslider-title">
									        <h4>Lorem Ipsum</h4>
									        <span>Letraset sheets containing</span>
								        </a>
									    <a href="http://placehold.it/810x500/222/FFF" class="prettyPhoto" rel="prettyPhoto"><span class="overlay-lightbox"><i class="icon-search"></i></span></a>
									    <a href="#"><span class="overlay-link"><i class="icon-link"></i></span></a>
									</div>
									<img src="http://placehold.it/190x120/222/FFF" alt="">
								</div>
							</div>
						</div>
						
					</div>
				</div><!-- End #slideShow -->
				
				<div class="divider"><span></span></div>
				
				<div id="video" class="row">
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Video</h2></div></div>
					
					<div class="col-md-6">
						<div class="video_embed">
							<iframe width="600" height="300" src="http://www.youtube.com/embed/JuyB7NO0EYY"></iframe>
						</div>
					</div>
					<div class="col-md-6">
						<div class="video_embed">
<!-- 							<iframe width="600" height="300" src="http://www.dailymotion.com/swf/video/xu06ye_slim-time_shortfilms"></iframe> -->
						</div>
					</div>
					
					<div class="clearfix gap"></div>
					
					<div class="col-md-12">
						<div class="video_embed">
							<iframe width="600" height="600" src="http://player.vimeo.com/video/7830992"></iframe>
						</div>
					</div>
				</div><!-- End #video -->
				
				<div class="divider"><span></span></div>
				
				<div id="columns" class="row">
					<div class="col-md-12"><div class="boxedtitle page-title"><h2>Columns</h2></div></div>
					<div class="col-md-6">
						<h5>1/2</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
						</p>
					</div>
					<div class="col-md-6">
						<h5>1/2</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
						</p>
						<div class="clearfix gap"></div>
					</div>
				
					<div class="col-md-4">
						<h5>1/3</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
						</p>
					</div>
					<div class="col-md-4">
						<h5>1/3</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
						</p>
					</div>
					<div class="col-md-4">
						<h5>1/3</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat.
						</p>
						<div class="clearfix gap"></div>
					</div>
					
					<div class="col-md-3">
						<h5>1/4</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque.
						</p>
					</div>
					<div class="col-md-3">
						<h5>1/4</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque.
						</p>
					</div>
					<div class="col-md-3">
						<h5>1/4</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque.
						</p>
					</div>
					<div class="col-md-3">
						<h5>1/4</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque.
						</p>
						<div class="clearfix gap"></div>
					</div>
					
					<div class="col-md-3">
						<h5>1/4</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque.
						</p>
					</div>
					<div class="col-md-9">
						<h5>3/4</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						</p>
						<div class="clearfix gap"></div>
					</div>
					
					<div class="col-md-4">
						<h5>1/3</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque.
						</p>
					</div>
					<div class="col-md-8">
						<h5>2/3</h5>
						<p>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu. Fusce viverra neque at purus laoreet consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi adipiscing gravida odio, sit amet suscipit risus ultrices eu.
						</p>
						<div class="clearfix gap"></div>
					</div>
					
				</div><!-- End #columns -->
				
			</div><!-- End main -->
			<aside class="col-md-3 sidebar">
				<div class="widget widget_menu widget_menu_jquery">
					<ul>
						<li class="current_page_item"><a href="#accordions"><i class="icon-reorder"></i>Accordions & Toggle & Taps</a></li>
						<div class="accordion">
						<li class="accordion-title"><a href="#alert"><i class="icon-bullhorn"></i>教育・学習</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">乳幼児教育</a></li>
								<li><a href="">小学校</a></li>
								<li><a href="">中学校</a></li>
								<li><a href="">高等学校</a></li>
								<li><a href="">大学</a></li>
								<li><a href="">留学</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#buttons"><i class="icon-link"></i>IT</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">コンピューター</a></li>
								<li><a href="">ハードウェア</a></li>
								<li><a href="">ソフトウェア</a></li>
								<li><a href="">OS</a></li>
								<li><a href="">プログラミング</a></li>
								<li><a href="">ウェブサイト</a></li>
								<li><a href="">インターネット</a></li>
								<li><a href="">通信ネットワーク</a></li>
								<li><a href="">放送通信</a></li>
								<li><a href="">保安</a></li>
								<li><a href="">IT資格試験</a></li>
								<li><a href="">アプリケーション</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#testimonial"><i class="icon-thumbs-up"></i>ゲーム</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">RPGゲーム</a></li>
								<li><a href="">シミュレーションゲーム</a></li>
								<li><a href="">シューティングゲーム</a></li>
								<li><a href="">アクションゲーム</a></li>
								<li><a href="">レーシングゲーム</a></li>
								<li><a href="">スポーツゲーム</a></li>
								<li><a href="">ボード・パズルゲーム</a></li>
								<li><a href="">モバゲー</a></li>
								<li><a href="">ビデオゲーム</a></li>
								<li><a href="">ゲーマー</a></li>
								<li><a href="">インディーズゲーム</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#audio"><i class="icon-music"></i>エンタテインメント</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">TV・ラジオ</a></li>
								<li><a href="">音楽</a></li>
								<li><a href="">映画</a></li>
								<li><a href="">アニメ</a></li>
								<li><a href="">漫画</a></li>
								<li><a href="">ビデオ・DVD</a></li>
								<li><a href="">演劇</a></li>
								<li><a href="">ミュージカル</a></li>
								<li><a href="">オペラ</a></li>
								<li><a href="">ダンス</a></li>
								<li><a href="">美術</a></li>
								<li><a href="">デザイン</a></li>
								<li><a href="">写真</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#dropcaps"><i class="icon-bold"></i>生活</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">飲食</a></li>
								<li><a href="">美容</a></li>
								<li><a href="">ファッション</a></li>
								<li><a href="">ペット</a></li>
								<li><a href="">インテリア</a></li>
								<li><a href="">車</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#blockquote"><i class="icon-quote-left"></i>健康</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">歯学</a></li>
								<li><a href="">薬学</a></li>
								<li><a href="">栄養学</a></li>
								<li><a href="">運動</a></li>
								<li><a href="">医療</a></li>
								<li><a href="">保険</a></li>
								<li><a href="">健康常識</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#icons"><i class="icon-star-empty"></i>社会・政治</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">行政</a></li>
								<li><a href="">法律</a></li>
								<li><a href="">国防</a></li>
								<li><a href="">外交</a></li>
								<li><a href="">選挙</a></li>
								<li><a href="">雇用・労働</a></li>
								<li><a href="">宗教</a></li>
								<li><a href="">福祉</a></li>
								<li><a href="">環境</a></li>
								<li><a href="">災害</a></li>
								<li><a href="">社会文化</a></li>
								<li><a href="">機関・団体・人物</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#contact"><i class="icon-envelope"></i>経済</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">金融</a></li>
								<li><a href="">不動産</a></li>
								<li><a href="">税務</a></li>
								<li><a href="">経営</a></li>
								<li><a href="">貿易</a></li>
								<li><a href="">就職</a></li>
								<li><a href="">創業</a></li>
								<li><a href="">経済制度</a></li>
								<li><a href="">経済動向</a></li>
								<li><a href="">経済団体</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#bullet"><i class="icon-list"></i>旅行</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">国内旅行</a></li>
								<li><a href="">海外旅行</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#progess"><i class="icon-tasks"></i>スポーツ</a></li>
							<div class="accordion-inner">
							<ul>
								<li><a href="">球技スポーツ</a></li>
								<li><a href="">陸上・水上スポーツ</a></li>
								<li><a href="">ウインタースポーツ</a></li>
								<li><a href="">武芸</a></li>
								<li><a href="">レジャー</a></li>
							</ul>
							</div>
						<li class="accordion-title"><a href="#slideShow"><i class="icon-picture"></i>SlideShow</a></li>
						<li><a href="#video"><i class="icon-film"></i>video</a></li>
						<li><a href="#columns"><i class="icon-table"></i>Columns</a></li>
						</div>
					</ul>
				</div><!-- End widget_menu -->
			</aside><!-- End sidebar -->
		</div><!-- End row -->
	</section><!-- End container -->
	<jsp:include page="footer.jsp" flush="false" />
</div><!-- End wrap -->

<div class="go-up"><i class="icon-chevron-up"></i></div>

<!-- js -->
<script src="./resources/js/jquery.min.js"></script>
<script src="./resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="./resources/js/jquery.easing.1.3.min.js"></script>
<script src="./resources/js/html5.js"></script>
<script src="./resources/js/twitter/jquery.tweet.js"></script> 
<script src="./resources/js/jflickrfeed.min.js"></script>
<script src="./resources/js/jquery.inview.min.js"></script>
<script src="./resources/js/jquery.tipsy.js"></script>
<script src="./resources/js/tabs.js"></script>
<script src="./resources/js/jquery.flexslider.js"></script>
<script src="./resources/js/jquery.prettyPhoto.js"></script>
<script src="./resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script src="./resources/js/jquery.scrollTo.js"></script>
<script src="./resources/js/jquery.nav.js"></script>
<script src="./resources/js/tags.js"></script>
<script src="./resources/js/jquery.bxslider.min.js"></script>
<script src="./resources/js/custom.js"></script>
<!-- End js -->

</body>
</html>