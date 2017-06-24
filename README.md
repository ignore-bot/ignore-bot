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
Fork Repos: 500,000 Requests  
Edit Files: 500,000 Requests  
Create PRs: 500,000 Requests  
Delete Forks: 500,000 Requests  
Total Requests: ~2,000,000

With 100 Users @ 5000 Requests Each (500,000 Requests/Hour) it would take **4 Hours**  
With 1 User @ 5000 Requests it would take **17 Days**

**Network Traffic**

List Repos (per 100): 100 B up, 500 KB down = 500 KB * 5,000 = 2500 MB  
Fork Repos: 100 B * 500,000 = 50 MB  
Edit Files: 100 B * 500,000 = 50 MB  
Create PRs: 100 B * 500,000 = 50 MB  
Delete Forks: 100 B * 500,000 = 50 MB  
Total Traffic: 2700 MB

With a network speed of 1 MB/s, it would take **45 Minutes**

> 100 B comes from approximation of each request sent.  
> 5 MB from each request comes from counting 1 result as 5 KB times 100 results per page
