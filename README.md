# cs-final

This read me will contain an overview of the whole repository. My plan is to use Git and Github for storing timesheets, artefact, final report and any other files related to my final project. I will keep updating the readme as I continue to work and add new files to the repository.

## repository overview

```
literature_review_papars/ # I saved all papers for reference
note_app/ # source code and other assets for web app
    napp/
product_screenshots/ # screenshots of final product
report_src/ # folder for final report source code and compiled document
system_design/ # screenshots and files related to system design
timesheets/ # timesheet entries
.gitignore # file that tells git to ignore certain files or directories
Implementation_diary.md 
README.md # this file
TOS.md # draft terms of service
draft.md # drafting file
literature_review.md # literature review draft
privacy_policy.md # privacy policy draft
project_plan.md # project plan draft
requirement_analysis.md # requirement analysis draft
system_design.md # system design draft
```

## How to run locally

```
# clone repository or unzip repository
## clone

git clone https://github.com/HubTakenIs/cs-final.git

## unzip in current directory

tar -zxf project.tar.gz

## unzip to specific directory

tar -zxf project.tar.gz -C /temp

# cd into repository

cd cs-final

# cd into note_app

cd note_app

# create python virtual environment

python3 -m venv .venv

# activate environment

source .venv/bin/activate

# install napp

pip install .

# initialise the database

flask --app napp init-db

# run flask debug

flask --app napp run --debug

# run waitress locally

waitress-serve --call 'napp:create_app'

# if this doesn't work because of database error this might fix it
cp instance/napp.sqlite .venv/var/napp-instance/
```


## How to host
To host the application on ubuntu, you would need to set up a systemd service. It can be used to spawn a Waitress processes to run the application.
below, are the general steps on building a package and getting ready to deploy. You would also need to set up a reverse proxy with ssl and systemd service.
```
# use steps from previous block, upto where you activate virtual environment

# set up build tools

pip install --upgrade pip setuptools wheel build

# build

python -m build

# install on new directory

mkdir ~/hosted_app # make directory
cp dist/napp*.whl /home/USER/hosted_app/ # replace user with your user
cd /home/USER/hosted_app/ # replace user with your user
python3 -m venv .venv
source .venv/bin/activate
pip install *.whl --force-reinstall
flask --app napp init-db


```

## How to compile Typst documents

```
# clone repository or unzip repository
## clone

git clone https://github.com/HubTakenIs/cs-final.git

## unzip in current directory

tar -zxf project.tar.gz

## unzip to specific directory

tar -zxf project.tar.gz -C /temp

# cd into repository

cd cs-final

# cd into either report directory

cd report_src

## or 

cd prof_report.typ

# have Typst installed and verify it's working

typst --version

# compile document

typst compile prof_report.typ

## or

typst compile report.typ

# or use something like this to compile and open in browser

typst compile prof_report.typ && firefox.exe prof_report.pdf
```