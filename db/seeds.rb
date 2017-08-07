rfp_sections = ["Contact Information",
                "Organization",
                "Current Programs or Services",
                "Goals for Impact on Sector",
                "Key Milestones",
                "Organization's Priorities and Goals",
                "Capacity Building Needs",
                "Results and Measurements",
                "Leadership",
                "Board of Directors",
                "Finances",
                "Affiliations and Collaborations (if applicable)",
                "Legal Actions"]

rfp_question_array = [
  {rfp_section: "Contact Information", question: "Organization", question_type: "single input"},
  {rfp_section: "Contact Information", question: "Address", question_type: "single input"},
  {rfp_section: "Contact Information", question: "Phone", question_type: "single input"},
  {rfp_section: "Contact Information", question: "Executive Director", question_type: "single input"},
  {rfp_section: "Contact Information", question: "Executive Director Phone", question_type: "single input"},
  {rfp_section: "Contact Information", question: "Executive Director Email", question_type: "single input"},
  {rfp_section: "Contact Information", question: "Proposal Contact (and title)", question_type: "single input"},
  {rfp_section: "Contact Information", question: "Proposal Contact Email", question_type: "single input"},
  {rfp_section: "Organization", question: "Number of employees (full & part-time)", question_type: "single input"},
  {rfp_section: "Organization", question: "Number of volunteers", question_type: "single input"},
  {rfp_section: "Organization", question: "Number of active board members", question_type: "single input"},
  {rfp_section: "Organization", question: "Total organization budget for most recent fiscal year", question_type: "single input"},
  {rfp_section: "Current Programs or Services", question: "Please list all programs your organization runs. Add more lines as needed", question_type: "multiple input"},
  {rfp_section: "Current Programs or Services", question: "Please describe your largest program focused on breaking the cycle of poverty", question_type: "block"},
  {rfp_section: "Current Programs or Services", question: "Please describe your second largest program focused on breaking the cycle of poverty", question_type: "block"},
  {rfp_section: "Current Programs or Services", question: "Also please describe the evolution of the programs/services offered. Are there any key offerings that have been discontinued and why?", question_type: "single input"},
  {rfp_section: "Goals for Impact on Sector", question: "Indicate the extent to which your program(s) and/or services possess any of the following attributes: (a) have potential for increasing the numbers served; (b) can create leverage by spreading of innovative program model; and/or (c) is scalable/replicable in other locations and/or organizations", question_type: "single input"},
  {rfp_section: "Key Milestones", question: "Provide a brief summary of your organization's history. Use seven sentences or less", question_type: "single input"},
  {rfp_section: "Organization's Priorities and Goals", question: "Describe your organization's top priorities and goals, both short term (over the next year) and long term (over three to five years).", question_type: "single input"},
  {rfp_section: "Capacity Building Needs", question: "What are your capacity building needs (short- and  long-term)? What will you need to strengthen or develop at the organization level in order to achieve your organization's current and future goals and objectives?", question_type: "single input"},
  {rfp_section: "Capacity Building Needs", question: "Where could you use SVP Chicago's Partners' expertise and consulting resources to assist you in your capacity building efforts? List and explain at least three to five potential projects with which you would like SVP Chicago to assist and briefly describe how this assistance will help you improve your operations.", question_type: "single input"},
  {rfp_section: "Capacity Building Needs", question: "Please describe any current capacity-building activities in which you are already engaged through the help of outside consultants or funders.", question_type: "single input"},
  {rfp_section: "Results and Measurements", question: "How will you know when you have accomplished your mission and program goals? What are your indicators of success and how do you measure them? If you have quantifiable, evaluative data, please list it.", question_type: "single input"},
  {rfp_section: "Leadership", question: "Please list your senior leadership team.", question_type: "block with multiple inputs"},
  {rfp_section: "Leadership", question: "Are there are significant leadership changes or role shifts planned?", question_type: "single input"},
  {rfp_section: "Leadership", question: "How will the organizational leadership and board ensure the success of its relationship with SVP Chicago?", question_type: "single input"},
  {rfp_section: "Board of Directors", question: "Please list your board members, with brief descriptions of their background and number of years served. Indicate if any board member is receiving compensation from the organization.", question_type: "block with multiple inputs"},
  {rfp_section: "Board of Directors", question: "How many board meetings do you have yearly", question_type: "single input"},
  {rfp_section: "Board of Directors", question: "What percentage of board members donated money in the last 12 months?", question_type: "single input"},
  {rfp_section: "Board of Directors", question: "What percentage of your board members are active? Please also define how you measure what constitutes an active board member?", question_type: "single input"},
  {rfp_section: "Finances", question: "Please indicate the following for the current fiscal year and three previous years:", question_type: "block with multiple inputs"},
  {rfp_section: "Finances", question: "How frequently does your board review your financial statements and comparisons to budget?", question_type: "single input"},
  {rfp_section: "Finances", question: "For the current fiscal year, are your revenues meeting budgeted expectations", question_type: "single input"},
  {rfp_section: "Finances", question: "For the current fiscal year, is your spending within budget", question_type: "single input"},
  {rfp_section: "Finances", question: "What is the allocation of your current sources of funding (by %)", question_type: "single input"},
  {rfp_section: "Finances", question: "Donations", question_type: "single input"},
  {rfp_section: "Finances", question: "Grants", question_type: "single input"},
  {rfp_section: "Finances", question: "Generated Revenue", question_type: "single input"},
  {rfp_section: "Finances", question: "Describe your anticipated funding for this year and future years.", question_type: "single input"},
  {rfp_section: "Finances", question: "Describe how you propose using the initial, first year investment of $25,000 you would receive from SVP Chicago.", question_type: "single input"},
  {rfp_section: "Affiliations and Collaborations (if applicable)", question: "What local and national affiliations do you have?", question_type: "single input"},
  {rfp_section: "Affiliations and Collaborations (if applicable)", question: "How are you leveraging partners and networks in the Chicagoland area to enhance the services you provide?", question_type: "single input"},
  {rfp_section: "Affiliations and Collaborations (if applicable)", question: "Which are national or parent organizations? What are your responsibilities to these organizations?", question_type: "single input"},
  {rfp_section: "Affiliations and Collaborations (if applicable)", question: "If affiliated with a national or parent organization, describe the roles you each play in the following:", question_type: "multiple input"},
  {rfp_section: "Legal Actions", question: "Please describe any current, anticipated, or past civil, criminal, legal or regulatory issues, violations, lawsuits, or claims against the organization or any personnel.", question_type: "single input"}
]

rfp_subquestion_array = [
  {rfp_question: "Please your largest program", question: "Program Title"},
  {rfp_question: "Please your largest program", question: "What Issue or Need Does This Program Try to Address"},
  {rfp_question: "Please your largest program", question: "Area Served"},
  {rfp_question: "Please your largest program", question: "Current Number Served"},
  {rfp_question: "Please your largest program", question: "What is particularly effective about this program"},
  {rfp_question: "Please your largest program", question: "Short Program Description"},
  {rfp_question: "Please your largest program", question: "Target Population"},
  {rfp_question: "Please your largest program", question: "What is the Unique focus of this program"},
  {rfp_question: "Please your largest program", question: "Ages Served"},
  {rfp_question: "Please your second largest program", question: "Program Title"},
  {rfp_question: "Please your second largest program", question: "What Issue or Need Does This Program Try to Address"},
  {rfp_question: "Please your second largest program", question: "Area Served"},
  {rfp_question: "Please your second largest program", question: "Current Number Served"},
  {rfp_question: "Please your second largest program", question: "What is particularly effective about this program"},
  {rfp_question: "Please your second largest program", question: "Short Program Description"},
  {rfp_question: "Please your second largest program", question: "Target Population"},
  {rfp_question: "Please your second largest program", question: "What is the Unique focus of this program"},
  {rfp_question: "Please your second largest program", question: "Ages Served"},
  {rfp_question: "Please list your senior leadership team.", question: "Name"},
  {rfp_question: "Please list your senior leadership team.", question: "Title and Biography"},
  {rfp_question: "Please list your board members, with brief descriptions of their background and number of years served. Indicate if any board member is receiving compensation from the organization.", question: "Board Member"},
  {rfp_question: "Please list your board members, with brief descriptions of their background and number of years served. Indicate if any board member is receiving compensation from the organization.", question: "Background, Responsibilites and Years served"},
  {rfp_question: "Please indicate the following for the current fiscal year and three previous years:", question: "Fiscal year ended"},
  {rfp_question: "Please indicate the following for the current fiscal year and three previous years:", question: "Revenues"},
  {rfp_question: "Please indicate the following for the current fiscal year and three previous years:", question: "Expenditures"}
]

rfp_sections.each do |section|
  rfp_section = RfpSection.create!(name: section)
  rfp_question_array.each do |question|
    if question[:rfp_section] == section
      rfp_question = RfpQuestion.create!(rfp_section_id: rfp_section.id, question: question[:question], question_type: question[:question_type])
      rfp_subquestion_array.each do |subquestion|
        if subquestion[:rfp_question] == question[:question]
          SubQuestion.create!(rfp_question_id: rfp_question.id, question: subquestion[:question])
        end
      end
    end
  end
end

section_array = ["Contact Information","Organization","Overview and Mission","Vision","Key Concerns","Organizational Capacity Challenges","Referral Source","Demographics","Geographic Focus"]

questions_array = [
  {question: "Organization", section: "Contact Information"},
  {question: "Address", section: "Contact Information"},
  {question: "Phone", section: "Contact Information"},
  {question: "Website", section: "Contact Information"},
  {question: "Executive Director", section: "Contact Information"},
  {question: "Executive Director Phone", section: "Contact Information"},
  {question: "Executive Director E-mail", section: "Contact Information"},
  {question: "Please enter the password provided during the mandatory briefing call:", section: "Contact Information"},
  {question: "Number of Employees", section: "Organization"},
  {question: "Number of  Volunteers", section: "Organization"},
  {question: "Number of Active Board Members", section: "Organizationn"},
  {question: "Total Annual Budget for Organization", section: "Organization"},
  {question: "If affiliated with a national or parent organization, what role does the organization play in your strategic direction, operations, and overall governance", section: "Organization"},
  {question: "Has your organization previously applied for SVP IC of SVP Fast Pitch? If so, please indicate which one(s) and the year(s):", section: "Organization"},  
  {question: "Provide a brief summary of your organization's mission and history.  Please provide your organization's mission statement, if you have one", section: "Overview and Mission"},
  {question: "What is your organization’s vision and what do you hope to accomplish over the next three years", section: "Vision"},
  {question: "Short description (preferably bullets) of the 1-3 things that keep you up at night", section: "Key Concerns"},
  {question: "Board Development/Governance", section: "Organizational Capacity Challenges"},
  {question: "Business Operations", section: "Organizational Capacity Challenges"},
  {question: "Fund Development", section: "Organizational Capacity Challenges"},
  {question: "Marketing", section: "Organizational Capacity Challenges"},
  {question: "Strategic Planning", section: "Organizational Capacity Challenges"},
  {question: "Technology", section: "Organizational Capacity Challenges"},
  {question: "Other", section: "Organizational Capacity Challenges"},
  {question: "How did you learn of the opportunity to present an LOI to SVP Chicago", section: "Referral Source"},
  {question: "Alcoholism & Addiction", section: "Demographics"},
  {question: "Arts/Literacy", section: "Demographics"},
  {question: "College Persistence", section: "Demographics"},
  {question: "Community Programs", section: "Demographics"},
  {question: "Domestic Violence", section: "Demographics"},
  {question: "Early Childhood", section: "Demographics"},
  {question: "Elderly Care", section: "Demographics"},
  {question: "Ex Con Support", section: "Demographics"},
  {question: "Financial Literacy", section: "Demographics"},
  {question: "Food Insecurity", section: "Demographics"},
  {question: "Health", section: "Demographics"},
  {question: "Housing", section: "Demographics"},
  {question: "Immigrants", section: "Demographics"},
  {question: "Legal Aid", section: "Demographics"},
  {question: "Mental Health", section: "Demographics"},
  {question: "Place-based", section: "Demographics"},
  {question: "Pregnancy and Parenting", section: "Demographics"},
  {question: "STEM", section: "Demographics"},
  {question: "Workforce Development", section: "Demographics"},
  {question: "Other", section: "Demographics"},
  {question: "Violence & Abuse", section: "Demographics"},
  {question: "City of Chicago", section: "Geographic Focus"},
  {question: "Chicagoland", section: "Geographic Focus"},
  {question: "Chicago and Beyond", section: "Geographic Focus"}
]

section_array.each do |section|
  loi_section = Section.create!(name: section)
  questions_array.each do |question|
    if question[:section] == section
      Question.create!(question: question[:question], section_id: loi_section.id)
    end
  end
end

InviteMax.create!([
  {max: 20}
])

Landing.create!([
  {year: "2016", sector_focus: "Breaking the Cycle of Poverty", main_points: "Social Venture Partners Chicago seeks to invest our time, expertise, and funds over the next 3 years in a non-profit organization that is working to address breaking the cycle of poverty in the Chicagoland area.\r\n\r\nWe are especially interested in organizations with strong leaders and that are at an inflection point in their organizational lifecycle.\r\n\r\nOur aim is to partner with the selected organization to actively work to increase the capacity and scale of the organization, thereby measurably increasing the impact of their programs and services.", gray_section: "Your organization’s primary focus is to address the cycle of poverty in Chicagoland.\r\n\r\nYour programs are scalable and replicable.\r\n\r\nYour programs have a track record of demonstrable success and create lasting impact.\r\n\r\nYour budget is greater than $250,000 but less than $5,000,000.\r\n\r\nYour staff and board desire growth and hands-on assistance in building your organizational capacity in areas such as Strategic Planning, Board Development/Governance, Fund evelopment, Business Operations (including Accounting/Finance), Marketing, and Technology.", last_point: "Community-based and grass roots organizations are encouraged to apply. \r\nPlease note that foundations, governmental entities, and religious organizations are not appropriate for partnership with us to build lasting organizational capacity and will not be considered for our investment."}
])
