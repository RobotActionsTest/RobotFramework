from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from robot.api.deco import keyword
import pyautogui
import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service as ChromeService
from webdriver_manager.chrome import ChromeDriverManager


@keyword
def setup_chrome_webdriver():
    driver = webdriver.Chrome(service=ChromeService(ChromeDriverManager().install()))
    print(driver)
    return driver


def get_chromedriver_path():
    service = ChromeService(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service)
    return ChromeDriverManager().install()


#old
#@keyword
#def get_chromedriver_path():
    #driver_path = ChromeDriverManager().install()
    #print(driver_path)
    #return driver_path

@keyword
def get_geckodriver_path():
    driver_path = GeckoDriverManager().install()
    print(driver_path)
    return driver_path

@keyword
def upload_image_map_item_image(file_path):
    pyautogui.write(file_path)
    pyautogui.press('enter')
    time.sleep(1)



