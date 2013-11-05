require 'bundler'
Bundler.setup
require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

set :public_folder, File.dirname(__FILE__) + '/public'

Speakers = {
  'matt_aimonetti' => {
    name: 'Matt Aimonetti',
    image: 'matt',
    twitter: 'mattetti',
    github: 'mattetti',
    website: '',
    bio: 'Matt Aimonetti is an experienced technologist, entrepreneur, technical writer and active open-source contributor. Based in San Diego California, he currently works on his startup: Splice. Prior to Splice, Matt worked as a Tech manager/developer at LivingSocial, on video game development at Sony PlayStation and on many other things.',
    talk_title: 'Wicked Bad Ruby',
    talk_summary: 'Can you tell the difference between good and bad code? What do you base your judgment on?<br><br>Over the years, the Ruby community has built a fairly strong notion of “the right way” of writing code. During his thought provoking presentation, Matt will show that things are not simply good vs bad, and that what we call “pretty” code might, in fact, just be lipstick on a pig.',
    video: 'VO-NvnZfMA4'
  },
  'doug_alcorn' => {
    name: 'Doug Alcorn',
    image: 'alcorn',
    twitter: 'dougalcorn',
    github: 'dougalcorn',
    website: 'http://gaslight.co',
    bio: 'Doug is a partner with Gaslight in Cincinnati. He is a lover of ruby, spread sheets, and internet space ships.',
    talk_title: 'Market Analytics in EVE with Ruby',
    talk_summary: 'Ever wondered about market trading, analytics or algorithms but didn&rsquo;t want to lose your shirt experimenting? EVE Online is a Massively Multiplayer Online Role Playing Game (MMORPG) rich in data with a fully functional, player driven economy. Using some simple concepts and novel tools you can get access to this data and discover interesting I&rsquo;ll introduce you to market analytics and the cruel world of EVE Online.',
    video: 'pPNkgxv9isM'
  },
  'joshua_ballanco' => {
    name: 'Joshua Ballanco',
    image: 'ballanco',
    twitter: 'manhattanmetric',
    github: 'jballanc',
    website: 'http://manhattanmetric.com',
    bio: 'Joshua has worked with Objective-C since 2002 and Ruby since 2004. He has built operating systems with Apple, local news websites with AOL, and somehow managed to finish a Ph.D. along the way. Currently, Joshua is Chief Scientist at Burnside Digital where he works with an amazing team of engineers and designers to solve problems for a wide range of clients. He works and lives in Ankara.',
    talk_title: 'RubyMotion: Under the Hood',
    talk_summary: 'By now you probably know that RubyMotion is a new toolchain that lets you use familiar Ruby techniques to develop applications for iOS&#133; but do you know what makes it tick? How is RubyMotion different from toolchains such as PhoneGap or Titanium? What does it mean to say that RubyMotion is implemented "on top of the Objective-C runtime"? And how the heck do I debug RubyMotion anyway?<br><br>I will attempt to answer these questions, and more, by looking deep into the underpinnings of RubyMotion. Along the way, I&rsquo;ll give a bit of an overview of the history of RubyMotion, and maybe even a glimpse at its future.',
    video: 'edVIJ60kIrQ'
  },
  'justin_campbell' => {
    name: 'Justin Campbell',
    image: 'campbell',
    twitter: 'justincampbell',
    github: 'justincampbell',
    website: 'http://justincampbell.me/',
    bio: 'Justin is a passionate Rubyist, hailing from the suburbs of Philadelphia. When he&rsquo;s not writing Ruby, he enjoys snowboarding and rock climbing with his wife, or playing StarCraft. Justin is also a budding programming-language geek.',
    talk_title: 'Hacking Your Home with Ruby',
    talk_summary: '15 years ago, Justin looked forward to the day when he could have a stack of expensive audio equipment with speakers in every room, lights that follow him around, and an intercom system so the family could page each other like Tim "The Tool Man" Taylor.<br><br>Ubiquitous networking, APIs for consumer electronics, and cheap computers like the Raspberry Pi have made it easier than ever to automate your home. We go over some popular technologies, see some code to glue it all together, and watch a live demo of some of Justin&rsquo;s favorite house hacks.',
    video: 'BeyTsdkItg4'
  },
  'joanne_cheng' => {
    name: 'Joanne Cheng',
    image: 'joanne',
    twitter: 'joannecheng',
    github: 'joannecheng',
    website: 'http://joannecheng.me/',
    bio: 'Joanne is a developer for thoughtbot, inc. in Denver, CO, happily writing code all day. When she&rsquo;s not writing code for thoughtbot, inc., she works on open source projects that benefit the state of Colorado and its citizens through <a class="section-info-link" href="http://codeforcommunities.org/" target="_blank">Code for Communities</a>. She was once a classical musician in training.',
    talk_title: 'Creativity with Ruby-Processing',
    talk_summary: 'Ruby-Processing is a simple wrapper for the Processing framework that combines the visual-driven environment of Processing with the fun of writing R we&rsquo;ll go through the ways to &ldquo;sketch&rdquo; with Ruby-Processing with several live coding examples and create something together. Through creativity, we can increase the breadth of problems we can solve in our day to day jobs.',
    video: 'Rnw9WNSph5k'
  },
  'mike_desjardins' => {
    name: 'Mike Desjardins',
    image: 'desjardins',
    twitter: 'mdesjardins',
    github: 'mdesjardins',
    website: 'http://www.mikedesjardins.net',
    bio: 'Mike began programming on his Tandy 1000 when he was 13 years old and has never looked back. His first job out of college was writing assembly language firmware for disk drives, where his primary debugging tool was an oscilloscope. Today he&rsquo;s a Software Developer at Openbay, where he tinkers with Rails and Backbone, quietly disrupting the auto repair industry. When he&rsquo;s not at a keyboard, you can often find him geocaching with his family up in Portland, Maine.',
    talk_title: 'Rails Sojourn: One Man&rsquo;s Journey',
    talk_summary: 'With several spawling, monolithic Rails apps under my belt, I had the opportunity to go a different route. Bulging models, obtuse controllers, and views chock full of logic were my world. When I came up for air, all the cool kids were writing thick clients with svelte backends. Perhaps Sinatra and some hip Javascript framework were the way? Here&rsquo;s what I learned&hellip;',
    video: 'pyDd9xoGZCM'
  },
  'jason_garber' => {
    name: 'Jason Garber',
    image: 'garber',
    twitter: 'jasongarber',
    github: 'jgarber',
    website: 'http://jasongarber.com/ruby-developer',
    bio: 'Jason picked up Ruby while re-designing the Rosetta Stone website in 2005 and immediately fell in love with the language, the community, and open-source software. Later, he started committing to Why the Lucky Stiff&rsquo;s RedCloth repo and the next thing he knew, he was the owner, with a sketch from _why to prove it! Jason enjoys helping others level up their skills, through RailsGirls, Philly.rb, and corporate training. He is an engineer at PromptWorks, a Ruby shop in Philadelphia, where he enjoys pair programming with his co-founders, Greg and Mike.',
    talk_title: 'Writing DSLs with Parslet',
    talk_summary: 'Parslet makes it easy to write these kinds of DSLs in pure Ruby. In this talk you’ll learn the basics, feel out the limitations of several approaches and find some common solutions. In no time, you’ll have the power to make a great new DSL, slurp in obscure file formats, modify or fork other people’s grammars (like Gherkin, TOML, or JSON), or even write your own programming language!',
    video: 'ET_POMJNWNs'
  },
  'nick_gauthier' => {
    name: 'Nick Gauthier',
    image: 'gauthier',
    twitter: 'ngauthier',
    github: 'ngauthier',
    website: 'http://ngauthier.com',
    bio: 'Nick Gauthier is a web freelancer focusing on Ruby on Rails and JavaScript. His experience spans from SQL to Sass and he always tests, all the time. He wrote Recipes with Backbone with Chris Strom and recently released his most recent eBook Mobile Web Patterns with Backbone.js. Aside from freelancing Nick runs B’More Awesome, a Baltimore-based web training organization, and he also co-founded Exobrain, an online mind-mapping tool.',
    talk_title: 'Outside-In Testing',
    talk_summary: 'As a freelancer I&rsquo;m often tasked with creating high quality web applications quickly while keeping the budget razor thin. In my experience, the absolute best bang-for-your-buck style of development has been BDD from the outside-in via acceptance tests. With acceptance tests you can quickly and accurately determine the minimum code necessary to fit the requirements of an application while achieving high code coverage and resilience to refactoring. By their very nature acceptance tests are the the simplest kinds of tests to write since they are expressed in the language of an end-user. In this talk we&rsquo;ll implement a feature from the outside-in, explaining the reasoning behind every step.',
    video: 'JDgOuKvRaf4'
  },
  'steven_haddox' => {
    name: 'Steven Haddox',
    image: 'haddox',
    twitter: 'stevenhaddox',
    github: 'stevenhaddox',
    website: 'http://stevenhaddox.com',
    bio: 'Steven has over a decade of programming experience and has been a Ruby developer since 2008. His career consists of a wide-variety of development and production environments which have led him to create tools like <a href="https://github.com/stevenhaddox/rvm_fw" class="section-info-link" target="_blank">RVM::FW</a> to help ensure that development can be consistent in a multitude of circumstances.',
    talk_title: 'PEACE: Programming Expertly Amid Corporations &amp; Enterprises',
    talk_summary: 'Everyone casts the "Enterprise" as the most horrid place in the world to be a Ruby developer, and they used to be right. How does a Rubyist trying to stay current work in a confined and archaic environment with strict security restrictions? You do everything other Rubyists do, but you do it without sudo and from source. Together we&rsquo;ll identify the best open source self-hosted options for agile managment, provisioning, git hosting, error tracking, CI, isolated RVM, metrics, central logging, and security. As a bonus, you&rsquo;ll learn how to automate the setup of all these tools as much as possible without sudo privileges.',
    video: '3KfW10PxBpA'
  },
  'bryan_liles' => {
    name: 'Bryan Liles',
    image: 'bryan',
    twitter: 'bryanl',
    github: 'bryanl',
    website: '',
    bio: 'Based in Baltimore, Bryan Liles is the Senior Vice President of Thunderbolt Labs. Since 1993, Bryan has hacked into systems which he was then paid to protect; written more assembler than anyone should ever have to; worked with and against the government. Currently, Bryan is exploring the limits of Ruby and other trendy programming languages while building that next great product company. In his spare time, he trolls Twitter and grows miniature herb gardens.',
    talk_title: 'Machine Learning with Ruby',
    talk_summary: 'Not sure where to cluster or where to classify? Have you seen a linear regression lately? Every wanted to take a look into machine learning? Curious to what problems you can solve? Using Ruby to become familiar with machine learning and data-mining techniques is great way to get acclimated before diving in with both feet.',
    video: 'cO26TjhQWvA'
  },
  'dan_mcclain' => {
    name: 'Dan McClain',
    image: 'dan',
    twitter: '_danmcclain',
    github: 'danmcclain',
    website: 'http://danmcclain.net',
    bio: 'I am the author of the postgre_ext gem, which adds ActiveRecord and Arel support for PostgreSQL datatypes, and contributed commits to Rails 4.0 that added PostgreSQL array support.',
    talk_title: 'Supercharging ActiveRecord with PostgreSQL',
    talk_summary: 'You&rsquo;ve been able to serialize Ruby objects with ActiveRecord in the past, but the database treats serialized objects as text. PostgreSQL has support for advanced data types, like arrays, hashes and ranges, natively, allowing the database to do the heavy work for you. You can query a table for records that contain an array with a specific element. You can build a reservation system in which the database makes sure that you don&rsquo;t double book a room. All of which happens in the database, preventing you from retrieving extra records and processing them in memory.<br><br>With Rails 4, ActiveRecord has been supercharged. The PostgreSQL adapter has been extended to support arrays and hashes, and was rewritten to make adding your own types easier than before. There are gems out there that allow you to leverage these datatypes in Rails 3 as well.',
    video: 'SiwuXtKLjIE'
  },
  'christopher_meiklejohn' => {
    name: 'Christopher Meiklejohn',
    image: 'meiklejohn',
    twitter: 'cmeik',
    github: 'cmeiklejohn',
    website: '',
    bio: 'Christopher Meiklejohn is a Software Engineer with Basho Technologies, Inc. where he focuses on building rich web applications for Riak using Erlang and JavaScript. Before joining Basho, he worked at Swipely, a loyalty program startup based in Providence where he maintained critical infrastructure components written in Ruby. Christopher is also a graduate student in computer science at Brown University in Providence RI, where he studies formal verification and distributed systems.',
    talk_title: 'Bloom: A language for disorderly distributed programming',
    talk_summary: 'Traditional programming languages use a model of computation where individual instructions are executed in order. However, when building distributed systems this model fails to match the reality of how your application code is actually executed. Bloom is a language which allows programmers to build applications as a series of unordered statements while also providing facilities for imposing a particular ordering of events when necessary.<br><br>During this talk we will explore building applications in Bud, which is a prototype of Bloom implemented as a domain specific language in Ruby. We will discuss the concepts of logical monotonicity, disorderly collections, the CALM principle which is the root of the Bloom language, and how to use he Bloom language to identify critical sections of your code where a coordiation library should be used to ensure consistency.',
    video: '66bU45vVF00'
  },
  'mark_menard' => {
    name: 'Mark Menard',
    image: 'menard',
    twitter: 'mark_menard',
    github: 'MarkMenard',
    website: 'http://www.enablelabs.com/',
    bio: 'Mark Menard is the founder of Enable Labs, a boutique consulting firm, in Troy, NY, specializing in product development, business productivity and problem solving. Mark used to be a Java developer and caught the dynamic language bug when he started coding in Groovy and then discovered Ruby and Rails. Mark spends most of his free time with his wife Sylva and their two sons Ezra and Avi.',
    talk_title: 'JRuby: Insights from Six Years in Production',
    talk_summary: 'JRuby is the primary alternative implementation of Ruby available. With support for native threads, excellent garbage collection, and the introduction of Invoke Dynamic it has grown into a formidable platform. So, what can JRuby do for you? Learn how JRuby differs from MRI, how JRuby supports parallelism, how to use Java libraries from JRuby, how to use Ruby from Java and more. Java no longer means just the language anymore, the JVM is an excellent place to host Ruby applications.',
    video: 't_JJD-AEtNM'
  },
  'sandi_metz' => {
    name: 'Sandi Metz',
    image: 'sandi',
    twitter: 'sandimetz',
    github: 'skmetz',
    website: 'http://sandimetz.com/',
    bio: 'Sandi Metz has thirty years of experience working on projects that survived to grow and change; her book <a href="http://poodr.com" class="section-info-link" target="_blank">&ldquo;Practical Object-Oriented Design in Ruby&rdquo;</a> is an outgrowth of this experience. Dealing with long lived applications has left her deeply biased towards practical solutions that produce working software that is easy to change. She believes in simple code and straightforward explanations.<br><br>Sandi worked for many years at Duke University and now independently consults and teaches. She lives in Durham, North Carolina, where her daily bicycle commute now consists of a loop that starts and ends at her house.',
    talk_title: 'Sandi Metz Tells Your Future',
    talk_summary: '',
    video: 'fhpT6Pc4AqM'
  },
  'justin_campbell' => {
    name: '',
    image: '',
    twitter: '',
    github: '',
    website: '',
    bio: '',
    talk_title: '',
    talk_summary: '',
    video: ''
  #},
  #'justin_campbell' => {
    #name: '',
    #image: '',
    #twitter: '',
    #github: '',
    #website: '',
    #bio: '',
    #talk_title: '',
    #talk_summary: '',
    #video: ''
  #},
  #'justin_campbell' => {
    #name: '',
    #image: '',
    #twitter: '',
    #github: '',
    #website: '',
    #bio: '',
    #talk_title: '',
    #talk_summary: '',
    #video: ''
  #},
  #'justin_campbell' => {
    #name: '',
    #image: '',
    #twitter: '',
    #github: '',
    #website: '',
    #bio: '',
    #talk_title: '',
    #talk_summary: '',
    #video: ''
  #},
  #'justin_campbell' => {
    #name: '',
    #image: '',
    #twitter: '',
    #github: '',
    #website: '',
    #bio: '',
    #talk_title: '',
    #talk_summary: '',
    #video: ''
  }
}
configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

get '/' do
  haml :index
end

get '/speakers' do
  haml :speakers
end

get '/speakers/:name' do
  haml :speaker, locals: { speaker: Speakers[params[:name]] }
end

get '/workshop' do
  haml :workshop
end
