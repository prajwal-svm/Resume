# LaTeX Resume Template

A clean, modern LaTeX resume template optimized for Applicant Tracking Systems (ATS) and PDF parsers.

## Prerequisites

Before you begin, ensure you have the following installed based on your operating system:

### macOS
```bash
# Install MacTeX
brew install --cask mactex

# Install additional tools
brew install qpdf poppler

# Refresh your shell to use newly installed commands
exec $SHELL
```

### Linux (Ubuntu/Debian)
```bash
# Install TeX Live and related packages
sudo apt-get update
sudo apt-get install texlive-full
sudo apt-get install latexmk
sudo apt-get install qpdf
sudo apt-get install poppler-utils

# For other distributions, use your package manager
# Fedora: dnf install texlive-scheme-full qpdf poppler-utils
# Arch: pacman -S texlive-most qpdf poppler
```

### Windows
1. Install MiKTeX from https://miktex.org/download
2. Install QPDF:
   - Download from https://github.com/qpdf/qpdf/releases
   - Add to PATH during installation
3. Install Poppler (for pdfinfo):
   - Using Chocolatey: `choco install poppler`
   - Or download from https://blog.alivate.com.au/poppler-windows/
   - Add to PATH after installation
4. Install Make:
   - Using Chocolatey: `choco install make`
   - Or using Scoop: `scoop install make`

## Getting Started

1. Clone the repository:
```bash
git clone https://github.com/Prajwal-S-Venkatesh/Resume.git
cd Resume
```

2. Customize the resume:
   - Open `resume.tex` in your preferred editor
   - Update the content with your information
   - Modify styling if needed

3. Generate PDF:
```bash
make clean && make
```

The output will be generated as `PRAJWAL_MURTHY_RESUME.pdf` in the root directory.

## Verifying PDF Metadata

After generating the PDF, the Makefile automatically runs metadata checks. You can also manually check the metadata:

```bash
pdfinfo PRAJWAL_MURTHY_RESUME.pdf
```

Expected output should show:
```
Title:           [Your Name] - Software Engineer Resume
Subject:         Software Engineering Resume
Keywords:        software engineer, [your keywords]
Author:          [Your Name]
Creator:         pdfLaTeX
Producer:        LaTeX
...
Optimized:       yes
PDF version:     1.5
```

If you see `Optimized: no`, run the optimization again:
```bash
make optimize
```

## Features

- ATS-friendly PDF output
- Responsive design
- Optimized metadata for better parsing
- Clean, modern layout
- Easy to customize
- Proper section spacing
- Clickable links
- Well-documented TeX code

## Customization

### Changing the Output Filename
Modify the `OUTPUT` variable in the Makefile:
```makefile
OUTPUT = YOUR_NAME_RESUME.pdf
```

### Modifying Margins
Adjust the geometry package settings in `resume.tex`:
```latex
\usepackage[top=0.4in,bottom=0.4in,left=0.4in,right=0.4in]{geometry}
```

### Changing Colors
Modify the hyperref settings for link colors:
```latex
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue
}
```

## PDF Metadata

The template includes optimized PDF metadata for better ATS parsing:
- Title
- Author
- Keywords
- Subject
- Creator
- Producer

You can customize these in the `\hypersetup` section of the LaTeX file:
```latex
\hypersetup{
    unicode=true,
    pdfencoding=auto,
    pdftitle={Your Name - Software Engineer Resume},
    pdfauthor={Your Name},
    pdfsubject={Software Engineering Resume},
    pdfkeywords={your, keywords, here},
    pdfproducer={LaTeX},
    pdfcreator={pdfLaTeX}
}
```

## Troubleshooting

### Common Issues

1. **Missing Packages**
   ```bash
   # macOS
   sudo tlmgr update --self
   sudo tlmgr install <package-name>

   # Ubuntu/Debian
   sudo apt-get install texlive-latex-extra

   # Windows (MiKTeX)
   # Packages will be installed automatically when needed
   ```

2. **Make Command Not Found**
   ```bash
   # macOS
   brew install make

   # Ubuntu/Debian
   sudo apt-get install make

   # Windows
   choco install make
   ```

3. **PDF Metadata Check Failed**
   ```bash
   # Install poppler tools
   # macOS
   brew install poppler
   
   # Ubuntu/Debian
   sudo apt-get install poppler-utils
   
   # Windows
   choco install poppler
   ```

### Error: File Not Found
Ensure all required LaTeX packages are installed. The template uses:
- fontenc
- helvet
- enumitem
- hyperref
- geometry
- titlesec
- xhfill
- ragged2e

### Error: PDF Not Optimized
If you see "Optimized: no" in the metadata check:
```bash
make optimize
```
This will run QPDF optimization again.

## Build System

The Makefile includes several targets:
```makefile
make        # Builds and optimizes the PDF
make clean  # Removes all generated files
```

The full build process:
1. Compiles LaTeX to PDF
2. Runs twice for proper cross-references
3. Optimizes PDF using QPDF
4. Verifies metadata using pdfinfo

## Contributing

Pull requests are welcome! For major changes, please open an issue first.

## License

[MIT](LICENSE)

## Acknowledgments

- LaTeX Project for the document preparation system
- QPDF for PDF optimization
- Poppler for PDF metadata tools