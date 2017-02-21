class HomeController < ApplicationController
  def index
    @last_modify_date = File.open(__FILE__).mtime.strftime("%Y-%m-%d %H:%M:%S " + File.open(__FILE__).mtime.zone)
    @cesg_site = "http://cesg.tamu.edu"
    @tamu_site = "http://www.tamu.edu"
    @ece_site = "http://engineering.tamu.edu/electrical"
    @nju_site = "http://www.nju.edu.cn"
    @ese_nju_site = "http://ese.nju.edu.cn"
    @office_ip = "http://165.91.215.253"
    @people_tamu_addr = "http://people.tamu.edu/~li3939108"
    @heroku_site = "http://chaofan.li"
    @resume = @people_tamu_addr + "/resume.pdf"
    @name = "Chaofan Li"
    @top_nav_right_icons = {
        'linkedin' => {
            :text => "View me on Linkedin",
            :icon => "fa-linkedin-square",
            :href => "http://www.linkedin.com/in/chaofanli/",
        },
        'github' => {
            :text => "View me on Github" ,
            :icon => "fa-github",
            :href => "https://github.com/li3939108",
        },
        'contacts' => {
                :text => "Contacts",
                :icon => "fa-envelope",
                :href => "#contacts-panel"},
    }
    @top_nav_lists =
        {
            'home' => {
                :text => "",#"Home",
                :icon => "fa-chevron-circle-up",
                :href => "#home",
                #:hidden => false,
            },
            'about' => {
                :text => "Bio",
                #:icon => "fa-user",
                :icon => "fa-",
                :href => "#about-me-panel"},
            'publications' => {
                :text => "Publication",
                #:icon => 'fa-file-text',
                :icon => 'fa-',
                :href => "#publications-panel"},
            'tools' => {
                :text => "Softwares",
                #:icon => 'fa-caret-square-o-down',
                :icon => 'fa-sort-desc',
                :href => "#softwares",
                :dropdown => true,
                :dropdown_content => {
                    'dmhls' => {
                        :text => "DMHLS",
                        :link => "/dmhls",
                    },
                    'rilp' => {
                        :text => "RubyILP",
                        :link => "https://github.com/li3939108/ilpext",
                    },
                    #			'klp'=>{
                    #				:text => "KL-Part",
                    #				:link => "/klp",
                    #			},
                },
            },
            'teaching' => {
                :text => "Teaching",
#                :icon => 'fa-caret-square-o-down',
                :href => '#teaching',
                                :icon => 'fa-sort-desc',
                :dropdown => true,
                :dropdown_content => {
                    'ECEN 468' => {
                        :text => "ECEN 468",
                        :link => "http://people.tamu.edu/~li3939108/ecen468",
                    },
                    'ECEN 248' => {
                        :text => "ECEN 248",
                        :link => "http://people.tamu.edu/~li3939108/ecen248",
                    },
                },
            },
            'contacts' => {
                :text => "Contacts",
                :icon => "fa-envelope",
                :href => "#contacts-panel",
                :hidden => true,
            },
        }
    @init_active = "Home"
    @anchor_text = Proc.new { |key|
      view_context.content_tag(:span,
                               view_context.link_to(
                                   view_context.content_tag(:span, '&nbsp;&nbsp;'.html_safe, {'class' => 'anchor-icon fa fa-link'}),
                                   @top_nav_lists[key][:href],
                                   {'class' => 'anchor', 'title' => 'Permalink'}) +
                                   view_context.content_tag(:span, @top_nav_lists[key][:text], {'class' => 'para-title-text'}),
                               {'class' => 'para-title'})
    }
    @email_gen = Proc.new { |before, after|
      view_context.content_tag(:span, before + ' ') +
          '@'+
          view_context.content_tag(:span, ' ' + after)
    }
    @contacts =
        [
            {
                :name => "Email",
                :content =>
                    @email_gen.call('chaof', 'tamu.edu') + view_context.tag('br'),
                :icon => 'fa-envelope-o',
                :lines => 1,
            },
            {
                :name => "Homepage",
                :content =>
                    view_context.link_to(@heroku_site, @heroku_site+@top_nav_lists['home'][:href]) + view_context.tag('br'),
                #view_context.link_to(@people_tamu_addr, @people_tamu_addr) + " (Yeah, it redirects "+ view_context.link_to("here", @heroku_site+@top_nav_lists['home'][:href], {'title' => @heroku_site[7..-1]})+")"+view_context.tag('br')+
                #view_context.link_to(@office_ip, @office_ip+@top_nav_lists['home'][:href])+" (Located in 321 WEB, only available in TAMU campus network)"
                :icon => 'fa-link',
                :lines => 1,
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
