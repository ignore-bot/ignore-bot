# ignore-bot
Github API Bot which makes PRs to Ignore Common Files

## Documentation

[Converting cURL to Ruby](https://jhawthorn.github.io/curl-to-ruby/)

[Example Query for .DS_Store](https://github.com/search?utf8=%E2%9C%93&q=filename%3A.DS_Store+path%3A%2F&type=Code)

[API Docs for Searching](https://developer.github.com/v3/search/#search-code)

[API Docs for Search Query Syntax](https://help.github.com/articles/search-syntax/)

[API Docs for Search Query on Code Syntax](https://help.github.com/articles/searching-code/)

## MySQL

Database: ignore_bot

Table: repositories
- id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
- full_name CHAR(128) NOT NULL

## Functionality

- Search Repos with Bad Files 
- Fork on Github, Clone, Edit Git Ignore, Push
- Create Pull Request
