@echo off
@echo off

echo Setting up your project...

:: Install Python dependencies
pip install -r requirement.txt

:: Add virtual environment's Scripts folder to PATH
set PATH=%PATH%;C:\Users\Professional\PycharmProjects\RobotFramework\venv\Scripts

echo Setup complete.