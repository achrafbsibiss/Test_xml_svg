# 📘 XML Meteo Project — Repository README

This repository contains a complete learning project demonstrating the use of **XML**, **DTD**, **XSD**, **XPath**, **XSLT**, and **SVG** to model, validate, transform, and visualize meteorological data. **XML**, **DTD**, **XSD**, **XPath**, **XSL**, and **SVG** to model and visualize meteorological data.

---

## 📌 Project Overview
This project demonstrates how to:
- Model structured data using **XML**
- Validate data using **DTD** and **XSD**
- Extract information using **XPath**
- Transform XML into HTML/SVG using **XSLT**
- Generate graphics (bar charts) using **SVG** created from XSL

The project is based on a meteorological dataset: a list of cities (*T_VILLE*) and measurements (*T_MESURE*) such as temperatures.

---
![alt text](https://github.com/achrafbsibiss/Test_xml_svg/blob/main/image_xsd.png)
![alt text](https://github.com/achrafbsibiss/Test_xml_svg/blob/main/image_svg.png)
## 🗂️ 1. XML Structure
The XML file stores weather measurements. Example:
```xml
<meteo>
    <mesure date="2025-01-01">
        <ville nom="Agadir" temperature="40" />
        <ville nom="Tanger" temperature="13" />
        <ville nom="El Jadida" temperature="30" />
    </mesure>
</meteo>
```
Elements:
- `<meteo>` root element
- `<mesure>` describes one date of measurements
- `<ville>` gives city name + temperature

---

## 🏗️ 2. DTD Validation
The DTD ensures the XML follows a fixed structure.
Example:
```dtd
<!ELEMENT meteo (mesure+)>
<!ELEMENT mesure (ville+)>
<!ATTLIST mesure date CDATA #REQUIRED>
<!ELEMENT ville EMPTY>
<!ATTLIST ville nom CDATA #REQUIRED temperature CDATA #REQUIRED>
```

---

## 📏 3. XSD Validation
XSD describes types: dates, strings, double, etc.

Key types used:
- `xsd:date`
- `xsd:string`
- `xsd:double`

---

## 🔍 4. XPath Queries
Some example XPath expressions used:
- Get all city names:
  ```xpath
  //ville/@nom
  ```
- Get all temperatures:
  ```xpath
  //ville/@temperature
  ```
- Get cities hotter than 20°C:
  ```xpath
  //ville[@temperature > 20]
  ```

---

## 🔄 5. XSL Transformation (XSLT)
XSLT transforms the XML into:
- HTML tables
- SVG graphics (bar charts)

Example of applying a stylesheet:
```bash
xsltproc meteo.xsl meteo.xml > index.html
```

The XSL reads XML values, loops through `<ville>` and generates SVG rectangles.

---

## 📊 6. SVG Bar Chart Generation
SVG is used to draw a bar chart of temperatures.
Example of generated SVG:
```svg
<rect x="50" y="10" width="40" height="200" fill="orange" />
```
Each `<rect>` corresponds to a city.

The XSL calculates:
- Height of each bar from the temperature value
- X-position for city spacing
- Labels (`<text>`) for names and values

Result looks like this (from your screenshot):
- Agadir: 40°C
- Tanger: 13°C
- El Jadida: 30°C
- Casablanca: 13°C
- Mohammedia: 20°C
- Oujda: 1°C
- Ifrane: 15°C
- Marrakech: 3°C

---

## 📁 7. Files Included
- **meteo.xml** — data
- **meteo.dtd** — DTD validator
- **meteo.xsd** — XSD validator
- **meteo.xsl** — transformation to HTML + SVG
- **README.md** — documentation
- **output.svg / index.html** — generated graphics

---

## 🚀 8. How to Run
Run the XSL transformation:
```bash
xsltproc meteo.xsl meteo.xml > result.html
```
Open `result.html` in browser.

---

## ✔️ Conclusion
This project is a complete demonstration of how to:
- Model data in XML
- Validate using DTD and XSD
- Query using XPath
- Transform using XSLT
- Visualize using SVG

A great base learning project for mastering XML technologies.

---
If you want, I can generate the full folder structure, improve your XSL, or export this README as **PDF**, **DOCX**, or **Markdown file**.

