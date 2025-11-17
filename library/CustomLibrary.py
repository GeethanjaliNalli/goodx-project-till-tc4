from datetime import date
from dateutil.relativedelta import relativedelta
from Browser import Browser
from datetime import date, timedelta
import time
import random
import openpyxl

class CustomLibrary(object):
        
    def get_ms_excel_row_values_into_dictionary_based_on_key(self, filepath, keyName, sheetName=None):
        """Reads Excel and returns a row as a dictionary based on the given key."""
        workbook = openpyxl.load_workbook(filepath)
        sheet_names = workbook.sheetnames
        result_dict = {}
        if sheetName is None:
            sheetName = sheet_names[0]
        if not self.is_sheet_exists(filepath, sheetName):
            return result_dict
        worksheet = workbook[sheetName]
        rows = list(worksheet.iter_rows(values_only=True))
        headers = rows[0]
        for row in rows[1:]:
            if str(row[0]) != str(keyName):
                continue
            for idx, cell_data in enumerate(row):
                if cell_data is None or str(cell_data).strip() == "":
                    continue
                cell_data = self.get_unique_test_data(cell_data)
                result_dict[str(headers[idx])] = str(cell_data)
        return result_dict

    def is_sheet_exists(self, filepath, sheetName):
        """Validates if a given sheet exists in the Excel file."""
        try:
            workbook = openpyxl.load_workbook(filepath)
            return sheetName.lower() in (s.lower() for s in workbook.sheetnames)
        except FileNotFoundError:
            return False
        except Exception as e:
            return False

    def get_unique_test_data(self, testdata):
        """Replaces the word 'UNIQUE' with a unique timestamp string."""
        random_number = f'{random.randint(0, 999999):06d}'
        timestamp = time.strftime("%Y%m%d%H%M%S") + random_number
        for keyword in ["UNIQUE", "Unique", "unique"]:
            testdata = str(testdata).replace(keyword, timestamp)
        return testdata
    
    def __init__(self):
        self.browser = Browser()

    def enter_data(self, fields: dict):
        """
        Fill form fields from a dictionary.
        'fields' is a Robot dict that maps locator -> value OR locator -> {"select": "Option"}.
        Example keys: "css=#name" or "${select.type}" variables resolved by Robot.
        """
        page = self.browser.get_current_page()

        # Defensive: make sure we got a dict
        if not isinstance(fields, dict):
            raise ValueError("enter_data expects a dictionary. Got: %r" % (fields,))

        for locator, value in fields.items():
            # NOTE: Robot passes locator variable names already expanded to string values,
            # so 'locator' should be the actual CSS/XPath string (or variable value pointing to it).
            # Handle select vs fill
            if isinstance(value, dict) and "select" in value:
                option = value["select"]
                # Playwright's select_options expects value(s) — here we attempt label; adapt if needed
                try:
                    page.select_options(locator, option)
                except Exception:
                    # fallback: try selecting by visible text via JS or clicking option - adapt if necessary
                    page.select_options(locator, option)
            else:
                page.fill(locator, str(value))

        return "Entered %d fields" % (len(fields),)
            
def get_variables():
    today = date.today().strftime("%Y-%m-%d")
    tomorrow = (date.today() + timedelta(days=1)).strftime("%Y-%m-%d")
    return {
        "BOOKING_DATA_01": {
            "select.type": "Meeting",
            "select.status": "Booked",
            "input.date": today,
            "input.time": "14:30",
            "input.duration": 30,
            "input.reason": "Need wheelchair support"
        }
    }
