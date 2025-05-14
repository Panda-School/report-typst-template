#import "../lib.typ": *

#let abstractDict = (
  body: lorem(150),
  keywords: ("Hey", "How", "Are", "You?")
)

#show: it => basic-report(
  doc-category: "Bachelor Thesis",
  doc-title: "Open-Domain Counterfactual Image Generation from Neutral Natural Language Descriptions",
  title-size: 25pt,
  author: "Bas van't Hazeveld (7341628)",
  affiliation: "BSc Artificial Intelligence, UU",
  first-examiner: "Prof. Dr. Denis Paperno",
  second-examiner: "Dr. Ece Takmaz",
  abstract: abstractDict,
  heading-color: rgb("#C00A35"),
  logo: image("assets/aerospace-engineering.png", width: 2cm),
  // <a href="https://www.flaticon.com/free-icons/aerospace" title="aerospace icons">Aerospace icons created by gravisio - Flaticon</a>
  language: "en",
  compact-mode: false,
  it
)

= Introduction

#lorem(120)

#lorem(150)

== Fluggeräte

#lorem(100)

=== Raketen – Eine Übersicht

#lorem(80)

#pagebreak()

= Methodology

#lorem(150)

== Data collection

#lorem(90)

== Data analysis

#lorem(500)


=== Die wichtigsten Knöpfe und Hebel

#lorem(150)

#pagebreak()

= Results

#pagebreak()

= Discussion

#pagebreak()

= Conclusion

#pagebreak()

= Discussion

#pagebreak()

#bibliography("ref.bib", style: "american-psychological-association", full: true)


