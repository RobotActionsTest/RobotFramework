import subprocess

def run_robot_tests(test_suite_path, include_tags=None):
    command = ["robot"]

    if include_tags:
        command.extend(["--include", include_tags])

    command.append(test_suite_path)

    try:
        subprocess.run(command, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Robot Framework tests failed with error: {e}")
    except Exception as ex:
        print(f"An unexpected error occurred: {ex}")

if __name__ == "__main__":
    test_suite_path = "..\\tests\\AddBots.robot"  # Replace with the path to your Robot Framework test suite
    include_tags = "NewAppPopup"  # Replace with the specific tag you want to include (e.g., smoke, regression)

    run_robot_tests(test_suite_path, include_tags)