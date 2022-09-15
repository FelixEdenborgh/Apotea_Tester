import xlwings as xw  # pip install xlwings


EXCEL_FILE = ('C:\Users\FelixEdenborgh\Downloads\Interview\Interview\SplitExcel_Sheets_into_separate_Workbooks\data.xls').parent / 'YOUR_EXCEL_FILE.xlsx'
OUTPUT_DIR = ('C:\Users\FelixEdenborgh\Downloads\Interview\Interview\SplitExcel_Sheets_into_separate_Workbooks').parent / 'Output'

# Create Output directory
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

with xw.App(visible=False) as app:
    wb = app.books.open(EXCEL_FILE)
    for sheet in wb.sheets:
        wb_new = app.books.add()
        sheet.copy(after=wb_new.sheets[0])
        wb_new.sheets[0].delete()
        wb_new.save(OUTPUT_DIR / f'{sheet.name}.xlsx')
        wb_new.close()p.quit()