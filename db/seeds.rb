Question.create!([
  {question: "Organization", section_id: 1},
  {question: "Number of Employees", section_id: 2},
  {question: "Address", section_id: 1},
  {question: "Number of  Volunteers", section_id: 2},
  {question: "Number of Active Board Members", section_id: 2},
  {question: "Provide a brief summary of your organization's mission and history.  Please provide your organization's mission statement, if you have one", section_id: 3},
  {question: "What is your organization’s vision and what do you hope to accomplish over the next three years", section_id: 4},
  {question: "Board Development/Governance", section_id: 6},
  {question: "Business Operations", section_id: 6},
  {question: "Fund Development", section_id: 6},
  {question: "How Did You Learn of the opportunity to present an LOI to SVP Chicago", section_id: 7},
  {question: "Alcoholism & Addiction", section_id: 8},
  {question: "Education", section_id: 8},
  {question: "City of Chicago", section_id: 9},
  {question: "Short description (preferably bullets) of the 1-3 things that keep you up at night", section_id: 5},
  {question: "Marketing", section_id: 6},
  {question: "Strategic Planning", section_id: 6},
  {question: "Technology", section_id: 6},
  {question: "Other", section_id: 6},
  {question: "Elderly Care", section_id: 8},
  {question: "Food", section_id: 8},
  {question: "Health & Medical", section_id: 8},
  {question: "Chicagoland", section_id: 9},
  {question: "Chicago and Beyond", section_id: 9}
])

Section.create!([
  {name: "Contact Information"},
  {name: "Oganization"},
  {name: "Overview and Mission"},
  {name: "Vision"},
  {name: "Key Concerns"},
  {name: "Organizational Capacity Challenges"},
  {name: "Referral Source"},
  {name: "Demographics"},
  {name: "Geographic Focus"}
])
