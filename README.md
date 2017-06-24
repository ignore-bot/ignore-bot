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
- file_name CHAR(128) NOT NULL

```
CREATE TABLE repositories ( ... );
DELETE FROM repositories;
DROP TABLE repositories;
```

## Functionality

**Authentication**
- Save user's OAuth token 
- Add to Organization (as bot)
- Accept Invite (as user)

**Hourly**
- Search Repos with Bad Files (as user)
- Fork on Github to Org (as user) 
- Clone, Edit Git Ignore, Push
- Create Pull Request (as user)
- Delete Fork (as user)

## Numbers

> 500,000 Repos with `.DS_Store` files

**API Requests**
List 100 per Requests: 5,000 Requests to list all  
Fork Each: 500,000 Requests  
Clone/Edit/Push: 0 Requests  
Create PR: 500,000 Requests  
Delete Forks: 500,000 Requests  

Total Requests: ~1,500,000

With 100 Users @ 5000 Requests Each (500,000 Requests/Hour) it would take ~3 Hours

**Network Traffic**
Average Repo Size: 25 MB (total guess here)  

Assuming API interactions are negligible (< 1 KB), total traffic of 25 * 2 (pull & push) * 500,000 = 25,000,000 which is **25 TB**
