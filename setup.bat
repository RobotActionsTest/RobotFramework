@echo off
@echo off

echo Setting up your project...

:: Install Python dependencies
pip install -r requirements.txt

:: Add virtual environment's Scripts folder to PATH
set PATH=%PATH%;C:\Users\Professional\PycharmProjects\RobotFramework\venv\Scripts

:: Download and manage browser drivers
C:\Users\Professional\PycharmProjects\RobotFramework\venv\Scripts\webdriver-manager update --versions.chrome=<chrome_version> --standalone
C:\Users\Professional\PycharmProjects\RobotFramework\venv\Scripts\webdriver-manager update --versions.firefox=<firefox_version> --standalone

echo Setup complete.