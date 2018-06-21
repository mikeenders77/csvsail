# README

## How to clone this repo, rename it, and use it for whatever you'd like

- Copy the clone url (`git@github.com:mikevallano/templatetest.git`)
- Clone to the folder where you want to store it (If you already have a project with the same name,
clone into a different folder, follow steps to rename the app, then move it where you'd like).
- `git clone git@github.com:mikevallano/templatetest.git`
- Rename the project (`mv templatetest the-new-name-you-want`)
- Move the project to where you want it (`mv new-name learning-practice/`)
- Rename the necessary files in the application. (just search the app for  `templatetest` without case sensitivity).
Should be the following files:
  - `config/cable.yml`
  - `config/database.yml` (search for all-caps version of the app name)
  - `config/environments/production.rb`
  - `package.json`

- `bundle`
- `rake db:create`
- `rake db:migrate`

### Change git remote
- Go to Github and create a new repo for the new project. Then you'll set the remote.
- `git remote -v` (will show the fetch and push remotes)
Set the new remote URL:
- `git remote set-url origin git@github.com:[your-user-name/new-project-name.git]`
- git remote -v to confirm
- git push origin master

