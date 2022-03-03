from selenium.webdriver.common.keys import Keys
from selenium import webdriver
import webbrowser
import requests
import argparse
import time
from . import __version__



def find_new_jobs(username, password, chromedriver, filepath):
    driver = webdriver.Chrome(chromedriver)
    driver.get("https://www.linkedin.com/login")
    login = driver.find_element_by_id("username")
    login.send_keys(username)
    login = driver.find_element_by_id("password")
    login.send_keys(password)

    login.send_keys(Keys.RETURN)
    time.sleep(3)

    url = "https://www.linkedin.com/jobs/search/?f_E=2%2C3&f_TPR=r86400&f_WT=2&geoId=101165590&keywords=devops%20engineer&sortBy=R"

    driver.get(url)

    # copy selector:
    # body > div.application-outlet > div.authentication-outlet > div.job-search-ext
    # > div.jobs-search-two-pane__wrapper > div > section.jobs-search__left-rail > div >
    # header > div.jobs-search-results-list__title-heading > small
    search_results_count = int(driver.find_element_by_css_selector(
        'div.jobs-search-results-list__title-heading > small').get_attribute('innerText').replace(' results', ''))

    print(search_results_count)

    i = 2
    job_ids = []
    while i <= int(search_results_count/25)+1:
        driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
        i = i + 1
        try:
            driver.find_element_by_xpath('/html/body/main/div/section/button').click()
            time.sleep(5)
        except:
            pass
            time.sleep(5)

        job_lists = driver.find_element_by_class_name(
            'jobs-search-results__list.list-style-none')

        jobs = job_lists.find_elements_by_tag_name('li')

        job_ids = []

        for job in jobs:
            try:
                job_id = job.get_attribute(
                    'data-occludable-entity-urn').split(':')[3]
                job_ids.append(job_id)

            except Exception:
                pass

    with open(filepath, 'a+') as f:
        for id in job_ids:
            exists = any(id in line for line in f)
            if not exists:
                f.write("{}\n".format(id))
                webbrowser.open(
                    'https://www.linkedin.com/jobs/view/{}/'.format(id))


def run():
    commands = {
        'jobs': "prints out jobs you haven't seen before",
    }

    parser = argparse.ArgumentParser()
    parser.add_argument('command', nargs='?', choices=commands.keys(), default='jobs',
                        help="\n".join(["{}: {}".format(k, v) for (k, v) in commands.items()]))
    parser.add_argument('-u', '--username', default=None,
                        nargs="?", help='email address')
    parser.add_argument('-p', '--password', default=None,
                        nargs="?", help='password')
    parser.add_argument('-cp', '--driverpath', default=None, nargs="?",
                        help='add the absolute path to your chrome driver')
    parser.add_argument('-fp', '--filepath', default=None, nargs="?",
                        help='file for already viewed jobs')

    args = parser.parse_args()

    if args.command == 'jobs':
        find_new_jobs(args.username, args.password, args.driverpath, args.filepath)
    

    