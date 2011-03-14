
## 06mar2010

> Added `gem devise` to Gemfile

	bundle
	rails generate devise:install
	rails generate devise User

> Put `config.action_mailer.default_url_options = { :host => 'localhost:3000' }` in config/environments/development.rb
> Check edit app/models/user.rb

	rake db:migrate
	rails g controller home index	
	rails g scaffold survey name:string user:references
	rake db:migrate
	rm public/index.html

> user.rb   << has_many :surveys
> survey.rb << belongs_to :user
> routes.rb << `root :to => "home#index"`
> ans_type : yes_or_no, one-choice-among-many, multiple-choices, text

	rails g scaffold question q_text:string ans_type:integer survey:references
	rake db:migrate

.
.
.

	rails g scaffold answer_choices choice_text:text question:references


curl -d 'client_id=40b43a12613944cc85aa&client_secret=6b03149d65012d21b08d55b14d09ecb30e2a1fe5&code=caa0dc2c4ef14c9e3f2f' https://github.com/login/oauth/access_token


10mar2010

To use jquery instead of prototype in the app do -

Add this to Gemfile
> gem 'jquery-rails', '>= 0.2.6'
> bundle
> rails generate jquery:install

Ref: https://github.com/rails/jquery-ujs


Imp note:
For case-when blocks within views, the first when should be on the immediate next line of case


<div class="ans_choice">
  <%= label_tag :choice_text, "choice 2" %>
  <%= text_field_tag :choice_text  %>
  <%= link_to_function "x", "" %>
</div>
<div class="ans_choice">
  <%= label_tag :choice_text, "choice 3" %>
  <%= text_field_tag :choice_text  %>
  <%= link_to_function "x", "" %>
</div>
<div class="ans_choice">
  <%= label_tag :choice_text, "choice 4" %>
  <%= text_field_tag :choice_text  %>
  <%= link_to_function "x", "" %>
</div>
<div>
  <%= link_to "+", "/answer_choices/new", :remote=>true %>	
<div>
	
	$(event.target).parents('.ans_choice').html()


answer:
	question_id
	answer_choice_id
	respondent_id
	
rails g scaffold question:references answer_choice:references respondent:references misc: string	

## setup association between answer and answer_choices
answer
	  has_and_belongs_to_many :answer_choices, :join_table => "answer_to_answer_choice_connection"

MEthods available:

answer.answer_choices
answer.answer_choices<<
answer.answer_choices.delete
answer.answer_choices=
answer.answer_choice_ids
answer.answer_choices.clear
answer.answer_choices.empty?
answer.answer_choices.size
answer.answer_choices.find
answer.answer_choices.exists?
answer.answer_choices.build
answer.answer_choices.create

Another way:
answer_choices
	  has_and_belongs_to_many :answers, :join_table => "answer_to_answer_choice_connection"

answer_choices.answers
answer_choices.answers<<
answer_choices.answers.delete
answer_choices.answers=
answer_choices.answer_ids
answer_choices.answers.clear
answer_choices.answers.empty?
answer_choices.answers.size
answer_choices.answers.find
answer_choices.answers.exists?
answer_choices.answers.build
answer_choices.answers.create

## next to do:

 	/surveys/12/response/new
.	/response/136
	/response?s=12&q=136
	/s=12&q=136

Rename all 'answer' to 'response'
	rails g scaffold answer question:references answer_choice:references respondent:references value:text
	rails g scaffold response question:references answer_choice:references respondent:references value:text

	rake db:migrate:down VERSION="20110313050839"	# create_answers
	rake db:migrate:down VERSION="20110313105517"	# AddHabtmToAnswer
	rake db:migrate:up VERSION="20110313181252"		# craete_responses - edited same migration
	rm db/migrate/20110313050839_create_answers.rb
	rails g migration AddHabtmToAnswerChoices

	rails destroy scaffold answer
	
	







