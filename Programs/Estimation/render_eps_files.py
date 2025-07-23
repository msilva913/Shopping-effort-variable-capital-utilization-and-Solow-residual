# from PIL import Image

# # Open an EPS file and save it as PDF
# img = Image.open('BRS_sectoral_mdiag.eps')
# img.save('BRS_sectoral_mdiag.pdf', resolution=600)
path = 'C:\\Users\\msilva913\Documents\\GitHub\\Shopping-effort-variable-capital-utilization-and-Solow-residual\\Programs\Estimation BRS\\'
input_file = path + 'BRS_sectoral_mdiag.eps'  # Update with your EPS file path
output_file = path + 'BRS_sectoral_mdiag.pdf'   # Update with your desired output PDF path

import subprocess

# Convert EPS to PDF with Ghostscript
subprocess.run([
    'gs', 
    '-sDEVICE=pdfwrite', 
    '-dNOPAUSE', 
    '-dBATCH', 
    '-dPDFSETTINGS=/prepress',  # Use /screen, /ebook, /printer, or /prepress for quality
    '-sOutputFile='+output_file, 
    input_file
])