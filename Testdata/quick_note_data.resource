*** Settings ***
Documentation    Test data for Adding a quicknote (TC00005_Diary_Add Quicknote)

*** Variables ***
&{QUICK_NOTE_TEST_DATA}
    booking_id=BOOKING12345
    patient_name=Test Patient
    note_text=Test@123
    image_path=resources/test_images/quicknote_sample.png
    pdf_path=resources/test_pdfs/quicknote_attachment.pdf
    expected_result=Quick Note is auto completed and a print out should render with the image added, the text added (Test@123) and the PDF added.
