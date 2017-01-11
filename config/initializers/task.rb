sch = Rufus::Scheduler.new

sch.every "20s" do
	get_task
end


def get_task

	people = Person.all

	people.each do |person|
		url = "https://api.vk.com/method/users.get.xml?user_ids=#{person.vk}&fields=online&name_case=Nom&5.21"
		xml = Nokogiri::XML(RestClient.get(url))
		online = xml.css("online").text.to_i

		lasttake = person.takes.last
		#lasttake = Take.last

		if lasttake.try(:online) == true
			lasttake = 1
		else lasttake.try(:online) === false
			lasttake = 0
		end

    if lasttake != online || person.takes.empty?
			take = Take.new
			take.person = person

			if online == 1
				take.online = true
			else
				take.online = false
			end
			take.save
		end
	end
end
