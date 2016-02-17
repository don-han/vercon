# vercon
A version control system for a single user without any access to internet

## Usage

### easiest option 
Run the script at any point you want to save

### laziest option
Run a cronjob with your specified interval to mimic autosave

### best option 
alias it so you can use it like an actual command

## Commands (under the assumption that you have aliased the bash script to `vc`)

vc init : initialize vercon 

vc add : add files you want to save 
vc save : save all files you have added with a message

vc status : 
vc log : see save logs

vc show : see changes with parent
vc diff : see changes between two saves

vc branch : list, create, or delete branches
vc checkout : checkout a branch of a working tree

vc autosave

## Features

- Vercon will save a new version only if the file is edited. 
- Version IDs are timestamps which are very human-readable, so it's easy to navigate
- Autosave

