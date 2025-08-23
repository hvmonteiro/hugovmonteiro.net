# Usage


# Setup Editing Environment

## Windows
Winget is Microsoft’s official free and open-source package manager for Windows:

### Install Hugo
To install the extended edition of Hugo
```
winget install Hugo.Hugo.Extended
```

### Install Git client
To install the official windows git client:
```
winget show Git.Git
```

## Linux

### Install nodejs:
```
sudo su - apt-get install nodejs
```
  
### Install Hugo using 'snap' package manager:
```
sudo snap install hugo
```
  
### Install all node modules:
```
npm install
```

### Correct Hugo binary path under node_modules:
```
ln -s /snap/bin/hugo /node_modules/hugo-bin/vendor/hugo
```



# How to edit the site in real-time
  
  
## Running Hugo Website
  
1. Build the site to deploy in production:  
`npm run hugo:build`
  
2. Start development server to edit and make changes:  
`npm run hugo:dev`
Open the browser in which ever URL is presented in the output (ex:`http://localhost:1313`).  
  
3. Change/Edit/Create:
Change what you need, the changes will be immediately rendered/shown in real-time on the browser.  
  
4. Preview the site in real-time (changes in files will redirect the browser):  
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
  
### Output:
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
  
## Error: code ENOENT
`npm run hugo:dev`

### Output:
```
> hugovmonteiro.net@2.0.0 hugo:dev
> hugo mod clean --all && hugo server --minify --disableFastRender --navigateToChanged --templateMetrics --templateMetricsHints --buildDrafts --buildExpired --buildFuture --watch --forceSyncStatic -D

node:events:486
      throw er; // Unhandled 'error' event
      ^

Error: spawn /mnt/c/Users/hugom/Dropbox/workspace/websites/hugovmonteiro.net/node_modules/hugo-bin/vendor/hugo ENOENT
    at ChildProcess._handle.onexit (node:internal/child_process:286:19)
    at onErrorNT (node:internal/child_process:484:16)
    at process.processTicksAndRejections (node:internal/process/task_queues:90:21)
Emitted 'error' event on ChildProcess instance at:
    at ChildProcess._handle.onexit (node:internal/child_process:292:12)
    at onErrorNT (node:internal/child_process:484:16)
    at process.processTicksAndRejections (node:internal/process/task_queues:90:21) {
  errno: -2,
  code: 'ENOENT',
  syscall: 'spawn /mnt/c/Users/hugom/Dropbox/workspace/websites/hugovmonteiro.net/node_modules/hugo-bin/vendor/hugo',
  path: '/mnt/c/Users/hugom/Dropbox/workspace/websites/hugovmonteiro.net/node_modules/hugo-bin/vendor/hugo',
  spawnargs: [ 'mod', 'clean', '--all' ]
}

Node.js v24.6.0
```

### Solution:
```
$ which hugo
/snap/bin/hugo

ln -s /snap/bin/hugo /node_modules/hugo-bin/vendor/hugo
```
  
