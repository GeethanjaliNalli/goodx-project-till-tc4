*** Settings ***
# Super resource file to import all common and generated resources for test execution

# Existing imports (if any) would be above

# --- Keyword Resource Imports ---
Resource    ../keywords/quick_note_page.resource

# --- Test Data Resource Imports ---
Resource    ../Testdata/quick_note_page.resource

# --- Robot Test Suite Imports ---
# Note: Robot test suites are not imported in super.resource as per best practices.
