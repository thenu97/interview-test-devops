# Coding Test

## Brief
Build a basic tool in Python, Ruby or another language of your choice that does _something_ you'd normally end up having to do manually. Some ideas:

* Backing up a database and sending the output to a cloud storage solution.
* A basic API to provide you with some useful information.
* Getting some information back from an external source and presenting it to the end user.

Again, bonus points:

* If you're using third-party packages, make sure to use a packaging solution such as Pipenv or Bundler.

## Solution
My solution was to create a python script to check for jobs that I haven't seen in the last 24 hours with the keyword `DevOps` and `remote`.

## Rolling Changes


## Improvements
+ implement time modification
+ instead of opening up the link to the job, display a short summary and have it hyperlinked

## Setup
+ clone this repo `git clone https://github.com/thenu97/interview-test-devops.git`
+ navigate to dev branch `git checkout dev`
+ cd into jobsearch_bink directory e.g: `cd ./interview-test-devops/02_coding_test/jobsearch_bink`
+ run `pip install .` in that directory
+ run `jobsearch_bink -u '<email_address>'  -p '<password>' -cp '<path_to_driver>' -fp '<path_to_file_for_previously_viewed_jobs'`
    * e.g: `jobsearch_bink -u 'bink@outlook.com'  -p 'fake123' -cp '/Users/bink/Downloads/chromedriver.exe' -fp './viewedjobs'`
