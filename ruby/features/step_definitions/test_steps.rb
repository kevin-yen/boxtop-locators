Given(/^I sign in to Liferay Portal as "([^"]*)"$/) do |email|
	visit Capybara.app_host
	click_object 'link', 'Sign In'
	input_text 'text_field', 'test@liferay.com', 'Email Address'
	input_text 'text_field', 'test', 'Password'
	click_object 'button', 'Sign In'
end

Given(/^I visit "([^"]*)"$/) do |url|
	visit url
end

When(/^I click the "([^"]*)" "([^"]*)"$/) do |label, element|
	click_object element, label
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |label, text|
	input_text 'text_field', text, label
end

Then(/^I should be signed in$/) do
end

When(/^I open the Product Side Bar$/) do
	ProductMenu.open
end

When(/^I expand the "([^"]*)" panel$/) do |name|
	ProductMenu.expand_panel name
end

Then(/^I pause for "([^"]*)" seconds$/) do |num|
	sleep num.to_i
end

When(/^I expand the "([^"]*)" submenu$/) do |name|
	ProductMenu.expand_submenu name
end

When(/^I open the "([^"]*)" ellipsis menu$/) do |menu_item|
	ProductMenu.click_ellipsis menu_item
end

When(/^I select "([^"]*)" from the dropdown menu$/) do |menu_item|
	select_item 'dropdown_menu_item', menu_item
end

Then(/^I should see the success message$/) do
	expect(BasePage).to have_success_message
end