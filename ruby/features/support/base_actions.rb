module BaseActions
	extend Capybara::DSL

	def element(element, opts={})
		xpath = $locators_hash[element]['xpath']
		css = $locators_hash[element]['css']
		label = opts[:label]

		if xpath
			xpath = xpath.gsub(/{access_name}/, label) if label
			page.find(:xpath, xpath, wait: 15)
		else
			page.find(:css, css, wait: 15)
		end
	end

	def click_object(element, label='')
		element(element, label: label).click
	end

	def css(element)
		$locators_hash[element]['css']
	end

	def has_success_message?
		element("alert_success").visible?
	end

	def input_text(element, text, label='')
		element(element, label: label).set text
	end

	def select_item(element, item)
		element(element, label: item).click
	end

	def xpath(element, access_name='')
		$locators_hash[element]['xpath'].gsub(/{access_name}/, access_name)
	end
end

World(BaseActions)