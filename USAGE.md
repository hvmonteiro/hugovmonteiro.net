# How to edit the site in realtime
  
  
# Running Hugo Website
  
1. Build the site:  
`npm run hugo:build`
  
2. Start development server:  
`npm run hugo:dev`
Open the browser in wich ever URL is presented in the output (ex:`http://localhost:1313`).  
  
3. Change/Edit/Create:
Change what you need, the changes will be immediately rendered/shown in realtime on the browser.  
  
4. Preview the site:  
`npm run hugo:server`
  
5. Push changes to the repository:  
`git add <files>`
`git commit`
`git push`

REMEMBER: Authentication is now done with an Access Token.
```  
git push
Username for 'https://github.com': hvmonteiro
Password for 'https://hvmonteiro@github.com': <insert access token here>
```  
  
  
# Troubleshooting
  
## Error: code ETARGET
`npm install`
  
Ouput:
```  
npm ERR! code ETARGET
npm ERR! notarget No matching version found for exec-bin@^7.0.0.
npm ERR! notarget In most cases you or one of your dependencies are requesting
npm ERR! notarget a package version that doesn't exist.

npm ERR! A complete log of this run can be found in: /home/hugo/.cache/npm/_logs/2025-07-15T21_18_30_339Z-debug-0.log
```
    
### Solution:
Check Available Versions:
`npm view exec-bin versions`
  
Update your `package.json`.  
Replace ^7.0.0 with the available latest version (for example, ^6.0.0) in your devDependencies:  
```  
json
"devDependencies": {
  "exec-bin": "^6.0.0"
}
```  
  

