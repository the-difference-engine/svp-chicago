Section.create!([
  {name: "Organization"},
  {name: "Contact Information"},
  {name: "Overview and Mission"},
  {name: "Vision"},
  {name: "Key Concerns"},
  {name: "Organizational Capacity Challenges"},
  {name: "Referral Source"},
  {name: "Demographics"},
  {name: "Geographic Focus"}
])

Question.create!([
  {question: "Organization", section_id: 1},
  {question: "Number of Employees", section_id: 2},
  {question: "Address", section_id: 1},
  {question: "Phone", section_id: 1},
  {question: "Website", section_id: 1},
  {question: "Executive Director", section_id: 1},
  {question: "Executive Director Phone", section_id: 1},
  {question: "Executive Director E-mail", section_id: 1},
  {question: "Number of  Volunteers", section_id: 2},
  {question: "Number of Active Board Members", section_id: 2},
  {question: "Total Annual Budget for Organization", section_id: 2},
  {question: "If affiliated with a national or parent organization, what role does the organization play in your strategic direction, operations, and overall governance", section_id: 2},
  {question: "Provide a brief summary of your organization's mission and history.  Please provide your organization's mission statement, if you have one", section_id: 3},
  {question: "What is your organization’s vision and what do you hope to accomplish over the next three years", section_id: 4},
  {question: "Short description (preferably bullets) of the 1-3 things that keep you up at night", section_id: 5},
  {question: "Board Development/Governance", section_id: 6},
  {question: "Business Operations", section_id: 6},
  {question: "Fund Development", section_id: 6},
  {question: "Marketing", section_id: 6},
  {question: "Strategic Planning", section_id: 6},
  {question: "Technology", section_id: 6},
  {question: "Other", section_id: 6},
  {question: "How did you learn of the opportunity to present an LOI to SVP Chicago", section_id: 7},
  {question: "Alcoholism & Addiction", section_id: 8},
  {question: "Education", section_id: 8},
  {question: "Elderly Care", section_id: 8},
  {question: "Food", section_id: 8},
  {question: "Health & Medical", section_id: 8},
  {question: "Homelessness", section_id: 8},
  {question: "Jobs Programs", section_id: 8},
  {question: "Mental Health", section_id: 8},
  {question: "Pregnancy and Parenting", section_id: 8},
  {question: "Violence & Abuse", section_id: 8},
  {question: "City of Chicago", section_id: 9},
  {question: "Chicagoland", section_id: 9},
  {question: "Chicago and Beyond", section_id: 9}
])
