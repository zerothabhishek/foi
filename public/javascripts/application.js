// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function(){
	$("#ans_type_block").find("INPUT").click(function(event){ 
		show_ans_options(event);
	});
});

function show_ans_options(event){
	var element = $(event.target);
	var ans_type = element.val();				
	// add a :confirm check here, as this will remove the existing work
	$.get("/answer_choices/new", "ans_type="+ans_type, null, "script");	
}

function remove_ans_choice(event, flag){
	if(flag==false){
		$(event.target).parents(".ans_choice").remove();
	}
}