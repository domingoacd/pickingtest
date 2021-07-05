# pickingtest

The test is divided in two folders, 

- javascript: Contains the solution written in javascript language
- ruby: Contains the solution written in ruby language

## Installation

#### Javascript
1) Execute **npm install**
2) Then execute **npm test**

The tests are handled by Jest

#### Ruby

**To run the tests**
1) Execute **rspec spec**

**To build the gem**
1) Execute **gem build ruby.gemspec**
2) Then **gem install ruby-0.1.2.gem**
3) Execute the command **irb**
4) Write **require "ruby"** and press enter
5) And execute the method **get_recommendations_from_JSON(*path_to_json*)** changing *path_to_json* for one of the following strings:

- "recommendations1.json"
- "recommendations2.json"
- "recommendations3.json"
- "recommendations4.json"
