# vercon
A version control system for a single user without any access to internet

## Why not find a workaround for other VCS like git or svn?

1. A workaround is a workaround. Since other VCS are designed to be used with mutliple people who have access to internet, the workaround is going to be inherently hacky. This means that this workaround is going to be complicated and long. The more complicated steps, the more likely something might go wrong. Vercon intends to be a convinient alternative for those who do not need the full features of traditional VCS.

2. The project became needed when I had to write a program on a server without any access to internet. Not only did it lack internet, it did not have VCS tools such as git. At that point, a workaround was a luxry

## Usage

### easiest option 
Run the script at any point you want to save

### laziest option
Run a cronjob with your specified interval to mimic autosave

### best option 
alias it so you can use it like a commandline

## Commands

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
- Version IDs are timestamps which are very human-readable 
- Autosave

## Cons
- cannot save to cloud



