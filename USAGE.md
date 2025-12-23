# Usage


# Setup Editing Environment

## Windows
Winget is Microsoft’s official free and open-source package manager for Windows:

### Install Hugo
To install the extended edition of Hugo
```
winget install Hugo
```

### Install Go
```
winget install go
```

### Install Git client
To install the official windows git client:
```
winget show Git
```

## Linux

### Install Hugo using 'snap' package manager:
```
sudo snap install hugo
```

### Install Go
```
sudo snap install go
```
  
# How to edit the site in real-time
  
  
## Running Hugo Website
  
1. Build the site to deploy in production:  
`./hugo prod`
  
2. Start development server to edit and make changes:  
`./hugo.sh dev`
  
3. Change/Edit/Create:
Open the browser in which ever URL is presented in the output (ex:`http://localhost:1313`).  
Change what you need, the changes will be immediately rendered/shown in real-time on the browser.  
  
4. Push changes to the repository:  
`git add <files>`
`git commit`
`git push`

REMEMBER: Authentication is now done with an Access Token.
```  
git push
Username for 'https://github.com': hvmonteiro
Password for 'https://hvmonteiro@github.com': <insert access token here>
```  
  
  
