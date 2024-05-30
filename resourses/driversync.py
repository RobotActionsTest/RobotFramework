from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from robot.api.deco import keyword
import pyautogui
import time


@keyword
def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    print(driver_path)
    return driver_path


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



