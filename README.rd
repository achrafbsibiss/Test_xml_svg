# 📘 XML Meteo Project

A comprehensive demonstration of XML technologies for modeling, validating, transforming, and visualizing meteorological data.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 📌 Overview

This project showcases the complete XML technology stack:
- **XML** for structured data modeling
- **DTD & XSD** for schema validation
- **XPath** for data querying
- **XSLT** for HTML/SVG transformation
- **SVG** for dynamic data visualization

**Use Case:** Meteorological data management with automatic chart generation from weather measurements across Moroccan cities.

---

## 🎯 Features

- ✅ Valid XML structure with proper schemas
- ✅ Dual validation (DTD + XSD)
- ✅ Dynamic SVG bar charts
- ✅ HTML report generation
- ✅ XPath query examples
- ✅ Real-time data visualization

---

## 📋 Prerequisites

Before running this project, ensure you have:

- **libxslt** (for `xsltproc` command)
  ```bash
  # Ubuntu/Debian
  sudo apt-get install xsltproc
  
  # macOS
  brew install libxslt
  
  # Windows
  # Download from http://xmlsoft.org/XSLT/
  ```
- A modern web browser (Chrome, Firefox, Safari)
- Text editor or IDE (VS Code recommended)

---

## 📁 Project Structure

```
xml-meteo-project/
├── data/
│   └── meteo.xml          # Weather measurements data
├── schemas/
│   ├── meteo.dtd          # DTD validation schema
│   └── meteo.xsd          # XSD validation schema
├── transforms/
│   └── meteo.xsl          # XSLT transformation stylesheet
├── output/
│   ├── index.html         # Generated HTML report
│   └── chart.svg          # Generated SVG chart
├── screenshots/
│   ├── validation.png     # Schema validation example
│   └── visualization.png  # SVG chart output
└── README.md
```

---

## 🗂️ XML Data Structure

The XML file contains weather measurements organized by date and city:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<meteo>
    <mesure date="2025-01-01">
        <ville nom="Agadir" temperature="40" />
        <ville nom="Tanger" temperature="13" />
        <ville nom="El Jadida" temperature="30" />
    </mesure>
</meteo>
```

**Elements:**
- `<meteo>` — Root element containing all measurements
- `<mesure>` — Single measurement session with date attribute
- `<ville>` — City data with name and temperature attributes

---

## 🏗️ Validation Schemas

### DTD (Document Type Definition)

Defines the structural rules:

```dtd
<!ELEMENT meteo (mesure+)>
<!ELEMENT mesure (ville+)>
<!ATTLIST mesure date CDATA #REQUIRED>
<!ELEMENT ville EMPTY>
<!ATTLIST ville 
    nom CDATA #REQUIRED 
    temperature CDATA #REQUIRED>
```

### XSD (XML Schema Definition)

Provides type-safe validation:

```xml
<xs:element name="ville">
    <xs:complexType>
        <xs:attribute name="nom" type="xs:string" use="required"/>
        <xs:attribute name="temperature" type="xs:double" use="required"/>
    </xs:complexType>
</xs:element>
```

**Key Types Used:**
- `xs:date` — ISO 8601 date format
- `xs:string` — City names
- `xs:double` — Temperature values

---

## 🔍 XPath Query Examples

Extract data using XPath expressions:

```xpath
# Get all city names
//ville/@nom

# Get all temperatures
//ville/@temperature

# Filter cities with temperature > 20°C
//ville[@temperature > 20]/@nom

# Get measurements from specific date
//mesure[@date='2025-01-01']/ville

# Calculate average temperature
sum(//ville/@temperature) div count(//ville)
```

---

## 🔄 XSLT Transformation

The stylesheet (`meteo.xsl`) transforms XML into interactive HTML with embedded SVG charts.

**Transformation Process:**
1. Parses XML weather data
2. Generates HTML structure
3. Creates SVG bar chart with dynamic dimensions
4. Adds labels and styling

**Key XSLT Features Used:**
- `<xsl:for-each>` — Iterate through cities
- `<xsl:value-of>` — Extract attribute values
- `<xsl:attribute>` — Dynamic SVG attributes
- Math calculations for bar dimensions

---

## 📊 SVG Visualization

The generated chart displays temperature data as colored bars:

```svg
<svg width="800" height="400">
    <rect x="50" y="10" width="40" height="200" fill="orange"/>
    <text x="55" y="220">Agadir</text>
    <text x="55" y="5">40°C</text>
</svg>
```

**Chart Features:**
- Dynamic bar heights based on temperature
- Color-coded bars (hot = red/orange, cold = blue)
- City labels and temperature values
- Responsive scaling

---

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/achrafbsibiss/xml-meteo-project.git
cd xml-meteo-project
```

### 2. Validate XML

```bash
# Validate against DTD
xmllint --dtdvalid schemas/meteo.dtd data/meteo.xml --noout

# Validate against XSD
xmllint --schema schemas/meteo.xsd data/meteo.xml --noout
```

### 3. Transform XML to HTML

```bash
xsltproc transforms/meteo.xsl data/meteo.xml > output/index.html
```

### 4. View Results

```bash
# Open in default browser
open output/index.html        # macOS
xdg-open output/index.html    # Linux
start output/index.html       # Windows
```

---

## 📸 Screenshots

### Schema Validation
![XSD Validation](screenshots/validation.png)
*XML validation using XSD schema showing successful structure verification*

### Data Visualization
![SVG Chart Output](screenshots/visualization.png)
*Interactive bar chart showing temperature distribution across Moroccan cities*

---

## 🧪 Sample Output

**Temperature Data:**
- Agadir: 40°C ☀️
- Tanger: 13°C 🌤️
- El Jadida: 30°C ☀️
- Casablanca: 13°C 🌤️
- Mohammedia: 20°C 🌤️
- Oujda: 1°C ❄️
- Ifrane: 15°C 🌤️
- Marrakech: 3°C ❄️

---

## 🛠️ Customization

### Modify Temperature Data

Edit `data/meteo.xml`:

```xml
<ville nom="YourCity" temperature="25" />
```

### Change Chart Colors

Edit `transforms/meteo.xsl` SVG fill attribute:

```xml
<xsl:attribute name="fill">
    <xsl:choose>
        <xsl:when test="@temperature &gt; 30">red</xsl:when>
        <xsl:otherwise>blue</xsl:otherwise>
    </xsl:choose>
</xsl:attribute>
```

### Add New Cities

Simply add more `<ville>` elements to any `<mesure>` group.

---

## 📚 Learning Resources

- [W3C XML Specification](https://www.w3.org/XML/)
- [XPath Tutorial](https://www.w3schools.com/xml/xpath_intro.asp)
- [XSLT Reference](https://www.w3.org/TR/xslt-30/)
- [SVG Documentation](https://developer.mozilla.org/en-US/docs/Web/SVG)

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 👤 Author

**Achraf Bsibiss**
- GitHub: [@achrafbsibiss](https://github.com/achrafbsibiss)

---

## 🙏 Acknowledgments

- XML/XSD schemas based on W3C standards
- SVG visualizations inspired by D3.js patterns
- Project created for educational purposes

---
