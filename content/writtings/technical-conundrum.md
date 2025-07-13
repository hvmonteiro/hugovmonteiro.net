+++
title = 'Technical Conundrum'
date = 2024-04-12T13:28:43+01:00
draft = false
showTableOfContents = true
image = "/images/avatar.png"
type = "post"
tags = ["corporation”, “architecture”, “r&d”, “solution designer”, “systems"]
[params]
  author = 'Hugo Monteiro'
+++
# Technical Conundrum

**Definition**: A conundrum is a puzzling question or problem that is difficult to resolve. It often involves a situation where there are conflicting or contradictory elements, making it challenging to find a satisfactory solution or answer. Conundrums can be thought-provoking and require creative thinking to untangle. They are often used in literature, puzzles, and philosophical discussions to stimulate thought and engage the mind.

# Architects and solution designers

Architects and solution designers play a crucial role in designing systems used by R&D, and these systems and applications often come with specific rules to maintain a complete back history of changes, usually through log files. These logs serve multiple purposes, including troubleshooting, auditing, security and compliance.

However, it’s becoming very common watching people outside those roles being given the authority and decision-making over architects and solution designers, for which those people lack technical knowledge, and very often creates a situation where critical decisions are made without a full understanding of future implications.

These almost always comes in times of financial challenges, and the need of cutting operating costs. But the problem runs more deep than that, with the root cause coming from the disadvantageous contracts the company entered into with vendors in the past.  

In some cases, where a decision was made to outsource the storage service, these contracts often impose higher storage costs on the company compared to owning the storage infrastructure. As a result, sometimes the company is forced to make difficult decisions, such as deleting log files to free up storage space and reduce costs, since the data itself should not be deleted, which will impact the ability to have historical data available for future analysis, with impacts on systems consolidation, decommissioning and most importantly security audits.

This situation, regarding people being granted temporary authority and decision-making responsibilities over those who should originally possess them, raises several important points:

1. **Contractual Liability**: The company's decision to enter into a contract with unfavourable terms has put it at a disadvantage. The contract likely lacks flexibility or imposes penalties for changing storage providers or renegotiating terms. This highlights the importance of careful negotiation and review of contracts to ensure they align with the company's long-term goals and financial interests.
2. **Cost Considerations**: The decision to delete log files to reduce storage costs may seem like a short-term solution to alleviate financial strain. However, it comes with significant risks and long-term repercussions. Log files are vital for maintaining a comprehensive record of system activities and changes, which is crucial for troubleshooting issues, ensuring compliance, and analysing trends. Deleting these files compromises the company's ability to effectively manage and secure its systems, potentially leading to increased downtime, security breaches, and regulatory non-compliance.
3. **Future Repercussions**: The company's actions to lower storage costs by sacrificing critical data integrity can have severe consequences in the future. Without comprehensive log files, the company may struggle to identify and address issues, leading to prolonged outages, degraded performance, and diminished customer trust. Moreover, regulatory requirements may mandate the retention of certain data for a specified period, and deleting log files prematurely could result in legal and financial penalties.

In summary, this scenario underscores the importance of strategic decision-making, thorough contract analysis, and risk assessment in business operations. It highlights the need for companies to prioritize long-term sustainability and resilience over short-term cost-cutting measures, especially when it comes to critical infrastructure and data management. By understanding the implications of contractual agreements and making informed choices, companies can mitigate risks and safeguard their interests in an ever-evolving business landscape, especially in today’s environment where cybersecurity is at the center of everything.
