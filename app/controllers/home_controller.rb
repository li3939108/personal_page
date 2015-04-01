class HomeController < ApplicationController
	def index
		@last_modify_date = File.open(__FILE__).mtime.strftime("%Y-%m-%d %H:%M:%S " + File.open(__FILE__).mtime.zone)
		@cesg_site = "http://cesg.tamu.edu"
		@tamu_site = "http://www.tamu.edu"
		@ece_site = "http://engineering.tamu.edu/electrical"
		@nju_site = "http://www.nju.edu.cn"
		@office_ip = "http://165.91.215.253"
		@people_tamu_addr = "http://people.tamu.edu/~li3939108"
		@heroku_site = "http://chaofan.li"
		@name = "Chaofan Li"
		@top_nav_lists = 
		{
			'home' => {:text => "Home", :icon => "fa-home", :href => "#home"}, 
			'about' => {:text => "About Me", :icon => "fa-user", :href => "#about-me-panel"},
			'contacts' => {:text => "Contacts", :icon => "fa-envelope", :href => "#contacts-panel"},
			'tools' => {:text => "Tools", :icon => 'fa-wrench', :href => "#tools-panel"},
			'publications' => {:text => "Publication", :icon => 'file-text', :href => "#publications-panel"},
		}
		@init_active = "Home"
		@anchor_text = Proc.new{|key|
			view_context.content_tag(:span, 
				view_context.link_to(
					view_context.content_tag(:span, '&nbsp;&nbsp;'.html_safe, {'class' => 'anchor-icon octicon octicon-link'}), 
					@top_nav_lists[key][:href], 
					{'class' => 'anchor', 'title' =>'Permalink'}) + 
				@top_nav_lists[key][:text], 
				{'class' => 'para-title'})
		}
		@email_gen = Proc.new{|before, after|
			view_context.content_tag(:span, before + ' ') + 
			view_context.content_tag(:span, '', {:class => 'rst rst-connect', :style => 'font-size: x-small ;'}) + 
			view_context.content_tag(:span, ' ' + after )
		}
		@contacts = 
		[
			{
				:name => "Email", 
				:content => 
				@email_gen.call('chaof', 'tamu.edu') + view_context.tag('br') +
				@email_gen.call('li3939108', 'gmail.com') , 
				:icon => 'fa-envelope-o',
				:lines => 3,
			},
			{
				:name => "Homepage", 
				:content => 
				view_context.link_to(@heroku_site, @heroku_site+@top_nav_lists['home'][:href]) + view_context.tag('br') +
				view_context.link_to(@people_tamu_addr, @people_tamu_addr) + " (Yeah, it redirects "+ view_context.link_to("here", @heroku_site+@top_nav_lists['home'][:href], {'title' => @heroku_site[7..-1]})+")"+view_context.tag('br')+
				view_context.link_to(@office_ip, @office_ip+@top_nav_lists['home'][:href])+" (Located in 321 WEB, only available in TAMU campus network)" ,
				:icon => 'fa-link',
				:lines => 3,
			},
			{
				:name => "Office", 
				:content => "321 Wisenbaker Engineering Building (WEB)", 
				:icon => 'fa-map-marker', 
				:title => 'View location on Google Map',
				:lines => 1,
			},
			
			#{:name => "Phone", :content => "979-224-8774", :icon => 'phone'},
		]
	end
end
