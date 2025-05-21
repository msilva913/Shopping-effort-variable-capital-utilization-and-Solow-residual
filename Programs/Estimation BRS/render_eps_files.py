from PIL import Image

# Open an EPS file and save it as PDF
img = Image.open('BRS_sectoral_mdiag.eps')
img.save('BRS_sectoral_mdiag.pdf', resolution=2400)
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

import fitz  # PyMuPDF

def eps_to_pdf_pymupdf(eps_file, pdf_file):
    """
    Convert EPS to PDF using PyMuPDF.
    
    Args:
        eps_file (str): Path to the input EPS file
        pdf_file (str): Path to the output PDF file
    """
    # Open the EPS file
    doc = fitz.open(eps_file)
    
    # Save as PDF with high quality
    doc.save(pdf_file, garbage=4, deflate=True, clean=True)
    doc.close()
    print(f"Successfully converted {eps_file} to {pdf_file}")
    


from reportlab.graphics import renderPDF
from reportlab.graphics.shapes import Drawing
from reportlab.lib.utils import ImageReader

def eps_to_pdf_reportlab(eps_file, pdf_file):
    """
    Convert EPS to PDF using reportlab.
    
    Args:
        eps_file (str): Path to the input EPS file
        pdf_file (str): Path to the output PDF file
    """
    # Create a drawing with the same dimensions as the EPS
    drawing = Drawing(400, 400)  # Default size, will be adjusted
    
    # Add the EPS to the drawing
    drawing.add(ImageReader(eps_file))
    
    # Render the drawing to a PDF
    renderPDF.drawToFile(drawing, pdf_file)
    print(f"Successfully converted {eps_file} to {pdf_file}")


eps_to_pdf_reportlab("BRS_sectoral_mdiag.eps", "BRS_sectoral_mdiag.pdf")