<?php
/*
Plugin Name: WP-Menu
Plugin URI: http://www.vizioninteractive.com/
Description: Customizable hook to pull Page Navigation into a theme. Page Exclusion, Inclusion, Site Map, Top Level, Secondary menus and more
Author: Vizion Interactive, Inc
Version: 0.2.6
Author URI: http://www.vizioninteractive.com/
*/
function wp_menu($args='',$over='',$custom='')
	{
		$ret = "";
		parse_str($args,$params);
		$params['over'] = $over; // custom item effects; example: [onmouseover="dothis();" onmouseout="dothis();" style="inline-style:lol;"]
		if(!isset($params['return'])||($params['return']!=0&&$params['return']!=1))
			{
				$params['return'] = 0; // options: 0 = off / 1 = on
			}
		if(is_array($custom)){$params['custom'] = $custom;}
		else{$params['custom'] = array();}
		$ret = wp_menu_run($params);
		if($params['return']==0)
			{
				print $ret;
				return;
			}
		return $ret;
	}
function wp_menu_run($params='')
	{
		global $wp_query;
		if(!isset($params['nav_type'])||($params['nav_type']!="single"&&$params['nav_type']!="secondary"&&$params['nav_type']!="single_secondary"&&$params['nav_type']!="sitemap"))
			{
				$params['nav_type'] = "single"; // options: single / secondary / sitemap / single_secondary
			}
		if(!isset($params['nav_levels'])||(isset($params['nav_levels'])&&!is_numeric($params['nav_levels'])))
			{
				$params['nav_levels'] = 0; // options (int): 0 = all / 1+ = stop after level X
			}
		if(!isset($params['nav_tag'])||($params['nav_tag']!="ul"&&$params['nav_tag']!="ol"&&$params['nav_tag']!="dl"))
			{
				$params['nav_tag'] = "ul"; // options: ul / ol / dl
			}
		if(!isset($params['nav_class'])){$params['nav_class'] = "";} // assign a class="...." to navigation
		if(!isset($params['nav_id'])){$params['nav_id'] = "";} // assign an id="...." to navigation
		if(!isset($params['nav_wrap'])||($params['nav_wrap']!=0&&$params['nav_wrap']!=1))
			{
				$params['nav_wrap'] = 1; // options: 0 = off / 1 = on
			}
		if(!isset($params['div'])||($params['div']!=0&&$params['div']!=1&&isset($params['div'])))
			{
				$params['div'] = 0; // div wrapper on menu (int)
			}
		if(!isset($params['div_class'])){$params['div_class'] = "";} // <div class="....">
		if(!isset($params['div_id'])){$params['div_id'] = "";} // <div id="....">
		if(!isset($params['heading'])||($params['heading']!="h2"&&$params['heading']!="dt"&&$params['heading']!=0))
			{
				$params['heading'] = 0; // options: h2 / dt / 0
			}
		if(!isset($params['this_id'])||(isset($params['this_id'])&&!is_int((int)$params['this_id'])))
			{
				$params['this_id'] = $wp_query->post->ID; // change the active ID (int) referenced
			}
		if(!isset($params['parent_id'])||(isset($params['parent_id'])&&!is_int((int)$params['parent_id'])))
			{
				$params['parent_id'] = 0;
			}
		if(!isset($params['parent_href']))
			{
				$params['parent_href'] = wp_menu_get_href($params['parent_id']); // base the menus off of this href
			}
		if(!isset($params['link_titles'])||($params['link_titles']!=0&&$params['link_titles']!=1))
			{
				$params['link_titles'] = 1; // options: 0 = off / 1 = on
			}
		if(!isset($params['active'])||($params['active']!="item"&&$params['active']!="link"))
			{
				$params['active'] = "item"; // options: item / link (this is what the selected class gets applied to)
			}
		if(!isset($params['active_class'])){$params['active_class'] = "selected";} // gets added to an item that is "active"; for example: class="selected"
		if(!isset($params['unique_class'])){$params['unique_class'] = 0;} // current item's ID added to the class of the item; for example: class="prefix-PAGE_ID_HERE"
		if(!isset($params['unique_prefix'])){$params['unique_prefix'] = "wpmenu";} // gets added to the unique class (if on); for example: class="wpmenu-PAGE_ID_HERE"
		if(!isset($params['indent'])){$params['indent'] = "";} // just for the picky and OCD people -- \t character(s) to indent lines with; example: \t\t
		if(!isset($params['target'])){$params['target'] = "";} // <a href="/contact-us/" target="....">Link</a>
		if(!isset($params['accesskeys'])){$params['accesskeys'] = 1;} // Assign accesskeys; for example: accesskey="1"
		if(!isset($params['exclude'])){$params['exclude'] = array();} // Do not show these IDs
		else{$params['exclude'] = explode(",",$params['exclude']);}
		if(!isset($params['include'])){$params['include'] = array();} // Show only these IDs
		else{$params['include'] = explode(",",$params['include']);}
		if(!isset($params['exclude_uri'])) // If this URI is part of the link's URI, it will not be included
			{
				$params['exclude_uri'] = false; // options: false = off / thank-you = example URI exclusion
			}
		if(!isset($params['nofollow'])){$params['nofollow'] = array();} // No Follow only these IDs; for example: rel="nofollow"
		elseif($params['nofollow']=='all'){$params['nofollow'] = true;}
		else{$params['nofollow'] = explode(",",$params['nofollow']);}
		if(!isset($params['show_home'])){$params['show_home'] = 1;} // To show or not show the Home link, must provide home_path
		if(!isset($params['home_path'])){$params['home_path'] = '/home/';} // The real home link!
		if(!isset($params['home_link'])){$params['home_link'] = '/';} // What we want home to link to!
		if(!isset($params['home_title'])){$params['home_title'] = false;} // Defaults to Home's title, but you can customize what it says here
		if(!isset($params['start_link'])){$params['start_link'] = false;} // Adds a new menu item to the beginning of the menu
		if(!isset($params['start_title'])){$params['start_title'] = 'Home';} // The new menu item's title, default is Home
		$params['c2p_active']=0;
		if(!isset($params['c2p_cid'])){$params['c2p_cid'] = 0;} // Catgory ID for Category=Page (category called press releases)
		if(!isset($params['c2p_pid'])){$params['c2p_pid'] = 0;} // Page ID for Category=Page (page called press releases)
		$params['category_ids'] = wp_menu_get_categories();
		if(in_array($params['c2p_cid'],$params['category_ids'])&&$params['c2p_cid']>0&&$params['c2p_pid']>0&&$wp_query->post->post_type=='post'){$params['c2p_active']=1;}
		$params['b2p_active']=0;
		if(!isset($params['b2p_pid'])){$params['b2p_pid'] = 0;} // Page ID for Blog (all posts)
		$params['secondary_id'] = $params['parent_id'];
		if($params['secondary_id']==0){$params['secondary_id'] = 'x';}
		if($params['b2p_pid']>0&&$wp_query->post->post_type=='post'){$params['b2p_active']=1;}
		$params['select_id'] = $params['parent_id'];
		$params['selected'] = 0;
		if($params['nav_type']=="secondary"||$params['nav_type']=="single_secondary")
			{
				$params['secondary_info'] = wp_menu_secondary_menu_links($params['secondary_id'],$params);
			}
		$params['indent_rec'] = $params['indent'];
		if($params['nav_type']=="secondary"){$params['select_id'] = 0;}
		$params['level'] = 0;
		$params['nav_applied'] = 0;
		$params['custom'] = wp_menu_custom($params);
		$params['is_custom'] = 0;
		if(!empty($params['custom'])){$params['is_custom']=1;}
		$params['children'] = wp_menu_tree($params);
		$ret = wp_menu_get($params);
		return $ret;
	}
function wp_menu_custom($params)
	{
		if(empty($params['custom'])){return array();}
		$menu = $params['custom'];
		$ret = array();
		foreach($menu as $item)
			{
				if(!isset($item['ID'])){$item['ID']='-1';}
				if(!isset($item['post_parent'])){$item['post_parent']='0';}
				if(!isset($item['children_ids'])){$item['children_ids']=array();}
				if(!isset($item['children'])){$item['children']=array();}
				if(isset($item['link_href'])&&isset($item['link_title']))
					{
						$ret[] = $item;
					}
			}
		return $ret;
	}
function wp_menu_get_categories()
	{
		$cats = get_the_category();
		$cat_ids = array();
		foreach($cats as $cat)
			{
				$cat_ids[] = (int)$cat->term_id;
			}
		return $cat_ids;
	}
function wp_menu_item($item)
	{
		// in progress :-)
	}
function wp_menu_tree($params,$sub=0)
	{
		global $wpdb;
		if(!empty($params['custom'])){return $params['custom'];}
		$ret = array();
		$level = 0;
		if(isset($params['level'])){$level = $params['level'];}
		$level++;
		$ext = "";
		$params['level'] = $level;
		$select_href = $params['parent_href'];
		if(isset($params['select_href'])){$select_href = $params['select_href'];}
		$params['select_href'] = $select_href;
		if($params['nav_type']=="secondary")
			{
				if($level==1)
					{
						if(!isset($params['secondary_info'])){$params['secondary_info'] = wp_menu_secondary_menu_links($params['secondary_id'],$params);}
						if($params['this_id']==$params['secondary_info']['full']['top']){$params['selected']=1;}
						$params['select_id'] = $params['secondary_info']['full']['top'];
						$params['select_href'] = $select_href = wp_menu_get_href($params['select_id']);
					}
				$ext1 = implode("','",$params['secondary_info']['matches']);
				$ext = " AND p.ID IN ('".$ext1."')";
			}
		if(!empty($params['exclude']))
			{
				$ext2 = implode("','",$params['exclude']);
				$ext .= " AND p.ID NOT IN ('".$ext2."')";
			}
		if(!empty($params['include'])&&($params['nav_type']!="single"||$sub==0))
			{
				$ext3 = implode("','",$params['include']);
				$ext .= " AND p.ID IN ('".$ext3."')";
			}
		$result = $wpdb->get_results("SELECT t.term_id,t.slug,tax.parent,p.ID,p.post_name,p.post_title,p.post_parent,pm.meta_value FROM $wpdb->posts AS p LEFT JOIN $wpdb->postmeta AS pm ON pm.post_id=p.ID AND pm.meta_key='wp_menu_nav' LEFT JOIN $wpdb->terms AS t ON t.term_id=p.post_parent LEFT JOIN $wpdb->term_taxonomy AS tax ON tax.term_id=t.term_id WHERE p.post_parent='".$params['select_id']."' AND p.post_type='page' AND p.post_status='publish'".$ext." ORDER BY p.menu_order ASC");
		$count = count($result);
		if($result&&0<$count) for($x=0;$x<$count;$x++)
			{
				$params['select_href'] = $select_href;
				$ret[$x] = array();
				$ret[$x]['ID'] = $result[$x]->ID;
				$ret[$x]['post_parent'] = $result[$x]->post_parent;
				$ret[$x]['link_href'] = $params['select_href'].$result[$x]->post_name."/";
				$params['select_href'] = $ret[$x]['link_href'];
				$ret[$x]['link_title'] = $result[$x]->post_title;
				$ret[$x]['children'] = $ret[$x]['children_ids'] = array();
				if($params['select_id']!=$ret[$x]['ID']&&($params['nav_levels']==0||$level<$params['nav_levels'])&&(($params['nav_type']!="secondary")||$params['selected']!=1))
					{
						$params['select_id'] = $ret[$x]['ID'];
						if(($params['this_id']==$params['select_id'])&&($params['nav_type']=="secondary"))
							{
								$params['selected'] = 1;
							}
						if(!is_array($params['secondary_info']['full']['current'])){$params['secondary_info']['full']['current'] = array();}
						if(in_array($ret[$x]['ID'],$params['secondary_info']['full']['current'])||$params['nav_type']=='sitemap')
							{
								$ret[$x]['children'] = wp_menu_tree($params,1);
								$ret[$x]['children_ids'] = wp_menu_children($ret[$x]['children']);
								$ret[$x]['children_ids'][] = $ret[$x]['ID'];
							}
					}
				else
					{
						$ret[$x]['children'] = $ret[$x]['children_ids'] = array();
					}
			}
		return $ret;
	}
function wp_menu_children($children,$arr=array())
	{
		$count = count($children);
		for($x=0;$x<$count;$x++)
			{
				$arr[] = $children[$x]['ID'];
				if(!empty($children[$x]['children']))
					{
						$arr = wp_menu_children($children[$x]['children'],$arr);
					}
			}
		return $arr;
	}
function wp_menu_get_heading($id)
	{
		global $wpdb;
		$result = $wpdb->get_results("SELECT post_title FROM $wpdb->posts WHERE ID='".$id."'");
		$count = count($result);
		$ret = "";
		if($result&&0<$count)
			{
				$ret = $result[0]->post_title;
			}
		return $ret;
	}
function wp_menu_get($params)
	{
		if(empty($params['children'])){return;}
		$ret = "";
		$params['x'] = 0;
		if($params['div']==1)
			{
				$ret .= $params['indent']."<div";
				if(!empty($params['div_class'])){$ret .= " class=\"".$params['div_class']."\"";}
				if(!empty($params['div_id'])){$ret .= " id=\"".$params['div_id']."\"";}
				$ret .= ">\n";
			}
		if($params['heading']=="0"&&$params['nav_tag']=="ul")
			{
				$ret .= wp_menu_get_level($params['children'],$params);
			}
		else
			{
				$item_type = "li";
				if($params['nav_tag']=="dl"){$item_type = "dd";}
				$indent = $params['indent'];
				if(isset($params['indent_rec'])){$indent = $params['indent_rec'];}
				$params['indent_rec'] = $indent;
				if($params['heading']=="h2")
					{
						if(!isset($params['children'][0]['post_parent'])){$params['children'] = array(array('post_parent'=>0));}
						$headingTitle = wp_menu_get_heading($params['children'][0]['post_parent']);
						$ret .= $params['indent_rec']."<h2>".$headingTitle."</h2>\n";
					}
				if(($params['nav_wrap']==0&&$params['level']>0)||$params['nav_wrap']==1)
					{
						$ret .= $params['indent_rec']."<".$params['nav_tag'];
						if(!empty($params['nav_class'])){$ret .= " class=\"".$params['nav_class']."\"";}
						if(!empty($params['nav_id'])){$ret .= " id=\"".$params['nav_id']."\"";}
						$ret .= ">\n";
					}
				if($params['heading']=="dt")
					{
						if(!isset($params['children'][0]['post_parent'])){$params['children'] = array(array('post_parent'=>0));}
						$headingTitle = wp_menu_get_heading($params['children'][0]['post_parent']);
						$ret .= $params['indent_rec']."\t<dt>".$headingTitle."</dt>\n";
					}
				if($params['start_link']!==false)
					{
						$ret .= $params['indent_rec']."\t<".$item_type;
						if($params['unique_class']==1)
							{
								$ret .= " class=\"";
								if(0<strlen($params['unique_prefix']))
									{
										$ret .= $params['unique_prefix'].'-';
									}
								$ret .= 0;
							}/*
						if($params['active']=="item"&&!empty($params['active_class']))
							{
								if($params['unique_class']==0)
									{
										$ret .= " class=\"".$params['active_class']."\"";
									}
								else
									{
										$ret .= " ".$params['active_class'];
									}
							}*/
						if($params['unique_class']==1)
							{
								$ret .= "\"";
							}
						$ret .= ">";
						$ret .= "<a href=\"".$params['start_link']."\"";
						if($params['nofollow']===true){$ret .= " rel=\"nofollow\"";}
						if(!empty($params['link_titles'])){$ret .= " title=\"".$params['start_title']."\"";}
						if(!empty($params['target'])){$ret .= " target=\"".$params['target']."\"";}/*
						if($params['active']=="link"&&!empty($params['active_class']))
							{
								$ret .= " class=\"".$params['active_class']."\"";
							}*/
						if($params['accesskeys']==1)
							{
								$params['x']++;
								$ret .= " accesskey=\"".$params['x']."\"";
							}
						$ret .= ">".$params['start_title']."</a>";
						$ret .= "</".$item_type.">\n";
					}
				foreach($params['children'] as $k=>$v)
					{
						$ret .= $params['indent_rec']."\t<".$item_type;
						if($params['unique_class']==1)
							{
								$ret .= " class=\"";
								if(0<strlen($params['unique_prefix']))
									{
										$ret .= $params['unique_prefix'];
									}
								$ret .= $v['ID'];
							}
						if($params['active']=="item"&&!empty($params['active_class'])&&(in_array($params['this_id'],$v['children_ids'])||$params['this_id']==$v['ID']))
							{
								if($params['unique_class']==0)
									{
										$ret .= " class=\"".$params['active_class']."\"";
									}
								else
									{
										$ret .= " ".$params['active_class'];
									}
							}
						if($params['unique_class']==1)
							{
								$ret .= "\"";
							}
						$ret .= ">";
						$ret .= "<a href=\"".$v['link_href']."\"";
						if((is_array($params['nofollow'])&&in_array($v['ID'],$params['nofollow']))||$params['nofollow']===true){$ret .= " rel=\"nofollow\"";}
						if(!empty($params['link_titles'])){$ret .= " title=\"".$v['link_title']."\"";}
						if(!empty($params['target'])){$ret .= " target=\"".$params['target']."\"";}
						if($params['active']=="link"&&!empty($params['active_class'])&&(in_array($params['this_id'],$v['children_ids'])||$params['this_id']==$v['ID']))
							{
								$ret .= " class=\"".$params['active_class']."\"";
							}
						if($params['accesskeys']==1)
							{
								$params['x']++;
								$ret .= " accesskey=\"".$params['x']."\"";
							}
						$ret .= ">".$v['link_title']."</a>";
						if(!empty($v['children']))
							{
								$rat = "\n".wp_menu_get_level($v['children'],$params);
								if($rat!=""){$ret .= $rat.$params['indent_rec']."\t";}
							}
						$ret .= "</".$item_type.">\n";
					}
				if(($params['nav_wrap']==0&&$params['level']>0)||$params['nav_wrap']==1)
					{
						$ret .= $params['indent_rec']."</".$params['nav_tag'].">\n";
					}
			}
		if($params['div']==1)
			{
				$ret .= $params['indent']."</div>\n";
			}
		return $ret;
	}
function wp_menu_get_level($children,$params)
	{
		if(empty($children)){return;}
		$params['level']++;
		$params['indent_rec'] = $params['indent_rec']."\t";
		$ret = "";
		if(($params['nav_wrap']==0&&$params['level']>1)||$params['nav_wrap']==1)
			{
				$ret .= $params['indent_rec']."\t<ul";
				if($params['heading']=="0"&&$params['nav_applied']==0)
					{
						if(!empty($params['nav_class'])){$ret .= " class=\"".$params['nav_class']."\"";}
						if(!empty($params['nav_id'])){$ret .= " id=\"".$params['nav_id']."\"";}
						$params['nav_applied'] = 1;
					}
				$ret .= ">\n";
			}
		$wasActive=0;
		foreach($children as $k=>$v)
			{
				if($params['exclude_uri']!==false&&strpos($v['link_href'],$params['exclude_uri'])!==false)
					{
						continue;
					}
				$thisisActive = 0;
				$childURL = parse_url($v['link_href']);
				if(!$childURL)
					{
						if($newchildURL = parse_url('http://'.$_SERVER['HTTP_HOST'].$v['link_href']))
							{
								$childURL = $newchildURL;
							}
					}
				if($params['home_path']==$childURL['path'])
					{
						if($params['show_home']==0){continue;}
						$v['link_href'] = $params['home_link'];
						if($params['home_title']!==false){$v['link_title'] = $params['home_title'];}
					}
				$primaryURL = '.'.$_SERVER['REQUEST_URI'];
				if($wasActive<1
				   &&!empty($params['active_class'])
				   &&(
					  in_array($params['this_id'],$v['children_ids'])
					  ||$params['this_id']==$v['ID']
					  ||(
						 (strpos($primaryURL,'.'.$childURL['path'])>-1&&$params['is_custom']==0)
						 ||$primaryURL=='.'.$childURL['path']
						 ||($params['c2p_active']>0&&$v['ID']==$params['c2p_pid'])
						 ||($params['b2p_active']>0&&$v['ID']==$params['b2p_pid'])
						 ||($params['home_path']==$childURL['path']&&$primaryURL=='./')
						 )
					  )
				   )
					{
						$thisisActive=1;
						$wasActive=1;
					}
				$ret .= $params['indent_rec']."\t\t<li";
				if($params['unique_class']==1)
					{
						$ret .= " class=\"";
						if(0<strlen($params['unique_prefix']))
							{
								$ret .= $params['unique_prefix'];
							}
						$ret .= $v['ID'];
					}
				if($thisisActive>0&&$params['active']=="item")
					{
						if($params['unique_class']==0)
							{
								$ret .= " class=\"".$params['active_class']."\"";
							}
						else
							{
								$ret .= " ".$params['active_class'];
							}
					}
				if($params['unique_class']==1)
					{
						$ret .= "\"";
					}
				$ret .= ">";
				$ret .= "<a href=\"".$v['link_href']."\"";
				if((is_array($params['nofollow'])&&in_array($v['ID'],$params['nofollow']))||$params['nofollow']===true){$ret .= " rel=\"nofollow\"";}
				if(!empty($params['link_titles'])){$ret .= " title=\"".$v['link_title']."\"";}
				if(!empty($params['target'])){$ret .= " target=\"".$params['target']."\"";}
				if($thisisActive>0&&$params['active']=="link")
					{
						$ret .= " class=\"".$params['active_class']."\"";
					}
				if($params['accesskeys']==1)
					{
						$params['x']++;
						$ret .= " accesskey=\"".$params['x']."\"";
					}
				$ret .= ">".$v['link_title']."</a>";
				if(!empty($v['children'])&&$params['nav_type']!="single")
					{
						$indent = $params['indent_rec'];
						$params['indent_rec'] = $indent."\t";
						$rat = "\n".wp_menu_get_level($v['children'],$params);
						$params['indent_rec'] = $indent;
						if($rat!=""){$ret .= $rat.$params['indent_rec']."\t\t";}
					}
				$ret .= "</li>\n";
			}
		if(($params['nav_wrap']==0&&$params['level']>1)||$params['nav_wrap']==1)
			{
				$ret .= $params['indent_rec']."\t</ul>\n";
			}
		return $ret;
	}
function wp_menu_get_href($id)
	{
		$ret = get_bloginfo("wpurl")."/";
		if($id!=0){$ret = get_permalink($id);}
		return $ret;
	}
function wp_menu_secondary_menu_links($page_id='x',$params='')
	{
		global $wp_query;
		$get = $wp_query->post;
		if($page_id!='x'&&$page_id!=$get->ID)
		{
			$get = get_post($page_id);
		}
		if($get->post_type!='page')
		{
			$get = wp_menu_page_by_path($params);
		}
		$get_top_post = $get;
		$top_post_parent_id = $get_top_post->ID;
		$get_top_post_parent_id = $get_top_post->post_parent;
		if($page_id=='x') while($get_top_post_parent_id)
			{
				$get_top_post = get_post($get_top_post_parent_id);
				$top_post_parent_id = $get_top_post->ID;
				$get_top_post_parent_id = $get_top_post->post_parent;
			}
		$ext = '';
		if(isset($params['nav_type'])&&$params['nav_type']=="single_secondary")
			{
				if($params['nav_levels']!=0&&$params['nav_levels']<2)
					{
						$ext = '&depth='.($params['nav_levels']-1);
					}
			}
		$sub_pages = wp_list_pages('sort_column=menu_order&title_li=&echo=0&child_of='.$top_post_parent_id.$ext);
		$matches_1 = $matches_2 = $matches_3 = $matches_4 = $ret['matches'] = $ret['full']['non'] = $ret['full']['current'] = $ret['full']['current_parent'] = $ret['full']['current_ancestor'] = $ret['full'] = $ret = array();
		preg_match_all('/page-item-(.\d*)\"/si',$sub_pages,$matches_1);
		preg_match_all('/page-item-(.\d*) current_page_item\"/si',$sub_pages,$matches_2);
		preg_match_all('/page-item-(.\d*) current_page_ancestor current_page_parent\"/si',$sub_pages,$matches_3);
		preg_match_all('/page-item-(.\d*) current_page_ancestor\"/si',$sub_pages,$matches_4);
		if(isset($params['nav_type'])&&$params['nav_type']=="single_secondary")
			{
				$ret['full']['current'][] = $top_post_parent_id;
			}
		foreach($matches_1[1] as $m)
			{
				$ret['matches'][] = $m;
				if(isset($params['nav_type'])&&$params['nav_type']=="single_secondary")
					{
						$ret['full']['current'][] = $m;
					}
				else
					{
						$ret['full']['non'][] = $m;
					}
			}
		foreach($matches_2[1] as $m)
			{
				$ret['matches'][] = $m;
				$ret['full']['current'][] = $m;
			}
		foreach($matches_3[1] as $m)
			{
				$ret['matches'][] = $m;
				$ret['full']['current_parent'][] = $m;
				$ret['full']['current'][] = $m;
			}
		foreach($matches_4[1] as $m)
			{
				$ret['matches'][] = $m;
				$ret['full']['current_ancestor'][] = $m;
				$ret['full']['current'][] = $m;
			}
		$ret['matches'][] = $top_post_parent_id;
		$ret['full']['top'] = $top_post_parent_id;
		return $ret;
	}
function wp_menu_page_drop_last ($uri=NULL)
	{
		if($uri==NULL)
			{
				$uri = $_SERVER['REQUEST_URI'];
			}
		$exp = explode('/',$uri);
		$exp = array_filter($exp);
		$exp = array_reverse($exp);
		unset($exp[0]);
		$exp = array_reverse($exp);
		$uri = '/'.implode('/',$exp).'/';
		if($uri=='//'){$uri='/';}
		return $uri;
	}
function wp_menu_page_by_path ($params='',$uri=NULL)
	{
		if(!is_array($params)){$params = array();}
		if($uri==NULL)
			{
				$uri = $_SERVER['REQUEST_URI'];
			}
		$page = get_page_by_path($uri);
		if(isset($params['page_by_path_last'])&&$params['page_by_path_last']==$uri&&$page==NULL)
			{
				global $wp_query;
				$get = $wp_query->post;
				return $get;
			}
		$params['page_by_path_last'] = $uri;
		if($page==NULL)
			{
				$uri = wp_menu_page_drop_last($uri);
				$page = wp_menu_page_by_path($params,$uri);
			}
		return $page;
	}
?>